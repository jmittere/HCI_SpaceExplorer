variable_struct_set(global.visited, "Mars", false);

sprite_index = spr_unvisit_button_selected;
// Draw the text centered on top
button_text = "Unvisited"
var text_w = string_width(button_text);
var text_h = string_height(button_text);

//var text_x = x + ((sprite_get_width(sprite_index)*0.2652124 - text_w) / 2);
//var text_y = (y + (sprite_get_height(sprite_index)*0.2652124 - text_h) / 2);

var text_x = (x+10) + (sprite_get_width(sprite_index)*0.1652124 - text_w) / 2;
var text_y = y + (sprite_get_height(sprite_index)*0.155814 - text_h) / 2;
draw_text(text_x, text_y, button_text);