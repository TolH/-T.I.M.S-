//============================================////============================================//
	//MESSAGING
//============================================////============================================//
	//"GlobalHint"
	"GlobalHint" addPublicVariableEventHandler
	{
		private ["_GHint"];
		_GHint = _this select 1;
		hint parseText format["%1", _GHint];
	};
//============================================////============================================//
	//SERVER CALL ALL CLIENT TO EXECUTE SQF SCRIPT
//============================================////============================================//
		//SERVER USE:
		//	Execute_Client_SQF = "GUI_ON_THE_FLY\tower\AI_tower_Bar_progress.sqf"; publicVariable "Execute_Client_SQF";
		//	execVM Execute_Client_SQF;
	//tower_Bar_progress
	"Execute_Client_SQF" addPublicVariableEventHandler
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
