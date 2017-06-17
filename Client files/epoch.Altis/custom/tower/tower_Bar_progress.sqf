//============================================////============================================//
 with uiNamespace do {  
  ctrlDelete (uiNamespace getVariable "capture_radiotower_img");  
  capture_radiotower_img = findDisplay 46 ctrlCreate ["RscStructuredText", -1];   
  capture_radiotower_img ctrlSetScale 2;  
  capture_radiotower_img ctrlSetPosition [0.91, 0.978, 1, 1];   
  capture_radiotower_img ctrlSetStructuredText parseText "<img color='' image='\A3\weapons_f\items\data\ui\gear_gps_CA.paa'/> "; 
  capture_radiotower_img ctrlCommit 0;   
 
  ctrlDelete (uiNamespace getVariable "capture_radiotower_progressBar");  
  capture_radiotower_progressBar = findDisplay 46 ctrlCreate ["RscProgress", -1];  
  capture_radiotower_progressBar ctrlSetTextColor [0.73, 0.24, 0.11, 1]; 
  capture_radiotower_progressBar ctrlSetScale 1.4;  
  capture_radiotower_progressBar ctrlSetPosition [1, 1.005 ,0.08 , 0.02];  
  capture_radiotower_progressBar progressSetPosition 0;  
  capture_radiotower_progressBar ctrlCommit 0;  
    
  ctrlDelete (uiNamespace getVariable "capture_radiotower_progress_text");  
  capture_radiotower_progress_text = findDisplay 46 ctrlCreate ["RscStructuredText", -1];  
  capture_radiotower_progress_text ctrlSetScale 1;  
  capture_radiotower_progress_text ctrlSetPosition [0.995, 1];  
  capture_radiotower_progress_text ctrlCommit 0;  
 }; 
 [ "TIMER", "onEachFrame", {  
   params[ "_start", "_end"];  
   _progress = linearConversion [_start, _end, time, 0, 1];  
   (uiNamespace getVariable "capture_radiotower_progressBar") progressSetPosition _progress;  
   (uiNamespace getVariable "capture_radiotower_progress_text") ctrlSetStructuredText parseText format["%1%2", round(100*_progress), "%"];  
    if (_progress > 1) then {  
    [ "TIMER", "onEachFrame" ] call BIS_fnc_removeStackedEventHandler;  
    ctrlDelete (uiNamespace getVariable "capture_radiotower_progressBar");  
    ctrlDelete (uiNamespace getVariable "capture_radiotower_progress_text");  
    ctrlDelete (uiNamespace getVariable "capture_radiotower_img");  
    };  
}, [time, time + 722]] call BIS_fnc_addStackedEventHandler;
//============================================////============================================//