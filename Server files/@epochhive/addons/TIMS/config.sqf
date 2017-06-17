//============================================////============================================//
//=====================================//-CONFIG START-//=====================================//
//============================================////============================================//


//==================================//
	//MAIN SYSTEM CONFIG
		MISSIONS_SYSTEM 	= 1;			// ENABLE OR DISABLE MISSION SYSTEM (Default 1=Enabled)
		ONLINE_PLAYERS 		= 1;			// NEED THIS AMOUNT OF PLAYER TO START A MISSION (Default 1)
		DEBUG_RPT 			= 1;			// ENABLE OR DISABLE RPT CONSOLE LOG INFO ABOUT MISSION EVENTS (Default 1=Enabled)
		SERVER_LOAD_WAIT	= 60;   		// WAIT TIME BEFORE STARTING MISSION SYSTEM AFTER A SERVER RESTART. (Default 300=5MINUTES)
		MISSION_CLEAN_TIME	= 120;			// HOW MUCH TIME TO WAIT BEFORE CLEANING UP MISSION OBJECTS AND THEN START ANOTHER ONE. (Default 900=15MINUTES)
		
//==================================// 
	//OPTIONAL CONFIG
		LOOT_TRACKER 		= 1;			// ENABLE OR DISABLE LOOT_CRATE MOVING MARKER ON THE MAP. (Default 1=Enabled)

//==================================// 
	//SPECIFIC MISSION CONFIG
		//-----------------------------//
		//-TOWN MILITARIZATION MISSION-//
		//-----------------------------//
			RT_CLAIM_RADIUS 		= 50;			// THE RANGE IN METERS AT WICH THE RADIOTOWER CAN BE CAPTURED BY AI OR PLAYERS. (Default 50=50METERS)
			TOWER_CAPTURE_TIME_AI	= 600;			// THE TIME NEEDED FOR AI TO CAPTURE A MISSION OBJECTIVE. (Default 900=15MINUTES)
			TOWER_CAPTURE_TIME_PL	= 600;			// THE TIME NEEDED FOR PLAYERS TO CAPTURE A MISSION OBJECTIVE FOR BONUS +MP. (Default 900=15MINUTES)
			CLAIMING_GROUP			= 1;			// DROP AI TROOPS TO CLAIM ALL CLAIMABLE MISSION OBJECTIVES. (Default 1=Enabled)
			TOWER_BAR_TEST			= 1;			// ENABLE PROGRESS TIME BAR WHEN CAPTURING TOWER. VISUAL BAR BOTTOM RIGHT.
			//ADVANCED CONFIG FOR CLAIMING_GROUP
				CLAIMING_GROUP_NUMBER   = 2; //(1,2,3)		// NUMBER OF GROUP TO SEND. 1 FOR NOW, ONLY 1 CLAIMABLE BUILDING SETUP! (Default 1) MAX 3.
				/*1*/AI_SF_CG_WAVE_1	= [120, 5, 0.10];	// [TIMER, AI_NUMBER, AI_SKILLS] SET AI_SF_CG_WAVE_1 SETTINGS. Default=[300, 5, 0.10]; 	5MINS+5(AI)
				/*2*/AI_SF_CG_WAVE_2	= [300, 5, 0.10];	// [TIMER, AI_NUMBER, AI_SKILLS] SET AI_SF_CG_WAVE_2 SETTINGS. Default=[600, 5, 0.10];	10MINS+5(AI)
				/*3*/AI_SF_CG_WAVE_3	= [900, 5, 0.10];	// [TIMER, AI_NUMBER, AI_SKILLS] SET AI_SF_CG_WAVE_3 SETTINGS. Default=[900, 5, 0.10];	15MINS+5(AI)
			//

//============================================////============================================//
//======================================//-CONFIG END-//======================================//
//============================================////============================================//





				// REMINDER ALL AISKILLS (FIXED SKILLS FOR NOW)
				// AISKILLS ALL [0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0]