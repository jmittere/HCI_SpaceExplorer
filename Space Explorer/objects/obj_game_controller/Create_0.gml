//Game controller keeps all global variables and game state for progress tracking
persistent = true;

global.game = {
    score: 0,
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

global.planet_info = {
    Sun: {
        has_rings: false,
        moons: 0,
        surface: "Plasma"
    },
    Mercury: {
        has_rings: false,
        moons: 0,
        surface: "Rocky, cratered"
    },
    Venus: {
        has_rings: false,
        moons: 0,
        surface: "Acidic, volcanic"
    },
    Earth: {
        has_rings: false,
        moons: 1,
        surface: "Oceans, land"
    },
    Moon: {
        has_rings: false,
        moons: 0,
        surface: "Dry, dusty, rocky"
    },
    Mars: {
        has_rings: false,
        moons: 2,
        surface: "Dusty, desert"
    },
    Jupiter: {
        has_rings: true,
        moons: 95,
        surface: "Gas giant"
    },
    Saturn: {
        has_rings: true,
        moons: 83,
        surface: "Gas giant with icy rings"
    },
    Uranus: {
        has_rings: true,
        moons: 27,
        surface: "Ice giant"
    },
    Neptune: {
        has_rings: true,
        moons: 14,
        surface: "Ice giant"
    }
};