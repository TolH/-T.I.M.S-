//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
//============================================////============================================//
private ["_Missionmarker1","_towns","_kRandSpawnPos","_RandomTownPosition","_spawnRandomisation","_spwnposNew","_SPWradioTower","_TowerMarker"];
//============================================////============================================//
	//MISSION RUNNING CHECK
		MISSION_ISRUNNING = 1;
		diag_log "=======================================================================";
		diag_log "-=T.I.M.S=-: Mission -Invasion.sqf- Started";
		diag_log "=======================================================================";
	//SELECT A LOCATION
		_towns = nearestLocations [position player, ["NameVillage","NameCity","NameCityCapital"], 40000];
		_RandomTownPosition = position (_towns select (floor (random (count _towns))));
//============================================////============================================//
	//CREATE MISSION MARKER
		_Missionmarker1 = createMarker ["Missionmarker1", _RandomTownPosition];
		//
		_Missionmarker2 = createMarker ["Missionmarker2", getMarkerPos "Missionmarker1"];
		"Missionmarker2" setMarkerColor "ColorRed";
		"Missionmarker2" setMarkerShape "ELLIPSE";
		"Missionmarker2" setMarkerBrush "Border";
		"Missionmarker2" setMarkerSize [1200,1200];
		"Missionmarker2" setMarkerAlpha 1.0;
		//
		_Missionmarker3 = createMarker ["Missionmarker3", getMarkerPos "Missionmarker1"];
		"Missionmarker3" setMarkerColor "ColorGreen";
		"Missionmarker3" setMarkerShape "ELLIPSE";
		"Missionmarker3" setMarkerBrush "Border";
		"Missionmarker3" setMarkerSize [1300,1300];
		"Missionmarker3" setMarkerAlpha 1.0;
	//PAUSE MISSION UNTIL PLAYER ARE AT LEAST 1250m OF MARKER
		["Missionmarker1", 1250, "ColorRed"] ExecVM PAUSE_MISSION;
		waitUntil {uiSleep 3; ANIMEMARKER isEqualTo 0};
		deleteMarker "Missionmarker3";
//============================================////============================================//
	//CREATE MARKERS + AICOUNTER
		"Missionmarker1" setMarkerColor "ColorOrange";
		"Missionmarker1" setMarkerShape "ELLIPSE";
		"Missionmarker1" setMarkerBrush "SolidFull";
		"Missionmarker1" setMarkerSize [1200,1200];
		"Missionmarker1" setMarkerAlpha 0.2;
		//CREATE AI_COUNTER MARKER
		_AI_COUNTER = createMarker ["AI_COUNTER", getMarkerPos "Missionmarker1"];
		"AI_COUNTER" setMarkerColor "ColorGrey";
		"AI_COUNTER" setMarkerType "hd_dot";
