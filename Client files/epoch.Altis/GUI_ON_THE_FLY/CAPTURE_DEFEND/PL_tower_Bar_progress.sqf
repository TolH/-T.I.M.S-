//============================================////============================================//
 with uiNamespace do {  
  ctrlDelete (uiNamespace getVariable "AI_capture_radiotower_img");  
  ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_img");  
  PL_capture_radiotower_img = findDisplay 46 ctrlCreate ["RscStructuredText", -1];   
  PL_capture_radiotower_img ctrlSetScale 2;  
  PL_capture_radiotower_img ctrlSetPosition [0.91, 0.978, 1, 1]; 
  PL_capture_radiotower_img ctrlSetStructuredText parseText "<img image='\A3\weapons_f\items\data\ui\gear_gps_CA.paa'/> "; 
  PL_capture_radiotower_img ctrlCommit 0;   
 
  ctrlDelete (uiNamespace getVariable "AI_capture_radiotower_img2");
  ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_img2");
  PL_capture_radiotower_img2 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];   
  PL_capture_radiotower_img2 ctrlSetScale 1.3;  
  PL_capture_radiotower_img2 ctrlSetPosition [0.988, 0.940, 1, 1];    
  PL_capture_radiotower_img2 ctrlSetStructuredText parseText "<img image='\A3\data_f\Flags\flag_nato_co.paa'/> "; 
  PL_capture_radiotower_img2 ctrlCommit 0;  
 
  ctrlDelete (uiNamespace getVariable "AI_capture_radiotower_progressBar");  
  ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_progressBar"); 
  PL_capture_radiotower_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];  
  PL_capture_radiotower_progressBar ctrlSetTextColor [0.73, 0.24, 0.11, 1]; 
  PL_capture_radiotower_progressBar ctrlSetScale 1.4;  
  PL_capture_radiotower_progressBar ctrlSetPosition [1, 1.005 ,0.08 , 0.02];  
  PL_capture_radiotower_progressBar progressSetPosition 0;  
  PL_capture_radiotower_progressBar ctrlCommit 0;  
    
  ctrlDelete (uiNamespace getVariable "AI_capture_radiotower_progress_text");  
  ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_progress_text");  
  PL_capture_radiotower_progress_text = findDisplay 46 ctrlCreate ["RscStructuredText", -1];  
  PL_capture_radiotower_progress_text ctrlSetScale 1;  
  PL_capture_radiotower_progress_text ctrlSetPosition [0.995, 1];  
  PL_capture_radiotower_progress_text ctrlCommit 0;  
 }; 
 [ "TIMER", "onEachFrame", {  
   params[ "_start", "_end"];  
   _progress = linearConversion [_start, _end, time, 0, 1];  
   (uiNamespace getVariable "PL_capture_radiotower_progressBar") progressSetPosition _progress;  
   (uiNamespace getVariable "PL_capture_radiotower_progress_text") ctrlSetStructuredText parseText format["%1%2", round(100*_progress), "%"];  
    if (_progress > 1) then {  
    [ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;  
    ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_progressBar");  
    ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_progress_text");  
    ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_img");
	ctrlDelete (uiNamespace getVariable "PL_capture_radiotower_img2");
    };  
}, [time, time + 724]] call BIS_fnc_addStackedEventHandler;
//============================================////============================================//