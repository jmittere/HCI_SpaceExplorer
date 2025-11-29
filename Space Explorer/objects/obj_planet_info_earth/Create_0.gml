// How long to wait before starting (in seconds)
delay_time = 6;
delay_timer = 0;

// Typewriter settings
type_speed = 0.05;  // seconds per character
type_timer = 0;
typed_index = 0;

// Store the full message that will be typed out
full_msg = variable_struct_get(global.planet_descriptions, "Earth");