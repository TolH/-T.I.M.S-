objNull spawn {
	titleText ["Creating vehicle, just a moment...", "BLACK", 3];
	uiSleep 2.9;
	//sleep 2; //wait for client to be able to check vehicles positions properly again.
	_somedeleted =false;
	{
		deleteVehicle _x;
		_somedeleted =true;
	}
	forEach (ASORVS_VehicleSpawnPos nearEntities ASORVS_VehicleSpawnRadius);
	if(_somedeleted) then {
		sleep 2;
	};
	_veh = createVehicle [ASORVS_CurrentVehicle, ASORVS_VehicleSpawnPos, [], 0, "CAN_COLLIDE"];
	_veh call EPOCH_server_setVToken;
	_veh remoteexec ['EPOCH_server_setVToken',2];
	_veh setVehicleLock "UNLOCKED";
	_veh setDir ASORVS_VehicleSpawnDir;
	//CUSTOM ADD
	//TELE PLAYER AT VEHICLE AFTER SPAWNNED
	player setPos ASORVS_VehicleSpawnPos;
	uiSleep 0.2;
	player moveInDriver _veh;
	player switchCamera "INTERNAL";
	uiSleep 3;
	titleText ["", "BLACK IN", 6];
};