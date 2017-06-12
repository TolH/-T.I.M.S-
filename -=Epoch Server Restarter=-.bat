	@ECHO off
	COLOR 0A
	TITLE Epoch Server restarter
	SETLOCAL EnableExtensions enabledelayedexpansion
	SET StartServer=arma3server_x64.exe
	SET /A restartCounter=0


	REM -================================================================================-
	REM RESTART TIME HERE IN HOURS
	SET Restart= 3
	REM SERVER LAUNCH PARAMETERS  D:\Arma3 Mods\@CUP_Terrains_Core;D:\Arma3 Mods\@CUP_Terrains_Maps;
	SET ServerMods= "-serverMod=@epochhive;@AdvancedSlingLoading;@AdvancedUrbanRappelling;" "-mod=@epoch;Kart;Mark;Heli;@CBA_A3;D:\Arma3 Mods\@CUP_Units;D:\Arma3 Mods\@CUP_Vehicles;D:\Arma3 Mods\@CUP_Weapons;" -config=@epochhive\server.cfg -port=2302 -profiles=SC_EPOCH -cfg=@epochhive\basic.cfg -name=SC_EPOCH -malloc=tbbmalloc -autoinit
	SET /A Hours=%Restart%*3600
	GOTO StartArma3Server
	REM -================================================================================-


	:StartArma3Server
	ECHO 			   ========================================
	ECHO 		Starting Arma 3 Server, The server has been restarted (%restartCounter%) times.
	ECHO 			   ========================================
	START /b %StartServer% %ServerMods%
	ECHO 	      	   Server SET to restart every %Restart% Hours, standing by...
	TIMEOUT %Hours% /NOBREAK
	GOTO RestartServer

	:RestartServer
	SET /A restartCounter+=1
	ECHO 			   ========================================
	ECHO 			Please wait while the server is restarting.
	ECHO 			   ========================================
    TASKKILL /F /IM %StartServer% >nul
	TIMEOUT 4 >nul
	CLS
	GOTO StartArma3Server