//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
// ZOMBIE TIME
// 
// TOWN INFESTATION CLEANING JOB
//============================================////============================================//
private ["_towns1","_RandomTownPosition1","_Zombie_Trigger_1_default_POS","_Mission_Zombie_marker_Town1_01","_Mission_Zombie_marker_Town1_02","_Mission_Zombie_marker_Town1_03","_Z_COUNTER","_radius","_ZCount","_ZCounter","_ZtrigPOS","_PLaround","_PLcheck"];
//============================================////============================================//
	//MISSION RUNNING CHECK
		ZOMBRELLA_CORP_STARTED = 1;
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: Mission --=ZOMBRELLA_CORP=-.sqf- Started";
		diag_log "=======================================================================";
	//RANDOM TOWN SELECTION
		_towns1 = nearestLocations [position player, ["NameVillage","NameCity","NameCityCapital"], 40000];
		_RandomTownPosition1 = position (_towns1 select (floor (random (count _towns1))));
		_Zombie_Trigger_1_default_POS = [18495.582, 21007.387, -1.4075165];
//============================================////============================================//
	//USED MARKER:
    /*
	_Mission_Zombie_marker_Town1_01
	_Mission_Zombie_marker_Town1_02
	_Mission_Zombie_marker_Town1_03
	_Mission_Zombie_Trigger_marker_Town1_01
    */
//============================================////============================================//
	//CREATE MISSION MARKER AT RANDOM TOWN
		//TOWN #1
			_Mission_Zombie_marker_Town1_01 = createMarker ["Mission_Zombie_marker_Town1_01", _RandomTownPosition1];
			"Mission_Zombie_marker_Town1_01" setMarkerColor "ColorBlue";
			"Mission_Zombie_marker_Town1_01" setMarkerShape "ELLIPSE";
			"Mission_Zombie_marker_Town1_01" setMarkerBrush "SolidFull";
			"Mission_Zombie_marker_Town1_01" setMarkerSize [600,600];
			"Mission_Zombie_marker_Town1_01" setMarkerAlpha 0.2;
			//
			_Mission_Zombie_marker_Town1_02 = createMarker ["Mission_Zombie_marker_Town1_02", getMarkerPos "Mission_Zombie_marker_Town1_01"];
			"Mission_Zombie_marker_Town1_02" setMarkerColor "ColorRed";
			"Mission_Zombie_marker_Town1_02" setMarkerShape "ELLIPSE";
			"Mission_Zombie_marker_Town1_02" setMarkerBrush "Border";
			"Mission_Zombie_marker_Town1_02" setMarkerSize [600,600];
			"Mission_Zombie_marker_Town1_02" setMarkerAlpha 1.0;
			//
			_Mission_Zombie_marker_Town1_03 = createMarker ["Mission_Zombie_marker_Town1_03", getMarkerPos "Mission_Zombie_marker_Town1_01"];
			"Mission_Zombie_marker_Town1_03" setMarkerSize [1,1];
			"Mission_Zombie_marker_Town1_03" setMarkerColor "ColorOrange";
			"Mission_Zombie_marker_Town1_03" setMarkerType "MinefieldAP";
			"Mission_Zombie_marker_Town1_03" setMarkerText "";
			//CREATE Z_COUNTER MARKER TO COUNT AI
			_Z_COUNTER = createMarker ["Z_COUNTER", getMarkerPos "Mission_Zombie_marker_Town1_01"];
			"Z_COUNTER" setMarkerColor "ColorOrange";
			"Z_COUNTER" setMarkerType "hd_dot";
