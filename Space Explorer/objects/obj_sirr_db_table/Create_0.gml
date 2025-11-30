/// @description Initializes and manages the SIRR database feature.

// Make this controller persistent to exist across all rooms.
persistent = true;

// Used for tracking of SIRR database, separate from mission progress.
// This is now owned and managed entirely by the SIRR feature.
global.sirr_visited = {
	Sun: false,
	Mercury: false,
	Venus: false,
	Earth: false, 
	Mars: false,
	Jupiter: false,
	Saturn: false,
	Uranus: false,
	Neptune: false
};