//============================================////============================================//
	//POSITION OF MISSION OBJECTS, AI, VEHICLES AND LOOTS
		_kRandSpawnPos = [(getMarkerPos "Missionmarker1"), 1, 600, 0.1, 0, 200, 0] call BIS_fnc_findSafePos;	//RADIOTOWER
		_kRandSpawnPos6 = [(getMarkerPos "Missionmarker1"), 800, 1400, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//BonusLoot1 Ground Vehicle POS
		_kRandSpawnPos7 = [(getMarkerPos "Missionmarker1"), 800, 1410, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//BonusLoot2 Air Vehicle POS
//============================================////============================================//
	//CREATE RADIOTOWER
		_SPWradioTower = "Land_TTowerBig_2_F" createVehicle _kRandSpawnPos;
		waitUntil {uiSleep 1; alive _SPWradioTower};
		_SPWradioTower setVectorUp [0,0,1];
	//MARKER AT RADIOTOWER
		_TowerMarker = createMarker ["Radio-Tower", getPos _SPWradioTower];
		"Radio-Tower" setMarkerColor "ColorYellow";
		"Radio-Tower" setMarkerType "loc_Transmitter";
		"Radio-Tower" setMarkerText " -RadioTower-";
//============================================////============================================//
	//CREATE ALL CRATES
		//CRATE TYPE
			_bunker1POS = getPos _SPWbunker1;
			_bunker2POS = getPos _SPWbunker2;
			//_Type_FuelTank = "B_Slingload_01_Fuel_F";
			_Type_AmmoBox = "B_CargoNet_01_ammo_F";
		//CRATE #1
			_supplyBox1 = createVehicle [_Type_AmmoBox, _bunker1POS, [], 0, "CAN_COLLIDE"];
			_supplyBox1 allowDamage false;
			_supplyBox1 enableSimulation true;
		//CRATE #2
			_supplyBox2 = createVehicle [_Type_AmmoBox, _bunker2POS, [], 0, "CAN_COLLIDE"];
			_supplyBox2 allowDamage false;
			_supplyBox2 enableSimulation true;
	//CLEAR CRATE ITEMS
		//CRATE #1
			clearBackpackCargoGlobal _supplyBox1;
			clearWeaponCargoGlobal _supplyBox1;
			clearMagazineCargoGlobal _supplyBox1;
			clearItemCargoGlobal _supplyBox1;
		//CRATE #2
			clearBackpackCargoGlobal _supplyBox2;
			clearWeaponCargoGlobal _supplyBox2;
			clearMagazineCargoGlobal _supplyBox2;
			clearItemCargoGlobal _supplyBox2;
	//CREATE ALL CRATES MARKERS
		//(Crate_1)
			_Crate_1 = createMarker ["Crate_1", getPos _supplyBox1];
			"Crate_1" setMarkerSize [0.8,0.8];
			"Crate_1" setMarkerColor "ColorKhaki";
			"Crate_1" setMarkerType "respawn_para";
			"Crate_1" setMarkerText "";		//Construction loot
		//(Crate_2)
			_Crate_2 = createMarker ["Crate_2", getPos _supplyBox2];
			"Crate_2" setMarkerSize [0.8,0.8];
			"Crate_2" setMarkerColor "ColorKhaki";
			"Crate_2" setMarkerType "respawn_para";
			"Crate_2" setMarkerText "";		//Weapons loot
//============================================////============================================//
	//MESSAGE
		showNotification = ["NewMain", "Primary Objective: Take back the town!"]; publicVariable "showNotification";
	//WAIT 15 SECONDS BEFORE SENDING NEXT MESSAGE
		uiSleep 15;
		showNotification = ["NewSub", "Secondary Objective: Destroy the RadioTower."]; publicVariable "showNotification";	
//============================================////============================================//
	//ADDING AI TO RADIOTOWER
		//GROUP #1
			_LVgroup1 = ["Missionmarker1",3,1100,[true,true],[true,true,true],false,[50,0],[3,0],0.3,nil,nil,1,true,true,["ALL"]] execVM "TIMS\LV\militarize.sqf";
			//_Tower = getPos _SPWradioTower;
			//_spawnGroup1 = [ (_Tower select 0) + 10,(_Tower select 1) - 10, 0], resistance, AI_DEFEND_TOWER] ExecVM CUSTOM_FN_SPAWNGROUP;
			//nul_script1 = [_spawnGroup1, getpos _SPWradioTower, 50] ExecVM UNITS_PATROL;	//BIS_fnc_taskPatrol;

//============================================////============================================//
	//SET MISSION VARIABLES
		_AiCounter = 1;
		_TowerCheck = 1;
		_LOOT_TRACKER_ON = LOOT_TRACKER;
	//SET AI_Counter Radius
		_radius = 1250;			//_AiCount RADIUS (MISSION MARKER RADIUS)
	//START TRACKING CRATE MARKERS IF ENABLED FROM CONFIG
		if (_LOOT_TRACKER_ON isEqualTo 1) then
		{
			[_supplyBox1, _supplyBox2] execVM LOOT_MARKER;
		};
//============================================////============================================//
	//START MISSION
		while {_AiCounter isEqualTo 1} do 
		{
		  //AICOUNTER
		  _AiCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Missionmarker1" < _radius)} count allunits);
		  uiSleep 4;
		  //CREATE AI_COUNTER MARKER
		  "AI_COUNTER" setMarkerText format ["(Ennemies left: (%1)", _AiCount];
			//WAIT UNTIL RADIOTOWER IS DESTROYED
			if ((!alive _SPWradioTower) && (_TowerCheck isEqualTo 1)) then
			{
				diag_log format ["-=T.I.M.S=-: Mission -Invasion.sqf- TOWER DESTROYED"];
				"Radio-Tower" setMarkerColor "ColorGrey";
				"Radio-Tower" setMarkerText " -=RadioTower=- Destroyed";
				uiSleep 5;
				showNotification = ["CompletedSub", "The RadioTower is Down!"]; publicVariable "showNotification";
				_TowerCheck = 0;
			};
			//ALL ENNEMIES KILLED. ENDING MISSION
			if (_AiCount < 5) then 
			{
				//CHANGE AI_COUNTER MARKER
				"AI_COUNTER" setMarkerColor "ColorOrange";
				"AI_COUNTER" setMarkerText "The town has been taken back!";
				_AiCounter = 0;
			};
		};
//============================================////============================================//
	//WAIT UNTIL AI ELEMINATED (< 5)
		waitUntil {uiSleep 5; _AiCounter isEqualTo 0};
	//MESSAGE
		showNotification = ["CompletedMain", "You have taken back the town!"]; publicVariable "showNotification";
		"Missionmarker1" setMarkerColor "ColorGreen";
	//CREATE LOOT IF INVASION COMPLETED THEN START A SMOKE GRENADE
		//_Crate_1
		[_supplyBox1,"CONSTRUCTION"] ExecVM NORMAL_Loot_Setup;
		//SMOKE_1
		
		//_Crate_2
		[_supplyBox2,"WEAPONS"] ExecVM HIGH_Loot_Setup;
		//SMOKE_2
		
		//_Crate_2
		[_supplyBox2,"MEDIC"] ExecVM LOW_Loot_Setup;
//============================================////============================================//
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep MISSION_CLEAN_TIME;
		CRATETRACKING = 0;
		//DELETE SPECIALS
			if (!alive _SPWradioTower) then
			{
				_wreck = getMarkerPos "Radio-Tower" nearestObject "Land_TTowerBig_2_ruins_F";
				deletevehicle _wreck;
				//WAIT OR WONT DELETE
				uiSleep 1;
			};
			//DELETE VEHICLE_AI IF ALIVE
			if (_Tank1Alive isEqualTo 1) then 
			{
				deletevehicle TANK_AI_1;
			};
			//
			if (_Heli1Alive isEqualTo 1) then 
			{
				deletevehicle HELI_AI_1;
			};
		//DELETE LOOTBOX AND OBJECTS
			deletevehicle _supplyBox1;
			deletevehicle _supplyBox2;
			deleteVehicle _SPWradioTower;
			deleteVehicle _SPWbunker1;
			deleteVehicle _SPWbunker2;
		//DELETE MARKER
			deleteMarker "Missionmarker1";
			deleteMarker "Missionmarker2";
			deleteMarker "Radio-Tower";
			deleteMarker "AI_COUNTER";
			deleteMarker "Crate_1";
			deleteMarker "Crate_2";
			deleteMarker "Bunker1";
			deleteMarker "Bunker2";
			deleteMarker "BonusLoot1";
			deleteMarker "BonusLoot2";
			if (VEHICLE_MARKER isEqualTo 1) then
			{
				deleteMarker "Vehicle_1";
				deleteMarker "Heli_1";
			};
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -Invasion.sqf- Ended";
		//MISSION ENDED CHECK
			MISSION_ISRUNNING = 0;
//============================================////============================================//