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
 maxPlayers = 200;
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
enableItemsDropping = 0;
briefing = 0;
debriefing = 0;
enableDebugConsole = 0;
joinUnassigned = 0;
forceRotorLibSimulation = 1;
saving = 0;

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
//Notifications
class CfgNotifications
{
//====================================//
	class Default
	{
		title = ""; 			// Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; 		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; 			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; 		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; 	// Icon and text color
		duration = 8; 			// How many seconds will the notification be displayed
		priority = 0; 			// Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; 		// Required difficulty settings. All listed difficulties has to be enabled
	};
//====================================//
	class NewMain
	{
		title = "PRIMARY OBJECTIVE";
		description = "%1";
		iconPicture = "media\images\notificons\main_objective.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 8;
		priority = 9;
	};
	class CompletedMain
	{
		title = "PRIMARY OBJECTIVE COMPLETED";
		description = "%1";
		iconPicture = "media\images\notificons\main_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
//====================================//
	class NewSub
	{
		title = "NEW SUB-OBJECTIVE";
		description = "%1";
		iconPicture = "media\images\notificons\sub_objective.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 8;
	};
	class CompletedSub
	{
		title = "SUB-OBJECTIVE COMPLETED";
		description = "%1";
		iconPicture = "media\images\notificons\sub_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};
//====================================//
	class NewSecondary
	{
		title = "SECONDARY OBJECTIVE";
		description = "%1";
		iconPicture = "media\images\notificons\sub_objective.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 8;
	};

	class CompletedSecondary
	{
		title = "SECONDARY OBJECTIVE COMPLETED";
		description = "%1";
		iconPicture = "media\images\notificons\sub_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
//====================================//
	class NewOptional
	{
		title = "NEW OPTIONAL OBJECTIVE";
		description = "%1";
		iconPicture = "media\images\notificons\side_mission.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
	class CompletedOptional
	{
		title = "OPTIONAL OBJECTIVE COMPLETED";
		description = "%1";
		iconPicture = "media\images\notificons\side_mission_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
	class OptionalFailed
	{
		title = "OPTIONAL OBJECTIVE FAILED";
		description = "%1";
		iconPicture = "media\images\notificons\failed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
//====================================//
	class RadioTowerCAS
	{
		title = "RadioTower";
		description = "%1";
		iconPicture = "media\images\notificons\enemyJetinbound.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
		duration = 8;
	};
//====================================//
	class RadioTowerTakenByAI
	{
		title = "RadioTower Taken By AI";
		description = "%1";
		iconPicture = "media\images\notificons\failed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
	class RadioTowerTakenByPlayer
	{
		title = "RadioTower Taken By Player";
		description = "%1";
		iconPicture = "media\images\notificons\side_mission_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 7;
		priority = 9;
	};
};
//====================================//
//====================================//====================================//