/*
//============================================////============================================//
	//--CONFIG--//
		reward_player 	= 0;		//Reward by time played. 			(enable=1 / disable=0)
//============================================////============================================//
	//View Distance
		CHVD_allowNoGrass = true; // Set 'false' if you want to disable "None" option for terrain (default: true)
		CHVD_maxView = 3000; // Set maximum view distance (default: 12000)
		CHVD_maxObj = 3000; // Set maximimum object view distance (default: 12000)
	//EarPlugs
		call compile preProcessFileLineNumbers "cmEarplugs\config.sqf";
*/
//============================================////============================================//
	if (hasInterface) then 
	{
		[] execVM "addons\status_bar\init_statusBar.sqf";
		//[] execVM "custom\BytimePlayed.sqf";
		[] execVM "custom\DLC.sqf";
	};
//============================================////============================================//
	//Trader by Halv & Suppe
		//[] execVM "trader\init.sqf";
		//[] execVM "trader\resetvehicleammo.sqf";
		//[] execVM "trader\HALV_takegive_crypto_init.sqf";
		//[] execVM "addons\messages\init.sqf";
//============================================////============================================//
	//SLINGLOAD
		//null = [] execVM "custom\vehicle\auxslingloading.sqf";
	//Chat
		[] execVM "module_chatIntercept\init.sqf";
//============================================////============================================//
