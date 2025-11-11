/// Draw GUI: Dynamic Planet Table

var planet_names = variable_struct_get_names(global.visited);

var row_x = 225;
var row_y = 150;
var row_h = 48;

//column x positions
var col_name    = row_x;
var col_visited = row_x + 150;
var col_rings   = row_x + 250;
var col_moons   = row_x + 330;
var col_surface = row_x + 400;


draw_set_font(SIRRDBHeaderFont)

// draw headers for each column in SIRR DB
draw_text(col_name,    row_y, "Planet");
draw_text(col_visited, row_y, "Visited");
draw_text(col_rings,   row_y, "Rings");
draw_text(col_moons,   row_y, "Moons");
draw_text(col_surface, row_y, "Surface");

row_y += row_h;
draw_line(row_x, row_y, row_x + 700, row_y);
row_y += row_h;


draw_set_font(SIRRDBColumnFont)
// Rows
for (var i = 0; i < array_length(planet_names); i++)
{
    var pname = planet_names[i];
	
	//gets whether planets have been visited from obj_game_controller
    var visited = variable_struct_get(global.visited, pname);

    //gets static planet info for each planet that player has visited
    var info = variable_struct_get(global.planet_info, pname);

    //draw columns
    draw_text(col_name,    row_y, pname);
    draw_text(col_visited, row_y, visited ? "Yes" : "No");
    draw_text(col_rings,   row_y, info.has_rings ? "Yes" : "No");
    draw_text(col_moons,   row_y, string(info.moons));
    draw_text(col_surface, row_y, info.surface);

    row_y += row_h;
}
