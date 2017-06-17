//=========================================================================//
//CREDITS: Larrow (https://forums.bistudio.com/forums/topic/186904-create-a-progress-bar-depending-on-a-vars-value/?page=2)
//=========================================================================//
titleText ["Re-arming ...", "PLAIN"];
	with uiNamespace do {
		//DELETE HERE SO BAR CAN BE SPAMMABLE NOT STACK
		ctrlDelete (uiNamespace getVariable "my_awesome_progressBar");
		my_awesome_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		my_awesome_progressBar ctrlSetScale 1.8;
		my_awesome_progressBar ctrlSetPosition [ 0.25, 0.55 ];
		my_awesome_progressBar progressSetPosition 0;
		my_awesome_progressBar ctrlCommit 0;
		//DELETE HERE SO BAR CAN BE SPAMMABLE NOT STACK
		ctrlDelete (uiNamespace getVariable "my_awesome_text");
		my_awesome_text = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		my_awesome_text ctrlSetScale 1;
		my_awesome_text ctrlSetPosition [ 0.25, 0.55];
		my_awesome_text ctrlCommit 0;
	};
	[ "TIMER", "onEachFrame", {
		 params[ "_start", "_end" ];
		 _progress = linearConversion[ _start, _end, time, 0, 1 ];
		 (uiNamespace getVariable "my_awesome_progressBar") progressSetPosition _progress;
		 (uiNamespace getVariable "my_awesome_text") ctrlSetStructuredText parseText format["%1%2", round(100*_progress), "%"];
		  if ( _progress > 1 ) then {
		  [ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;
		  ctrlDelete (uiNamespace getVariable "my_awesome_progressBar");
		  ctrlDelete (uiNamespace getVariable "my_awesome_text");
		  };
}, [ time, time + 10 ] ] call BIS_fnc_addStackedEventHandler;
//=========================================================================//