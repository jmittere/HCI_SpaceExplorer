//increases number of characters show in each frame
type_timer += type_speed;

if (type_timer >= 1) {
    type_timer -= 1;
    typed_index += 1;

    if (typed_index > string_length(msg)) { //if we are done writing the msg, shown_text becomes the whole string
        typed_index = string_length(msg);
    }
}