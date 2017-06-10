//============================================////============================================//
	//TO USE: _patrol = [_grp, (getMarkerPos _marker), 200] call UNITS_PATROL;
	_grp = _this select 0;
	_pos = _this select 1;
	_maxDist = _this select 2;
	_mode = ["YELLOW", "RED"] call BIS_fnc_selectRandom;
	_formation = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"] call BIS_fnc_selectRandom;
	//
	for "_i" from 0 to (2 + (floor (random 3))) do {
		_newPos = [_pos, 15, _maxDist, 1, 0, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
		_wp = _grp addWaypoint [_newPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode _mode;
		_wp setWaypointFormation _formation;
		_wp setWaypointCompletionRadius 20;
	};
	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointCompletionRadius 20;
	true
//============================================////============================================//