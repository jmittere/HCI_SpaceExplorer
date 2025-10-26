///@description Interact - change room left

// Check if a prev room exists before attempting to go to it
    if (room_exists(room_previous(room)))
    {
        room_goto_previous();
    }
    else
    {
        // Handle the case where there is no prev room (e.g., go back to the first room)
        room_goto(rm_earth_home); // Assuming 'Room_Start' is the name of your first room
    }