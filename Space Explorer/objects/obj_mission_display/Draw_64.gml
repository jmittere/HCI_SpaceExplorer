/// @description Draw Missions and Badges on Profile Page

// Set initial drawing position and styles
var start_x = 200;
var start_y = 150;
var row_h = 85;
var badge_size = 80;


draw_set_font(SIRRDBHeaderFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the title for the mission section
draw_text(start_x, start_y - 50, "Space Missions");

// Set up for the badge collection
var badge_area_x = 1200; // Increased this to move the whole section right
var badge_area_y = 150;

draw_set_font(SIRRDBHeaderFont);
draw_set_halign(fa_center); // Center the title text
draw_text(badge_area_x, start_y - 50, "Mission Badges");
draw_set_halign(fa_left); // Set it back to left for mission text
// Get all the mission names from your global struct
var mission_names = variable_struct_get_names(global.missions);

// Loop through each mission to draw it
for (var i = 0; i < array_length(mission_names); i++) {
    var mission_id = mission_names[i];
    
    // Safely get data from the global structs using the mission_id string
    var mission_completed = variable_struct_get(global.missions, mission_id);
    var mission_desc = variable_struct_get(global.mission_info, mission_id);
    // Be defensive: if the helper isn't loaded yet, treat mission as unlocked to avoid crashes.
    var mission_unlocked = variable_global_exists("mission_is_unlocked") ? global.mission_is_unlocked(mission_id) : true;
    var badge_sprite = variable_struct_get(global.badge_sprites, mission_id);
    
    var current_y = start_y + (i * row_h);
    
    // --- Draw Mission Text ---
    draw_set_font(SIRRDBColumnFont);
    var text_color = mission_completed ? c_white : c_gray;
    var text_x_pos = start_x;
    // If locked, draw a clear locked hint. If unlocked, draw normally.
    if (!mission_unlocked) {
        draw_set_color(c_gray);
        draw_text(text_x_pos, current_y + 10, mission_desc + " (Locked)");
    } else {
        draw_set_color(text_color);
        // Draw the mission description
        draw_text(text_x_pos, current_y + 10, mission_desc);
    }
	
	// --- Draw the earned badge on the right if the mission is completed ---
	if (mission_completed && badge_sprite != noone && sprite_exists(badge_sprite)) {
		// Calculate scale to fit the badge_size
		var badge_scale = badge_size / sprite_get_width(badge_sprite);
		
		// Center the badge horizontally under the "Mission Badges" title
		var badge_x_centered = badge_area_x - (sprite_get_width(badge_sprite) * badge_scale) / 2;
		
		// Draw the specific badge for the completed mission
		draw_sprite_ext(badge_sprite, 0, badge_x_centered, current_y, badge_scale, badge_scale, 0, c_white, 1);
	}
	
    draw_set_color(c_white);
}

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);