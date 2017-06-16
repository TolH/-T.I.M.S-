private ["_veh"];
_veh = _this select 0;

if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};

if (!(_veh isKindOf "helicopter")) exitWith { 
	titleText ["This pad is for Helicopter service only, soldier!", "PLAIN"];
};

titleText ["Servicing Helicopter, please wait ...", "PLAIN"];
_veh setFuel 0;
uiSleep 3;
//---------- RE-ARMING
titleText ["Re-arming ...", "PLAIN"];
	with uiNamespace do {
		my_awesome_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		my_awesome_progressBar ctrlSetPosition [ 0.345, 0.3 ];
		my_awesome_progressBar progressSetPosition 0;
		my_awesome_progressBar ctrlCommit 0;
	};
[ "TIMER", "onEachFrame", {
    params[ "_start", "_end" ];
    _progress = linearConversion[ _start, _end, time, 0, 1 ];
    (uiNamespace getVariable "my_awesome_progressBar") progressSetPosition _progress;

	if ( _progress > 1 ) then 
	{
		[ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
		ctrlDelete (uiNamespace getVariable "my_awesome_progressBar");
	};
}, [ time, time + 10 ] ] call BIS_fnc_addStackedEventHandler;
uiSleep 10.1;
_veh setVehicleAmmo 1;
//---------- REPAIRING
titleText ["Repairing ...", "PLAIN"];
	with uiNamespace do {
		my_awesome_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		my_awesome_progressBar ctrlSetPosition [ 0.345, 0.3 ];
		my_awesome_progressBar progressSetPosition 0;
		my_awesome_progressBar ctrlCommit 0;
	};
[ "TIMER", "onEachFrame", {
    params[ "_start", "_end" ];
    _progress = linearConversion[ _start, _end, time, 0, 1 ];
    (uiNamespace getVariable "my_awesome_progressBar") progressSetPosition _progress;

	if ( _progress > 1 ) then 
	{
		[ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
		ctrlDelete (uiNamespace getVariable "my_awesome_progressBar");
	};
}, [ time, time + 10 ] ] call BIS_fnc_addStackedEventHandler;
uiSleep 10.1;
_veh setDamage 0;
//---------- REFUELING
titleText ["Refueling ...", "PLAIN"];
	with uiNamespace do {
		my_awesome_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		my_awesome_progressBar ctrlSetPosition [ 0.345, 0.3 ];
		my_awesome_progressBar progressSetPosition 0;
		my_awesome_progressBar ctrlCommit 0;
	};
[ "TIMER", "onEachFrame", {
    params[ "_start", "_end" ];
    _progress = linearConversion[ _start, _end, time, 0, 1 ];
    (uiNamespace getVariable "my_awesome_progressBar") progressSetPosition _progress;

	if ( _progress > 1 ) then 
	{
		[ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
		ctrlDelete (uiNamespace getVariable "my_awesome_progressBar");
	};
}, [ time, time + 9 ] ] call BIS_fnc_addStackedEventHandler;
uiSleep 10.1;
_veh setFuel 1;
//---------- FINISHED
titleText ["Service complete.", "PLAIN"];