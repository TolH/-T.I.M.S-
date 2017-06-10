if (!hasInterface && !isDedicated) exitWith {};
//============================================////============================================//
	//BLACK SCREEN
		titleText ["", "BLACK", 0];
//============================================////============================================//
if (!isDedicated and hasInterface) then 
{
	waitUntil {alive vehicle player};
	//waituntil {!isnull (finddisplay 46)};
	waitUntil {typeOF player != "VirtualMan_EPOCH"};
	[] execVM "custom\loadout.sqf";
};