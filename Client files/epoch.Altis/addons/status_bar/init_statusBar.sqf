waitUntil {!isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
waitUntil {isNuLL(uiNameSpace getVariable ["EPOCH_loadingScreen",displayNull])};
waitUntil {!isNull player};
waitUntil {!(isNull (findDisplay 46))};

[] execVM "addons\status_bar\playerBar.sqf";