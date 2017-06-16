if (!isDedicated) then
{
	//[0.40, 0.50, 0.010, 0.005, 1.5, 5, 1, 3, 0.5, 1.5] execVM "DamageSystemEffect\tunnelview.sqf";
	[0.20, 0.33, 3.5, 0.5, 5, 10, 10, 20] execVM "DamageSystemEffect\shake.sqf";
	[0.50, 0.5, 3, 0.25, 1, 2.5, 2, 4, 0.5, 1.5] execVM "DamageSystemEffect\blurred.sqf";
//	[0.84, 0.25, 0.15, 0.05, 1, 3, 1, 3, 0.5, 1.5] execVM "DamageSystemEffect\NearDeathMusic.sqf";
//	[0.70, 0.40, 0.55, 0.25, 1, 3, 2, 4, 0.5, 1.5] execVM "DamageSystemEffect\illusions.sqf";
//	[0.65, 0.25, 0.35, 0.05, 0.75, 1.5, 0.5, 1.0, 0.5, 1.0] execVM "DamageSystemEffect\illusions.sqf";
	[0.70, 2, 8, 15, 60] execVM "DamageSystemEffect\blackout.sqf";
};