//============================================////============================================//
	class CAPTURE_DEFEND_MISSION_START_NOTIFICATION
	{
		idd = -1;
		duration = 15;
		fadeIn = 1;
		fadeOut = 3;
		movingEnable = false;
		class controls
		{
			class MyRscStructuredText
			{
				idc = -1; 
				type = 13;
				style = 0;
				colorBackground[] = { 0.05, 0, 0.15, 0.30 };
				y = "SafeZoneY + (525 / 1080) * SafeZoneH";
				x = "SafeZoneX + (1425 / 1920) * SafeZoneW";
				w = "(480 / 1920) * SafeZoneW";
				h = "(120 / 1080) * SafeZoneH";
				size = 0.03;
				sizeEx = 0.03;
				text = "	                      <t size='1' color='#10b9c1'>Mission: -=CAPTURE_DEFEND=-</t><br />	                      Capture and Defend the RadioTower<br />	                      Kill all remaining forces.<br />	                      Difficulty: (SIM)";
				class Attributes
				{
					font = "PuristaMedium";
					color = "#ffffff";
					colorLink = "#D09B43";
					align = "left";
					shadow = 1;
				};
			};
			class MyTextRscFrame
			{
				type = 0;
				idc = -1;
				deletable = 0;
				style = 64;
				shadow = 2;
				colorBackground[] = {0,0,0,1};
				colorText[] = {1,1,1,1};
				font = "PuristaBold";
				sizeEx = 0.03;
				text = "";
				y = "SafeZoneY + (525 / 1080) * SafeZoneH";
				x = "SafeZoneX + (1425 / 1920) * SafeZoneW";
				w = "(480 / 1920) * SafeZoneW";
				h = "(120 / 1080) * SafeZoneH";
			};
			class MyRscPicture
			{
				deletable = 0;
				fade = 0;
				access = 0;
				type = 0;
				idc = -1;
				style = 48; //+ 0x800;
				colorBackground[] = {0, 0, 0, 1};
				colorText[] = {1, 1, 1, 1};
				font = "PuristaBold";
				sizeEx = 0;
				lineSpacing = 0;
				text = "TIMS\img\icon.paa" ;
				fixedWidth = 0;
				shadow = 1;
				x = "SafeZoneX + (1425 / 1920) * SafeZoneW";
				y = "SafeZoneY + (524.999999999999 / 1080) * SafeZoneH";
				w = "(120 / 1920) * SafeZoneW";
				h = "(120 / 1080) * SafeZoneH";
				tooltipColorText[] = {1, 1, 1, 1};
				tooltipColorBox[] = {1, 1, 1, 1};
				tooltipColorShade[] = {0, 0, 0, 1};
			};
			class MyPicRscFrame
			{
				type = 0;
				idc = -1;
				deletable = 0;
				style = 64;
				shadow = 2;
				colorBackground[] = {0,0,0,1};
				colorText[] = {1,1,1,1};
				font = "PuristaBold";
				sizeEx = 0.03;
				text = "";
				x = "SafeZoneX + (1425 / 1920) * SafeZoneW";
				y = "SafeZoneY + (524.999999999999 / 1080) * SafeZoneH";
				w = "(120 / 1920) * SafeZoneW";
				h = "(120 / 1080) * SafeZoneH";
			};
		};
	};
//============================================////============================================//