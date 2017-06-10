/*
	HALV_takegive_crypto.sqf
	by Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/

_cryptolimit = 25000;

_player = _this select 0;
_nr = _this select 1;
_cIndex=EPOCH_customVars find 'Crypto';
_vars = _player getVariable['VARS', call EPOCH_defaultVars_SEPXVar];
_curcrypt = _vars select _cIndex;
_newcrypt = ((_curcrypt+_nr)min _cryptolimit)max 0;
_newcrypt remoteExec ['EPOCH_effectCrypto',(owner _player)];
_vars set[_cIndex,_newcrypt];
_player setVariable["VARS",_vars];
