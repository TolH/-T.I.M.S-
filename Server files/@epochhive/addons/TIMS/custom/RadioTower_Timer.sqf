/*
										-=TolH=- 
									(RadioTower_Timer.sqf)
									Track RadioTower Timer.
				Usage: 
				nul_script8 = [] execVM RADIOTOWER_TIMER;
				
				This will ADD reinforcment to the radiotower area every X minutes.
				If AI Take radiotower back, TIMER resetart.
*/
//============================================////============================================//
	//START RADIOTOWER_TIMER
	RTcountAI = 0;
	RTcountPL = 0;
		//START MAIN TIMER
		while {RADIOTOWER_StartTimer >= 1} do 
		{
			//START AI TIMER
			while {RADIOTOWER_StartTimer isEqualTo 2} do 
			{
			  RTcountAI = RTcountAI + 1;
			  uiSleep 1;
				//TOWER HELD FOR X MINUTES BY AI
				if (RTcountAI isEqualTo TOWER_CAPTURE_TIME_AI) then 
				{
					//AI CAPTURED
					showNotification = ["RadioTowerTakenByAI", "The AI held the radiotower for over 15mins and captured it."]; publicVariable "showNotification";
					"Radio-Tower" setMarkerColor "ColorOrange";
					"Radio-Tower" setMarkerText " (Captured by: (AI) No Bonus MP!";
					//LAST TIMER REACHED CLAIM RADIOTWER AI AND STOP MAIN MISSION CHECK
					RADIOTOWER_CLAIMED = 1;
					//STOP TIMER EXIT SECONDARY LOOP
					RADIOTOWER_StartTimer = 0;
				};
			};
			//START PLAYER TIMER
			while {RADIOTOWER_StartTimer isEqualTo 3} do 
			{
			  RTcountPL = RTcountPL + 1;
			  uiSleep 1;
				//TOWER HELD FOR X MINUTES BY PLAYERS
				if (RTcountPL isEqualTo TOWER_CAPTURE_TIME_PL) then 
				{
					//PLAYER CAPTURED
					showNotification = ["RadioTowerTakenByPlayer", "Players held the radiotower for over 15mins and captured it!"]; publicVariable "showNotification";
					//LAST TIMER REACHED CLAIM RADIOTWER PLAYER AND STOP MAIN MISSION CHECK
					"Radio-Tower" setMarkerColor "ColorGreen";
					"Radio-Tower" setMarkerText " (Captured by: (Players) +500MP!";
					RADIOTOWER_CLAIMED = 2;
					//STOP TIMER EXIT SECONDARY LOOP
					RADIOTOWER_StartTimer = 0;
				};
			};
		};