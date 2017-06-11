//============================================////============================================//
//-T.I.M.S- (WIP) by TolH
//============================================////============================================//
private ["_Missionmarker1","_Missionmarker2","_Missionmarker3","_SPWradioTower","_TowerMarker"];
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
		_LootBox_1 = [(getMarkerPos "Missionmarker1"), 25, 100, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//_LootBox_1
		_LootBox_2 = [(getMarkerPos "Missionmarker1"), 10, 75, 1, 0, 150, 0] call BIS_fnc_findSafePos;	//_LootBox_2
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
			//_Type_FuelTank = "B_Slingload_01_Fuel_F";
			_Type_AmmoBox = "B_CargoNet_01_ammo_F";
		//CRATE #1
			_supplyBox1 = createVehicle [_Type_AmmoBox, _LootBox_1, [], 0, "CAN_COLLIDE"];
			_supplyBox1 allowDamage false;
			_supplyBox1 enableSimulation true;
		//CRATE #2
			_supplyBox2 = createVehicle [_Type_AmmoBox, _LootBox_2, [], 0, "CAN_COLLIDE"];
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
		showNotification = ["NewMain", "Town Militarization Mission Test!"]; publicVariable "showNotification";
//============================================////============================================//
	//SPAWN ALL ONFOOT UNITS
		//[LVgroup1] GROUND PATROL TO RADIOTOWER
			_LVgroup1 = ["Radio-Tower",3,150,[true,false],[false,false,false],false,[10,0],[0,0],0.1,nil,nil,1,true,false,["TOHL_HARD"]] execVM "TIMS\LV\militarize.sqf";
		//[LVgroup2] AI IN HOUSES
			_LVgroup2 = ["Missionmarker1",3,false,1,[12,0],200,0.1,nil,nil,2,["TOHL_HARD"]] execVM "TIMS\LV\fillHouse.sqf";
		//[LVgroup3] GROUND PATROL AROUND MISSION MARKER
			_LVgroup3 = ["Missionmarker1",3,900,[true,false],[false,false,false],false,[13,0],[0,0],0.1,nil,nil,3,true,false,["TOHL_HARD"]] execVM "TIMS\LV\militarize.sqf";
			uiSleep 3;//WAIT 3 SECONDS
	//SPAWN ALL VEHICLES UNITS
		//[LVgroup4] VEHICLE PATROL
			_LVgroup4 = ["Missionmarker1",3,1000,[false,false],[true,false,false],false,[0,0],[2,0],0.1,nil,nil,4,true,false,["TOHL_HARD"]] execVM "TIMS\LV\militarize.sqf";
		//[LVgroup5] AIR PATROL
			_LVgroup5 = ["Missionmarker1",3,1150,[false,false],[false,false,true],false,[0,0],[2,0],0.1,nil,nil,5,true,false,["TOHL_HARD"]] execVM "TIMS\LV\militarize.sqf";
		//[LVgroup6] WATER PATROL
			_LVgroup6 = ["Missionmarker1",3,1050,[false,false],[false,true,false],false,[0,0],[1,0],0.1,nil,nil,6,true,false,["TOHL_HARD"]] execVM "TIMS\LV\militarize.sqf";
//============================================////============================================//
	//MESSAGE
	//WAIT 14 SECONDS BEFORE SENDING NEXT MESSAGE
		uiSleep 14;
		showNotification = ["NewSecondary", "Destroy the RadioTower to stop AI paradropping around your position!"]; publicVariable "showNotification";
//============================================////============================================//
	//SET MISSION VARIABLES
		_AiCounter   = 1;			//MAIN MISSION LOOP 4 SECONDS CHECK
		_TowerCheck  = 1;		    //CHECK FOR TOWER DESTRUCTION TO RUN ONLY ONCE IF TOWER DESTROYED
		HeliTimer1   = 0;			//HELI_PARADROP TIMER CHECK						= 0,1,2 (Default 0)
		//DELETE CHECK
		HP_WAVE1	 = 0;			//HELI_PARADROP WAVE 1 SPAWNED? [LVgroup7]		= 0,1 	(Default 0)
		HP_WAVE2	 = 0;			//HELI_PARADROP WAVE 2 SPAWNED? [LVgroup8]		= 0,1 	(Default 0)
		HP_WAVE3	 = 0;			//HELI_PARADROP WAVE 3 SPAWNED? [LVgroup9]		= 0,1 	(Default 0)
		//SET AI_Counter Radius
		_radius = 1250;			//_AiCount RADIUS
//============================================////============================================//
	//START TRACKING CRATE MARKERS IF ENABLED FROM CONFIG
		if (LOOT_TRACKER isEqualTo 1) then
		{
			[_supplyBox1, _supplyBox2] execVM LOOT_MARKER;
		};
//============================================////============================================//
	//IDEA I HAVE IN MIND FOR MISSION STORED HERE

				//TODO CAPTURE AND DEFEND THE RADIOTOWER
				//WHILE UNDER PLAYER CONTROL, HELI_PARADROP WILL BE PLAYER SIDE
				//WHILE DEFENDING THE RADIOTOWER, AI HELI PARADROP WILL BE SENT TO CAPTURE IT BACK
				//HOLD THE RADIOTOWER FOR 15 MINUTES TO CLAIM IT AND STOP ALL AIR AI REINFORCEMENTS.
				//ONCE RADIOTOWER CLAIMED MAKE SOMETHING HAPPEN HERE FOR PLAYER OR REWARDS BY VAR FOR STAGED EVENTS

//============================================////============================================//
	//START MISSION
		while {_AiCounter isEqualTo 1} do 
		{
		  //AICOUNTER
		  _AiCount = ({alive _x AND (side _x) isEqualTo resistance AND (_x distance getMarkerPos "Missionmarker1" < _radius)} count allunits);
		  uiSleep 4;
		  //CREATE AI_COUNTER MARKER
		  "AI_COUNTER" setMarkerText format ["(Ennemies left: (%1)", _AiCount];
			//SEND IN HELI_PARADROP REINFORCEMENT IF ENABLED.
			if (HELI_PARADROP isEqualTo 1 && HeliTimer1 isEqualTo 0) then
			{
				//START HELI_PARADROP_TIMER_1
				HeliTimer1 = 1;
				//STARTING TIMER
				[] execVM HELI_PARADROP_TIMER_1;
			};
			//WAIT UNTIL RADIOTOWER IS DESTROYED
			if ((!alive _SPWradioTower) && (_TowerCheck isEqualTo 1)) then
			{
				diag_log format ["-=T.I.M.S=-: Mission -Invasion.sqf- TOWER DESTROYED"];
				"Radio-Tower" setMarkerColor "ColorGrey";
				"Radio-Tower" setMarkerText " -=RadioTower=- Destroyed";
				uiSleep 5;
				showNotification = ["CompletedSecondary", "The RadioTower is Down!"]; publicVariable "showNotification";
				_TowerCheck = 0;
				//STOP HELI_PARADROP TIMER IF RADIOTOWER IS DESTROYED.
				HeliTimer1 = 0;
			};
			//ALL ENNEMIES KILLED. ENDING MISSION
			if ((_AiCount < 5) && (_TowerCheck isEqualTo 0)) then 
			{
				//CHANGE AI_COUNTER MARKER
				"AI_COUNTER" setMarkerColor "ColorOrange";
				"AI_COUNTER" setMarkerText "All opposing forces as been eliminated! Great job.";
				_AiCounter = 0;
			};
		};
//============================================////============================================//
	//WAIT UNTIL AI ELEMINATED (< 5)
		waitUntil {uiSleep 5; _AiCounter isEqualTo 0};
	//MESSAGE
		showNotification = ["CompletedMain", "All opposing forces as been eliminated! Great job."]; publicVariable "showNotification";
		"Missionmarker1" setMarkerColor "ColorGreen";
		//REMOVE ALIVE AI GROUP
		nul = [LVgroup1] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		nul = [LVgroup2] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		nul = [LVgroup3] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		nul = [LVgroup4] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		nul = [LVgroup5] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		nul = [LVgroup6] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		//REMOVE [LVgroup7],[LVgroup8],[LVgroup9] IF SPAWNED 
		if (HP_WAVE1 isEqualTo 1) then
		{
			nul = [LVgroup7] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		};
		if (HP_WAVE2 isEqualTo 1) then
		{
			nul = [LVgroup8] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		};
		if (HP_WAVE3 isEqualTo 1) then
		{
			nul = [LVgroup9] execVM "TIMS\LV\LV_functions\LV_fnc_removeGroupV2.sqf";
		};
//============================================////============================================//
	//LOOT TEST (3 TYPES OF 3 DIFFERENT QUALITY)
		//_Crate_1
		[_supplyBox1,"CONSTRUCTION"] ExecVM NORMAL_Loot_Setup;
		//SMOKE_1
		
		//_Crate_2
		[_supplyBox2,"WEAPONS"] ExecVM HIGH_Loot_Setup;
		[_supplyBox2,"MEDIC"] ExecVM LOW_Loot_Setup;
		//SMOKE_2

//============================================////============================================//
	//WAIT X SECONDS BEFORE DELETING EVERYTHING
		uiSleep MISSION_CLEAN_TIME;
		LOOT_TRACKER = 0;
		//DELETE SPECIALS
			if (!alive _SPWradioTower) then
			{
				_wreck = getMarkerPos "Radio-Tower" nearestObject "Land_TTowerBig_2_ruins_F";
				deletevehicle _wreck;
				//WAIT OR WONT DELETE
				uiSleep 1;
			};
		//DELETE LOOTBOX AND OBJECTS
			deletevehicle _supplyBox1;
			deletevehicle _supplyBox2;
			deleteVehicle _SPWradioTower;
		//DELETE MARKER
			deleteMarker "Missionmarker1";
			deleteMarker "Missionmarker2";
			deleteMarker "Radio-Tower";
			deleteMarker "AI_COUNTER";
			deleteMarker "Crate_1";
			deleteMarker "Crate_2";
		//REMOVE DEAD AI GROUP WHEN 1000 METERS OF PLAYER
			nul = [1000] execVM "TIMS\LV\LV_functions\LV_fnc_removeDead.sqf";
//============================================////============================================//
	//MISSION ENDED
		diag_log "-=T.I.M.S=-: Mission -Invasion.sqf- Ended";
		//MISSION ENDED CHECK
			MISSION_ISRUNNING = 0;
//============================================////============================================//