///scrInitDirec();
// Note: "Backup" paths are used for loading previous save data when FMNS first fails to load
//       "Failsafe" paths are used until FMNS loads correctly again
//       If a "Failsafe" file exists, it is loaded in place of the save directory
show_debug_message("Working Dir: " + string(global.workingDir));
show_debug_message("Program Dir: " + string(global.programDir));

global.saveDataPath = global.programDir + "Save Data";

// Record
global.recordPath = global.programDir + "Save Data\TMM_Record";
global.recordWorkingPath = global.workingDir + "TMM_Record";
global.recordFailsafePath = global.workingDir + "Failsafe TMM_Record";
global.recordBackupAppend = " Backup";

// Saves (append save ID number)
global.savePath = global.programDir + "Save Data\Save ";
global.saveWorkingPath = global.workingDir + "Save ";
global.saveBackupAppend = " Backup ";
global.saveInvalidPath = global.programDir + "Save Data\Invalid Save ";
global.saveFailsafeBackupInvalidPath = global.workingDir + "Invalid Save ";
global.saveFailsafePath = global.workingDir + "Failsafe Save ";

// Config
global.configPath = global.programDir + "Save Data\config.ini";
global.configWorkingPath = global.workingDir + "config.ini";
global.configFailsafePath = global.workingDir + "Failsafe config.ini";
