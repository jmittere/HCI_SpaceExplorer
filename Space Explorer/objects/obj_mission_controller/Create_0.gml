/// @description Mission Controller - Manages mission progress and badges
// This controller is separate from obj_game_controller to avoid conflicts
persistent = true;

// If true, clear progress on every new run by deleting the saved INI file.
global.reset_on_start = true;

global.missions = {
    visited_mars: false,
    visited_gas_giants: false,
	visited_ice_giants: false,
	visited_inner_planets: false,
	visited_sun: false,
    visited_all_planets: false,
};

// Define explicit mission order so we can enforce sequential unlocking.
global.mission_order = [
    "visited_mars",
    "visited_gas_giants",
    "visited_ice_giants",
    "visited_inner_planets",
    "visited_sun",
    // Make the 'visit all planets' mission the last one so completing it doesn't
    // immediately cause earlier missions to be awarded in the same tick.
    "visited_all_planets"
];

// Helper: returns true if the given mission is unlocked (i.e. all prior missions in
// global.mission_order are completed). First mission is always unlocked.
global.mission_is_unlocked = function(mission_id) {
    var order = global.mission_order;
    var idx = -1;
    for (var i = 0; i < array_length(order); i++) {
        if (order[i] == mission_id) {
            idx = i;
            break;
        }
    }
    // If mission not found, default to unlocked (avoid blocking unknown entries)
    if (idx == -1) return true;
    // If it's the first mission, it's unlocked by default
    if (idx == 0) return true;
    // Ensure all earlier missions are completed
    for (var j = 0; j < idx; j++) {
        var prior = order[j];
        if (!variable_struct_get(global.missions, prior)) return false;
    }
    return true;
};

// Save missions to an INI file so progress persists across sessions.
global.save_missions = function() {
    var fname = "missions.ini";
    ini_open(fname);
    var keys = variable_struct_get_names(global.missions);
    for (var i = 0; i < array_length(keys); i++) {
        var k = keys[i];
        var val = variable_struct_get(global.missions, k) ? 1 : 0;
        ini_write_real("missions", k, val);
    }
    ini_close();
};

// Load missions from the INI file if present. Keeps defaults otherwise.
global.load_missions = function() {
    var fname = "missions.ini";
    if (file_exists(fname)) {
        ini_open(fname);
        var keys = variable_struct_get_names(global.missions);
        for (var i = 0; i < array_length(keys); i++) {
            var k = keys[i];
            var def = variable_struct_get(global.missions, k) ? 1 : 0;
            var v = ini_read_real("missions", k, def);
            variable_struct_set(global.missions, k, (v == 1));
        }
        ini_close();
    }
};

// Mark a mission completed and persist immediately. Use this instead of direct assigns.
global.mission_set_completed = function(mission_id) {
    if (!variable_struct_get(global.missions, mission_id)) {
        variable_struct_set(global.missions, mission_id, true);
        // Persist change
        global.save_missions();
    }
};

// Load or reset mission progress now that `global.missions` exists
if (variable_global_exists("reset_on_start") && global.reset_on_start) {
    // Clear in-memory mission flags
    var _keys = variable_struct_get_names(global.missions);
    for (var _i = 0; _i < array_length(_keys); _i++) {
        variable_struct_set(global.missions, _keys[_i], false);
    }
    // Remove the saved file so progress is wiped between runs
    if (file_exists("missions.ini")) {
        file_delete("missions.ini");
    }
} else {
    global.load_missions();
}

global.mission_info = {
	visited_mars: "Red Planet Rover: Visit Mars.",
	visited_gas_giants: "Gas Giant Explorer: Visit Jupiter and Saturn.",
	visited_ice_giants: "Ice Giant Explorer: Visit Uranus and Neptune.",
	visited_inner_planets: "Inner Circle Tour: Visit Mercury, Venus, and Mars.",
	visited_sun: "Solar Flare: Bravely visit the Sun.",
    visited_all_planets: "Solar System Voyager: Visit every planet.",
};


// These will be the sprites for the badges you create
// Example: spr_badge_mars, spr_badge_voyager, etc.
// Make sure to import your badge images as sprites first.
global.badge_sprites = {
    // Safely get the sprite asset by name. If it doesn't exist, assign 'noone'.
    visited_mars: spr_badge_red_planet, 
    visited_gas_giants: spr_badge_gas_giants,
	visited_ice_giants: spr_badge_ice_giants,
	visited_inner_planets: spr_badge_inner_circle,
	visited_sun: spr_my_cool_sun_badge,
    visited_all_planets: spr_badge_voyager,
};

// Debug: print the badge mappings so you can verify at startup
show_debug_message("[BADGE MAP] Current badge mappings:");
var __bm = variable_struct_get_names(global.badge_sprites);
for (var __bi = 0; __bi < array_length(__bm); __bi++) {
    var __k = __bm[__bi];
    var __v = variable_struct_get(global.badge_sprites, __k);
    show_debug_message("[BADGE MAP] " + __k + " -> id=" + string(__v) + ", exists=" + string((__v != noone) && sprite_exists(__v)));
}
