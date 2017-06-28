if (!isDedicated) exitWith {};
	private ["_playerCount"];
//============================================////============================================//
	//MISSION VARS
	CAPTURE_DEFEND_STARTED = 0;
	ZOMBRELLA_CORP_STARTED = 0;
	//START MISSION IF PLAYER COUNT >= ONLINE_PLAYERS AND MISSION_ISRUNNING = 0;
		while {true} do
		{
		  //WAIT 30 SECONDS
		  uiSleep 30;
			_playerCount = {alive _x} count playableUnits;
			//CHECK IF CAPTURE_DEFEND IS ALREADY STRATED, IF NOT START IT
			if ((_playerCount >= ONLINE_PLAYERS) && (CAPTURE_DEFEND_STARTED isEqualTo 0) && (ZOMBRELLA_CORP_STARTED isEqualTo 0)) then 
			{
				mission_script1 = [] execVM "TIMS\missions\Missions\-=CAPTURE_DEFEND=-.sqf";
				uiSleep 15;
				mission_script2 = [] execVM "TIMS\missions\Missions\-=ZOMBRELLA_CORP=-.sqf";
				waitUntil {uiSleep 5; scriptDone mission_script1};
			};
			//IF NOT ENOUGH PLAYER THEN WAIT
			if (_playerCount < ONLINE_PLAYERS) then 
			{
				if (DEBUG_RPT == 1) then 
				{
					diag_log "-=T.I.M.S=-: NOT ENOUGH PLAYER TO START A MISSION, AT LEAST 1 PLAYER IS NEEDED. Rechecking in 30 seconds...";
				};
			};
		};
//============================================////============================================//