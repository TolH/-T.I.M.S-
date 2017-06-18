//============================================////============================================//
//PUBLICVARIABLEEVENTHANDLER
	//"showNotification"
	"showNotification" addPublicVariableEventHandler
	{
		private ["_type", "_message"];
		_array = _this select 1;
		_type = _array select 0;
		_message = "";
		if (count _array > 1) then { _message = _array select 1; };
		[_type, [_message]] call BIS_fnc_showNotification;
	};
	//"GlobalHint"
	"GlobalHint" addPublicVariableEventHandler
	{
		private ["_GHint"];
		_GHint = _this select 1;
		hint parseText format["%1", _GHint];
	};
	//TOWER PROGRESS BAR
	//  tower_Bar_progress = "custom\tower\tower_Bar_progress.sqf"; publicVariable "tower_Bar_progress";
    //	execVM tower_Bar_progress;
	"tower_Bar_progress" addPublicVariableEventHandler
	 {
		private ["_forAll"];
		
		_forAll = _this select 1;
		execVM _forAll;
	 };
//============================================////============================================//
//NOT USED BUT WORKS
/*
	//Epoch_Message1 = "A player is attempting to capture the tower..."; publicVariable "Epoch_Message1";
	//"Epoch_Message1" 
	"Epoch_Message1" addPublicVariableEventHandler
	{
		private ["_Epoch_msg"];
		_Epoch_msg = _this select 1;
		[_Epoch_msg, 10] call Epoch_message;
	};
*/