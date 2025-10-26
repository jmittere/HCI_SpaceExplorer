//Game controller keeps all global variables and game state for progress tracking
persistent = true;

global.game = {
    score: 0,
    level: 1,
    location: "Earth",
    has_key: false,
    inventory: []
};


//Used for tracking of SIRRs database
global.visited = {
	Sun: false,
	Mercury: false,
	Venus: false,
	Earth: true, 
	Moon: false,
	Mars: false,
	Jupiter: false,
	Saturn: false,
	Uranus: false,
	Neptune: false
}
