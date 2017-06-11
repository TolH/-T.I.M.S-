/*
										    -=TolH=- 
									(Heli_Paradrop_Timer_1.sqf)
									  TIMER FOR HELIPARADROP
				Usage: 
				nul_script8 = [] execVM HELI_PARADROP_TIMER_1;
				
				This will ADD reinforcment to the area every X minutes.
*/
//============================================////============================================//
private["_countHP1"];
	//START HELI_PARADROP_TIMER_1
	_countHP1 = 0;
		//SEND REINFORCEMENT AFTER A WHILE IF BUNKER IS PLAYER OWNED
		while {HeliTimer1 isEqualTo 1} do 
		{
			//wait for timer while loop method
			while {_countHP1 < 900 && HeliTimer1 isEqualTo 1} do 
			{
			  _countHP1 = _countHP1 + 1;
			  uiSleep 1;
				//SEND HELI_PARADROP #1
				if (_countHP1 isEqualTo 300) then 
				{
					//[LVgroup7] HP_WAVE1
					_LVgroup7 = [player,3,true,true,1500,"random",true,200,150,8,0.6,75,true,true,false,false,player,false,0.1,nil,nil,7,true,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #1 REACHED. SENDING IN AI REINFORCEMENTS _LVgroup7."];
					HP_WAVE1 = 1;
				};
				//SEND HELI_PARADROP #2
				if (_countHP1 isEqualTo 600) then 
				{
					//[LVgroup8] HP_WAVE2
					_LVgroup8 = [player,3,true,true,1500,"random",true,200,150,8,0.6,75,true,true,false,false,player,false,0.1,nil,nil,8,true,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #2 REACHED. SENDING IN AI REINFORCEMENTS LVgroup8."];
					HP_WAVE2 = 1;
				};
				//SEND HELI_PARADROP #3
				if (_countHP1 isEqualTo 900) then 
				{
					//[LVgroup9] HP_WAVE3
					_LVgroup9 = [player,3,true,true,1500,"random",true,200,150,8,0.6,75,true,true,false,false,player,false,0.1,nil,nil,9,true,false,["TOHL_HARD"]] execVM "TIMS\LV\heliParadrop.sqf";
					diag_log format ["-=T.I.M.S=-: HELI_PARADROP TIMER #3 REACHED. SENDING IN AI REINFORCEMENTS LVgroup9."];
					HP_WAVE3 = 1;
					//LAST TIMER REACHED, PREPARING TO EXIT
					_countHP1 = 901;
				};
			};
			//TIMER REACHED MAX LIMIT.
			if (_countHP1 >= 901) then 
			{
				//EXIT LOOP TIMER
				HeliTimer1 = 0;
			};
		};
	//DIAG_LOG AND HeliTimer1 CHECK
	diag_log format ["-=T.I.M.S=-: HELI_PARADROP COMPLETED! NO MORE TROOPS WILL BE SENT"];
	HeliTimer1 = 2;