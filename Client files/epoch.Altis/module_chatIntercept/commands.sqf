pvpfw_chatIntercept_allCommands = [
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			}forEach pvpfw_chatIntercept_allCommands;
			systemChat format["Available Commands: %1",_commands];
		}
	],
	[
		"crypto",
		{
			hint format ["%1",EPOCH_playerCrypto];
		}
	],
	[
		"alive",
		{
			hint format ["%1",EPOCH_playerAliveTime];
		}
	],
	[
		"gear",
		{
			//execVM "ASORGS\open.sqf";
		}
	]
];