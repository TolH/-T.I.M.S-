	"my_awesome_progressBar" addPublicVariableEventHandler {
		with uiNamespace do {
		my_awesome_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		my_awesome_progressBar ctrlSetPosition [ 0.345, 0.3 ];
		my_awesome_progressBar progressSetPosition 0;
		my_awesome_progressBar ctrlCommit 0;
		};
	};
	[ "TIMER", "onEachFrame", {
		params[ "_start", "_end" ];
		_progress = linearConversion[ _start, _end, time, 0, 1 ];
		publicVariable "my_awesome_progressBar" progressSetPosition _progress;

		if ( _progress > 1 ) then 
		{
			[ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
			ctrlDelete publicVariable "my_awesome_progressBar";
		};
	}, [ time, time + 20 ] ] call BIS_fnc_addStackedEventHandler;

	
	
/* THIS WORKS!!! BUT ONLY CLIENT SIDE.
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
}, [ time, time + 20 ] ] call BIS_fnc_addStackedEventHandler;
*/
//Altimeter
while {true} do {
hintsilent parseText format["<t color='#FFFFFF' shadow='1' shadowColor='#000000' underline='true'>Altitude<br/></t><t color='#66F4F0' size='1.4'>%1</t>",(getPosASL player) select 2];
sleep 0.1;
};