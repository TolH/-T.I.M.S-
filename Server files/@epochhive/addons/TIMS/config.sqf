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
	//SPECIFIC MISSION CONFIG
		//
		//-TOWN MILITARIZATION-
		//
		RT_CLAIM_RADIUS 	= 50;			// THE RANGE IN METERS AT WICH THE RADIOTOWER CAN BE CAPTURED BY AI AND PLAYER. (Default 50=50METERS)
		HELI_PARADROP		= 1;			// DROP AI TROOPS TO CLAIM THE RADIOTOWER. (Default 1=Enabled)
			//ADVANCED CONFIG FOR HELI_PARADROP
			HP_WAVE_1	= [300, 10, 0.10];	// [TIMER,AINUMBER,SKILLS] SET WAVE_1 SETTINGS. Default=5MINS+10(AI)   [300, 10, 0.10]
		
			
			
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