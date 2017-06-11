//============================================////============================================//
//=====================================//-CONFIG START-//=====================================//
//============================================////============================================//


//==================================//
	//MAIN SYSTEM CONFIG
		MISSIONS_SYSTEM 	= 1;			// ENABLE OR DISABLE MISSION SYSTEM (Default 1=Enabled)
		ONLINE_PLAYERS 		= 1;			// NEED THIS AMOUNT OF PLAYER TO START A MISSION (Default 1)
		DEBUG_RPT 			= 1;			// ENABLE OR DISABLE RPT CONSOLE LOG INFO ABOUT MISSION EVENTS (Default 1=Enabled)
		SERVER_LOAD_WAIT	= 60;   		// WAIT TIME BEFORE STARTING MISSION SYSTEM AFTER A SERVER RESTART. (Default 300=5MINUTES)
		MISSION_CLEAN_TIME	= 60;			// HOW MUCH TIME TO WAIT BEFORE CLEANING UP MISSION OBJECTS AND THEN START ANOTHER ONE. (Default 900=15MINUTES)
		
//==================================// 
	//OPTIONAL CONFIG
		LOOT_TRACKER 		= 1;			// ENABLE OR DISABLE LOOT_CRATE MOVING MARKER ON THE MAP. (Default 1=Enabled)

//==================================// 
	//HELI_PARADROP CONFIGS
		HELI_PARADROP		= 1;			// DROP 3 WAVES OF AI GROUP BY HELICOPTER ON A RANDOM PLAYER IF THE RADIOTOWER IS TAKEN BY AI. (Default 1=Enabled)
			//ADVANCED PARADROP AI CONFIG
			HP_WAVE_1	= [60, 5, 0.10];	// [TIME1,AINUMBER,SKILLS] SET WAVE_1 SETTINGS. Default=5MINS+5(AI)   [300, 5, 0.10]
			HP_WAVE_2	= [600, 6, 0.50];	// [TIME2,AINUMBER,SKILLS] SET WAVE_2 SETTINGS. Default=10MINS+6(AI)  [600, 6, 0.15]
			HP_WAVE_3	= [900, 7, 1.00];	// [TIME3,AINUMBER,SKILLS] SET WAVE_3 SETTINGS. Default=15MINS+7(AI)  [900, 7, 0.20]
//==================================//  


//============================================////============================================//
//======================================//-CONFIG END-//======================================//
//============================================////============================================//





				// REMINDER ALL AISKILLS (FIXED SKILLS FOR NOW)
				// AISKILLS ALL [0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0]
				// _select  0   1   2
				//        [300, 5, 0.10];
				//    [TIME,AINUMBER,SKILLS]
				//
				//			-=CONFIG TO ADD=-
				//ADD RANDOMIZED AISKILLS SETTINGS AND ADVANCED SKILLS SETTING
				//AISKILLS CHANGE DEPENDING ON NUMBER OF PLAYER ONLINE
				//MAKE 3dTools VehicleESP from AH AVAILABLE TO EVERYONE ?!