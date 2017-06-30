if (!isDedicated) exitWith {};
	private ["_playerCount"];
//============================================////============================================//
	//MISSION VARS
	CAPTURE_DEFEND_STARTED = 0;			//MISSION #1
	ZOMBRELLA_CORP_STARTED = 0;			//MISSION #2
	//START MISSION IF PLAYER COUNT >= ONLINE_PLAYERS AND MISSION_ISRUNNING = 0;
		while {true} do
		{
		  //WAIT 30 SECONDS
		  uiSleep 30;
			_playerCount = {alive _x} count playableUnits;
			//CHECK IF CAPTURE_DEFEND IS ALREADY STRATED, IF NOT START IT
			if ((_playerCount >= ONLINE_PLAYERS) && (CAPTURE_DEFEND_STARTED isEqualTo 0)) then 
			{
				mission_script1 = [] execVM "TIMS\missions\Missions\-=CAPTURE_DEFEND=-.sqf";
				//waitUntil {uiSleep 5; scriptDone mission_script1};
			};
		  //WAIT 120 SECONDS
		  uiSleep 120;
			//CHECK IF ZOMBRELLA_CORP_STARTED IS ALREADY STRATED, IF NOT START IT
			if ((_playerCount >= ONLINE_PLAYERS) && (ZOMBRELLA_CORP_STARTED isEqualTo 0)) then 
			{
				mission_script2 = [] execVM "TIMS\missions\Missions\-=ZOMBRELLA_CORP=-.sqf";
			};
		};
//============================================////============================================//