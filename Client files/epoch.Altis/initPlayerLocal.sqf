//============================================////============================================//
	//MESSAGING
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
//============================================////============================================//
	//DEFEND_CAPTURE MISSION PROGRESS BAR
//============================================////============================================//
		//SERVER USE:
		//	AI_tower_Bar_progress = "GUI_ON_THE_FLY\tower\AI_tower_Bar_progress.sqf"; publicVariable "AI_tower_Bar_progress";
		//	execVM AI_tower_Bar_progress;
	//AI_tower_Bar_progress
	"AI_tower_Bar_progress" addPublicVariableEventHandler
	 {
		private ["_forAll"];
		
		_forAll = _this select 1;
		execVM _forAll;
	 };
	//PL_tower_Bar_progress
	"PL_tower_Bar_progress" addPublicVariableEventHandler
	 {
		private ["_forAll"];
		
		_forAll = _this select 1;
		execVM _forAll;
	 };
//============================================////============================================//
	//CUSTOM SOUND TO SEND TO EVERYONE
//============================================////============================================//
		//SERVER USE:
		//	SFX_CUSTOM = "sound_here_from_description_ext"; publicVariable "SFX_CUSTOM";
	//SFX_CUSTOM
	"SFX_CUSTOM" addPublicVariableEventHandler
	{
		private ["_soundSFX"];
		_soundSFX = _this select 1;
		playSound _soundSFX;
	};
//============================================////============================================//
	//CUSTOM UI FOR MISSION MESSAGE NOTIFICATION
//============================================////============================================//
		//SERVER USE:
		//	MISSION_NOTIFICATION_MSG = "RscTitles_from_description_ext"; publicVariable "MISSION_NOTIFICATION_MSG";
	//MISSION_NOTIFICATION_MSG
	"MISSION_NOTIFICATION_MSG" addPublicVariableEventHandler
	{
		private ["_MissionMSG"];
		_MissionMSG = _this select 1;
		cutRsc [_MissionMSG, "PLAIN"];
	};
//============================================////============================================//
