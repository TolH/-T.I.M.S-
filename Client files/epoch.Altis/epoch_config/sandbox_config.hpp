/*
	Epoch Mod Survival Gamemode

	Author: Epoch Mod Team - EpochMod.com

    Licence:
    Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

    Github:
    https://github.com/EpochModTeam/Epoch/tree/release/Sources/epoch_config/config.hpp
*/

author = "Epoch Mod Team";
class Header
{
 gameType = Survive;
 minPlayers = 1;
 maxPlayers = 201;
};
respawn = "BASE";
respawnDelay = 600;
respawnDialog = 0;
respawnButton = 0;
respawnOnStart = 0;
onPauseScript = "epoch_code\gui\scripts\Epoch_onPause.sqf";
onLoadMission= "Epoch";
OnLoadIntro = "Welcome to Epoch Mod";
loadScreen = "\x\addons\a3_epoch_assets\pictures\loadScreen_ca.paa";
OnLoadIntroTime = 0;
OnLoadMissionTime = 0;
onLoadName = "Epoch Mod";
disabledAI = 1;
scriptedPlayer = 1;
disableChannels[]={0,2};
enableItemsDropping = 1;
briefing = 0;
debriefing = 0;
enableDebugConsole = 0;
joinUnassigned = 0;
forceRotorLibSimulation = 0;
saving = 1;

corpseManagerMode = 1;
corpseLimit = 10;
corpseRemovalMinTime = 1200;
corpseRemovalMaxTime = 3600;

wreckManagerMode = 1;
wreckLimit = 2;
wreckRemovalMinTime = 60;
wreckRemovalMaxTime = 360;

disableRandomization[] = {"All"};

#include "Configs\CfgServicePoint.hpp"
#include "Configs\CfgItemSort.hpp"
#include "Configs\CfgTraderMissions.hpp"
#include "Configs\CfgMissions.hpp"
#include "Configs\CfgMissionsTasks.hpp"
#include "Configs\cfgCrafting.hpp"
#include "Configs\cfgPricing.hpp"
#include "Configs\CfgDynamicHUD.hpp"

#include "Configs\CfgEpochClient.hpp"

#include "Configs\CfgMasterLoop.hpp"
#include "Configs\CfgBaseBuilding.hpp"
#include "Configs\CfgSnapChecks.hpp"
#include "Configs\CfgBuildingLootPos.hpp"
#include "Configs\CfgActionMenu\CfgActionMenu_core.hpp"
#include "Configs\CfgEpochConfiguration.hpp"
#include "Configs\CfgClientFunctions.hpp"
#include "Configs\CfgObjectInteractions.hpp"
#include "Configs\CfgItemInteractions.hpp"
#include "Configs\CfgSay3Dhandler.hpp"
#include "Configs\CfgSwitchMovehandler.hpp"

// A3 specific configs
//#include "Configs\CfgFunctions.hpp"
#include "Configs\CfgRemoteExec.hpp"

class CfgEpochBuild
{
 	#include "build.hpp"
};
//====================================//====================================//