/*
										-=TolH=- 
									  (OnHold.sqf)
									 Mission On Hold.
					Usage: 	
					["marker",  radius, "colordifficulty"] ExecVM PAUSE_MISSION;
	This will put a rotating marker on map pausing mission so no ai spawn until a player is near the location between the green and red circle.
*/
private ["_MarkerPOS","_radius","_colorDifficulty","_anyNearestLocation","_townName","_OnHold","_degree","_PlayerAround"];
//============================================////============================================//
	_MarkerPOS = _this select 0;	// first ELEMENT == MARKER POSITION TO PUT MARKER
	_radius = _this select 1;	// SECOND ELEMENT == RADIUS OF WICH PAUSED MISSION WILL RESUME WHEN PLAYER ARE NEARBY
	_colorDifficulty = _this select 2;	//THIRD ELEMENT == THE COLOR OF THE MARKER REPRESENT THE VISUAL DIFFICULTY OF THE MISSION (Green, Yellow, Red)
//============================================////============================================//
	//SEND MESSAGE TO PLAYER THAT A RANDOM MISSION HAS STARTED
//============================================////============================================//
	//WICH TOWN MISSION IS AT ?
	_anyNearestLocation = nearestLocation [getMarkerPos "Missionmarker1", ""];
	_townName = text _anyNearestLocation;
		//SEND MESSAGES
		_targetStartText = format ["<t align='center' size='1.5'>New mission location is:</t><br/><t size='1.8' color='#3ea190' align='center'>-%1-</t><br/><img color='' size='8' align='center' image='\A3\weapons_f\items\data\ui\gear_gps_CA.paa'/> <br/><t size='1.0' color='#3ea190' align='center'>-=ONLY A TEST TMP=-</t>", _townName];
		GlobalHint = _targetStartText; publicVariable "GlobalHint"; hint parseText GlobalHint;
		["A new mission is available.", 10] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
	//VAR
		ANIMEMARKER = 1;
		_degree = 0;
	//CREATE MAIN MISSION ANIMATED MARKER
		_OnHold = createMarker ["OnHold", getMarkerPos _MarkerPOS];
		"OnHold" setMarkerColor "ColorOrange";
		"OnHold" setMarkerType "Select";
		"OnHold" setMarkerSize [2.0,2.0];
		"OnHold" setMarkerAlpha 1.0;
		"OnHold" setMarkerText "";
		//SECONDARY MARKER
		_SecondaryMarker = createMarker ["SecondaryMarker", getMarkerPos "OnHold"];
		"SecondaryMarker" setMarkerColor _colorDifficulty;
		"SecondaryMarker" setMarkerType "hd_warning";
		"SecondaryMarker" setMarkerSize [1.2,1.2];
	//START MARKER ANIMATION
		while {ANIMEMARKER isEqualTo 1} do 
		{
		  _degree = _degree + 6;
		  _PlayerAround = ({alive _x AND (side _x) isEqualTo EAST AND (_x distance getMarkerPos _MarkerPOS < _radius)} count allunits);
		  "OnHold" setMarkerDir _degree;
		  uiSleep 0.05;
			//MADE A COMPLETE ROTATION RESTARTING AT ZERO DEGREE
			if (_degree isEqualTo 360) then
			{
				_degree = 0;
			};
			//START CHECKS FOR RADIUS
			if (_PlayerAround >= 1) then
			{
				//NAME MARKER
				"OnHold" setMarkerText "<<==== Loading mission...";
				//RESUME MISSION
				["Mission starting in 5 seconds...", 10] remoteExec ["Epoch_message",-2]; // -2 targets everyone but the server
				uiSleep 5;
				ANIMEMARKER = 0;
			};
		};
	//PLAYER NEARBY, DELETING MARKER AND STARTING MISSION...
		if (ANIMEMARKER isEqualTo 0) then 
		{
			//DELETE MARKER
			deleteMarker "OnHold";
			deleteMarker "SecondaryMarker";
		};
//============================================////============================================//