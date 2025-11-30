/// @description Update SIRR visited status when entering a new room.

// Get the name of the current room from the shared room_mappings struct.
var current_planet_name = variable_struct_get(global.room_mappings, room);

// If the current room is a valid planet, set its SIRR visited status to true.
if (current_planet_name != undefined && variable_struct_exists(global.sirr_visited, current_planet_name)) {
    variable_struct_set(global.sirr_visited, current_planet_name, true);
}