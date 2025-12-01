//Handle initial delay
if (delay_timer < delay_time) {
    delay_timer += delta_time / 1000000; // Convert microseconds → seconds
    exit;
}

//Typewriter effect (after delay completes)
if (typed_index < string_length(full_msg)) {
    type_timer += delta_time / 1000000;
    
    if (type_timer >= type_speed) {
        type_timer = 0;
        typed_index += 1;
    }
}
