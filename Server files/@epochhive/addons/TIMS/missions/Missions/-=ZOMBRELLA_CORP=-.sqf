//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
// ZOMBIE TIME
// 
// TOWN INFESTATION CLEANING JOB
//============================================////============================================//
private ["_towns1","_RandomTownPosition1","_Mission_Zombie_marker1","_Missionmarker2","_Missionmarker3","_AI_COUNTER","_radius"];
//============================================////============================================//
	//MISSION RUNNING CHECK
		ZOMBRELLA_CORP_STARTED = 1;
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: Mission --=ZOMBRELLA_CORP=-.sqf- Started";
		diag_log "=======================================================================";
	//RANDOM TOWN SELECTION
		_towns1 = nearestLocations [position player, ["NameVillage","NameCity","NameCityCapital"], 40000];
		_RandomTownPosition1 = position (_towns1 select (floor (random (count _towns1))));
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
			"Mission_Zombie_marker_Town1_03" setMarkerSize [0.6,0.6];
			"Mission_Zombie_marker_Town1_03" setMarkerColor "ColorOrange";
			"Mission_Zombie_marker_Town1_03" setMarkerType "MinefieldAP";
			"Mission_Zombie_marker_Town1_03" setMarkerText "-=Infected Zone=-";
//============================================////============================================//
		//TRIGGERS
		_trigger_town_1_01 = [(getMarkerPos "Mission_Zombie_marker_Town1_01"), 25, 200, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//_trigger_town_1_01
	//FIND SPOT AROUND TOWN FOR ZOMBIE TRIGGERS
		_Mission_Zombie_Trigger_marker_Town1_01 = createMarker ["Mission_Zombie_Trigger_marker_Town1_01", _trigger_town_1_01];
		"Mission_Zombie_Trigger_marker_Town1_01" setMarkerSize [0.8,0.8];
		"Mission_Zombie_Trigger_marker_Town1_01" setMarkerColor "ColorKhaki";
		"Mission_Zombie_Trigger_marker_Town1_01" setMarkerType "respawn_para";
	//MOVE ZOMBIE TRIGGER TO SELECTED TOWNS (6 TOTALS, 2 PER TOWN)
		//WAYPOINT
		_trig01POS = getMarkerPos "Mission_Zombie_Trigger_marker_Town1_01";
		//SPAWNER #1
		Zombie_Trigger_1 setPos _trig01POS;
		
	//MESSAGE
		MISSION_NOTIFICATION_MSG = "ZOMBIE_MISSION_START_NOTIFICATION"; publicVariable "MISSION_NOTIFICATION_MSG";
		SFX_CUSTOM = "AICAPTURETOWER"; publicVariable "SFX_CUSTOM";
		["Zombie Horde Detected! Clean them out!", 10, [[0,0,0,0.2],[1,1,1,0.95]]] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
//============================================////============================================//
	//WAIT 12 SECONDS TO NOTIFICATION TO GO AWAY
		uiSleep 12;
//============================================////============================================//
	//SET MISSION VARIABLES
		//_AiCounter = 1;							//MAIN MISSION LOOP CHECK 4 SECONDS
		//_radius = 1250;							//COUNT AI IN THAT RADIUS AMOUNT IN METER

//============================================////============================================//
	//START MISSION
/*		while {_AiCounter isEqualTo 1} do 
		{
		  //AI COUNTER FOR MISSION MARKER
		  _AiCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Missionmarker1" < _radius)} count allunits);
		  //
		  uiSleep 4;
		  //
		  "AI_COUNTER" setMarkerText format ["(Ennemies left: (%1)", _AiCount];
			//ADD CUSTOM STUFF HERE FOR MAIN MISSION
			
			//
			//ALL TOWN HAS BEEN TAKEN BACK AND CLEANED OF THE INFECTION
			//
			if (_AiCount < 20) then 
			{
				//CHANGE AI_COUNTER MARKER
				"AI_COUNTER" setMarkerColor "ColorOrange";
				"AI_COUNTER" setMarkerText "The town has been taken back!";
				_AiCounter = 0;
			};
		};*/
//============================================////============================================//
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep 900;
		//uiSleep MISSION_CLEAN_TIME;
//============================================////============================================//
	//MISSION CLEANUP
		//MOVE MARKERS BACK TO SAFE SPOT
			_Zombie_Trigger_1_default_POS = [18495.582, 21007.387, -1.4075165];
			Zombie_Trigger_1 setPos _Zombie_Trigger_1_default_POS;
		//DELETE MARKER
			deleteMarker "Mission_Zombie_marker_Town1_01";
			deleteMarker "Mission_Zombie_marker_Town1_02";
			deleteMarker "Mission_Zombie_marker_Town1_03";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_01";
			deleteMarker "Mission_Zombie_Trigger_marker_Town1_02";
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -ZOMBIE_INFESTATION.sqf- Ended";
		//MISSION ENDED CHECK
			ZOMBRELLA_CORP_STARTED = 0;
//============================================////============================================//