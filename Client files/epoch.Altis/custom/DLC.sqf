/*
	fuckdlclock.sqf
	by Halv

	put this file in a folder called custom in the root of your mission.pbo
	in the init.sqf add this:

	////////////////////////////////////
	[]execVM "custom\fuckdlclock.sqf";//
	////////////////////////////////////

	create another file called custom\moveInDriver.sqf and put this in it:

	//////////////////////////////
	_target = _this select 3;/////
	player moveInDriver _target;//
	//////////////////////////////

*/

if((288520 in getDLCs 1) && (304380 in getDLCs 1))exitWith{diag_log "Player has DLC content";};

_DLCaction1 = -1;
_DLCaction2 = -1;

if(isServer)exitWith{};
waitUntil {!isNull (findDisplay 46)};
waitUntil {!dialog};

while{alive player}do{
	_object = cursorTarget;
// ROFL ...
	if(!isNull _object)then{
		if (288520 in getDLCs 2) then {
			if(getText(configFile >> 'cfgvehicles' >> (typeOf _object) >> 'DLC') == 'Kart' && player distance _object < 4 && isNull driver _object && locked _object in [0,1])then{
				if (_DLCaction1 < 0) then {
					_txt = (gettext (configFile >> 'cfgvehicles' >> (typeOf _object) >> 'displayName'));
					_DLCaction1 = player addAction [format["<t color='#0096ff'>Get in %1 as Driver</t>",_txt], "custom\moveInDriver.sqf", _object, 6, true, true, "", ""];
				};
			}else{
				player removeAction _DLCaction1;
				_DLCaction1 = -1;
			};
		};
// ROFL-Copter ...
		if (304380 in getDLCs 2) then {
			if(getText(configFile >> 'cfgvehicles' >> (typeOf _object) >> 'DLC') == 'Heli' && player distance _object < 10 && isNull driver _object && locked _object in [0,1])then{
				if (_DLCaction2 < 0) then {
					_txt = (gettext (configFile >> 'cfgvehicles' >> (typeOf _object) >> 'displayName'));
					_DLCaction2 = player addAction [format["<t color='#0096ff'>Get in %1 as Pilot</t>",_txt], "custom\moveInDriver.sqf", _object, 6, true, true, "", ""];
				};
			}else{
				player removeAction _DLCaction2;
				_DLCaction2 = -1;
			};
		};
	};
	if(player != vehicle player) then{
		player removeAction _DLCaction1;
		_DLCaction1 = -1;
		player removeAction _DLCaction2;
		_DLCaction2 = -1;
	};
	uiSleep 2;
};