//============================================////============================================//
	//TRIGGERS
	//MOVE ZOMBIE TRIGGER TO SELECTED TOWNS (6 TOTALS, 2 PER TOWN)
		_ZtrigPOS = getMarkerPos "Mission_Zombie_marker_Town1_01";
		//SPAWNER #1 + FOG
		Zombie_Trigger_1 setPos _ZtrigPOS;
		ZOMBIE_FOG_TRIGGER setPos _ZtrigPOS;
	//MESSAGE
		MISSION_NOTIFICATION_MSG = "ZOMBIE_MISSION_START_NOTIFICATION"; publicVariable "MISSION_NOTIFICATION_MSG";
		SFX_CUSTOM = "AICAPTURETOWER"; publicVariable "SFX_CUSTOM";
		["Zombie Horde Test! 50 Zombies 300meters radius", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
//============================================////============================================//
	//SET MISSION VARIABLES
		_ZCounter = 1;							//MAIN MISSION LOOP CHECK 4 SECONDS
		_radius = 600;							//COUNT AI IN THAT RADIUS AMOUNT IN METER
		_radius1 = 605;
		_PLcheck = 0;							//PLAYER DETECTED CHECK (0=NOPLAYER 1=PLAYER DETECTED)
		_ZFailed = 0;
//============================================////============================================//
	//WAIT UNTIL A PLAYER IS AROUND 600 METERS
		while {_PLcheck isEqualTo 0} do 
		{
		  //
		  _PLaround = ({alive _x AND (side _x) isEqualTo EAST AND (_x distance getMarkerPos "Mission_Zombie_marker_Town1_01" < _radius)} count allunits);
		  uiSleep 3;
			if (_PLaround >= 1) then 
			{
				//PLAYER AROUND, QUIT LOOP AND START MISSION
				["PLAYER CHECK -TEMP-", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
				_PLcheck = 1;
			};
		};
		waitUntil {uiSleep 5; _PLcheck isEqualTo 1};
//============================================////============================================//
	//WAIT 10 SECONDS FOR A COUPLE OF ZOMBIES TO SPAWN
	    /*	(TRIGGER SET AT 0.2)
			0.2 x uiSleep10 = 50 Z's	*/
		//SO WAIT 12 SECONDS TO BE SURE ALL ZOMBIES HAVE SPAWNED THEN MOVE TRIGGER TO DISABLE IT
		uiSleep 12;
//============================================////============================================//
	//MOVE MARKER BACK TO ORIGINAL POSITION TO DISABLE IT AFTER IT SPAWNED 50 ZOMBIES
		Zombie_Trigger_1 setPos _Zombie_Trigger_1_default_POS;
//============================================////============================================//
	//START MISSION
		while {_ZCounter isEqualTo 1} do 
		{
		  //AI COUNTER FOR MISSION MARKER
		  _ZCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Mission_Zombie_marker_Town1_01" < _radius)} count allunits);
		  _PLaround = ({alive _x AND (side _x) isEqualTo EAST AND (_x distance getMarkerPos "Mission_Zombie_marker_Town1_01" < _radius1)} count allunits);
		  //
		  uiSleep 4;
		  //
		  "Z_COUNTER" setMarkerText format ["	(Zombies left: (%1)", _ZCount];
			//ADD CUSTOM STUFF HERE FOR MAIN MISSION
				
			//ALL ZOMBIES HAS BEEN ELIMINATED. ENDING MISSION
			if (_ZCount < 5) then 
			{
				//CHANGE Z_COUNTER MARKER
				"Z_COUNTER" setMarkerColor "ColorOrange";
				"Z_COUNTER" setMarkerText "The town has been purified!";
				_ZCounter = 0;
			};
			//RESET EVENT IF PLAYER GO OUT OF THE ZOMBIE TRIGGER AREA. STOP WANDERING ZOMBIE CHASING ALL AROUND MAP
			if (_PLaround < 1) then 
			{
				//RESET EVENT AND WARN PLAYER
				["GOING OUT OF MISSION AREA. RESETING ZOMBIES EVENT (CHECK)", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
				_ZCounter = 0;
				_ZFailed = 1;
			};
		};
//============================================////============================================//
	//END MISSION IF FAILED
		if (_ZFailed isEqualTo 1) exitWith 
		{
			//CHANGE Z_COUNTER MARKER
			"Z_COUNTER" setMarkerColor "ColorOrange";
			"Z_COUNTER" setMarkerText "Zombies overun! Failed mission...";
			//FAILED
			["Zombie Event Failed...", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
			//DELETE ALL ALIVE ZOMBIE TO RESET TRIGGER FOR NEXT EVENT WITHIN A 800 METERS RADIUS INCASE THEY CHASED A PLAYER OUT OF THE ZONE
			Execute_Client_SQF = "TIMS\-=ZOMBRELLA_CORP=-\Z_DEL.sqf"; publicVariable "Execute_Client_SQF";
			[] execVM Execute_Client_SQF;
			//WAIT OR MARKER WILL BE DELETED BEFORE THE SQF SCRIPT.
			uiSleep 30;
			//MOVE FOG TRIGGER BACK TO SAFE SPOT
			ZOMBIE_FOG_TRIGGER setPos _Zombie_Trigger_1_default_POS;
			//DELETE MARKER
			deleteMarker "Mission_Zombie_marker_Town1_01";
			deleteMarker "Mission_Zombie_marker_Town1_02";
			deleteMarker "Mission_Zombie_marker_Town1_03";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_01";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_02";
			deleteMarker "Z_COUNTER";
			//MISSION ENDED
			diag_log "-=T.I.M.S=-: Mission -ZOMBIE_INFESTATION.sqf- Ended";
			//MISSION ENDED CHECK
			ZOMBRELLA_CORP_STARTED = 0;
		};
	//WAIT UNTIL AI ELEMINATED (< 5)
		waitUntil {uiSleep 5; _ZCounter isEqualTo 0};
	//MESSAGE
		MISSION_NOTIFICATION_MSG = "ZOMBIE_MISSION_START_NOTIFICATION"; publicVariable "MISSION_NOTIFICATION_MSG";
		SFX_CUSTOM = "AICAPTURETOWER"; publicVariable "SFX_CUSTOM";
		["Zombie Horde eliminated. -TEMP- MESSAGE END", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep 120;
		//uiSleep MISSION_CLEAN_TIME;
//============================================////============================================//
	//MISSION CLEANUP
		//MOVE FOG TRIGGER BACK TO SAFE SPOT
			ZOMBIE_FOG_TRIGGER setPos _Zombie_Trigger_1_default_POS;
		//DELETE MARKER
			deleteMarker "Mission_Zombie_marker_Town1_01";
			deleteMarker "Mission_Zombie_marker_Town1_02";
			deleteMarker "Mission_Zombie_marker_Town1_03";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_01";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_02";
			deleteMarker "Z_COUNTER";
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -ZOMBIE_INFESTATION.sqf- Ended";
		//MISSION ENDED CHECK
			ZOMBRELLA_CORP_STARTED = 0;
//============================================////============================================//