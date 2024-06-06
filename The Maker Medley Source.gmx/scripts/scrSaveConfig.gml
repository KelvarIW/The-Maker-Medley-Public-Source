///scrSaveConfig
//saves current config settings
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    //in case fmns didn't work before
    if (file_exists_fmns(global.configWorkingPath)){
        file_copy_fmns(global.configWorkingPath, global.configPath);
        file_delete_fmns(global.configWorkingPath);
    }
    
    if (file_exists_fmns(global.configPath)){
        file_copy_fmns(global.configPath, global.configWorkingPath);
    }
}
ini_open(global.configWorkingPath);

//general settings
ini_write_real("Settings","Mute Music",global.muteMusic);
ini_write_real("Settings","Mute SFX",global.muteSFX);
ini_write_real("Settings","Main Volume",global.volumeLevel);
ini_write_real("Settings","Music Volume",global.musicLevel);
ini_write_real("Settings","SFX Volume",global.sfxLevel);
ini_write_real("Settings","Fullscreen mode",global.fullscreenMode);
//ini_write_real("Settings","Smoothing mode",global.smoothingMode);
ini_write_real("Settings","Vine Mode",global.vineMode);
ini_write_real("Settings","Automatic Restart",global.autoRestart);
ini_write_real("Settings","Autosave during Refights",global.refightAutosave);
ini_write_real("Settings","Shields during Refights",global.refightShields);
ini_write_real("Settings","Cutscenes start Buffed Fights",global.defaultBuffed);
//ini_write_real("Settings","Enable Dialogue",global.dialogue);
//graphics
ini_write_real("Graphics", "Enable Dropshadows",global.dropshadows);
ini_write_real("Graphics", "Extra Effects", global.extraEffects);
ini_write_real("Graphics", "Enable Identifiers",global.identifiers);
ini_write_real("Graphics", "Color Blind Assistance",global.colorBlind);

//keyboard controls
ini_write_real("Controls","Left",global.leftButton[0]);
ini_write_real("Controls","Right",global.rightButton[0]);
ini_write_real("Controls","Up",global.upButton[0]);
ini_write_real("Controls","Down",global.downButton[0]);
ini_write_real("Controls","Jump",global.jumpButton[0]);
ini_write_real("Controls","Shoot",global.shootButton[0]);
ini_write_real("Controls","Restart",global.restartButton[0]);
ini_write_real("Controls","Skip",global.skipButton[0]);
ini_write_real("Controls","Suicide",global.suicideButton[0]);
ini_write_real("Controls","Pause",global.pauseButton[0]);
ini_write_real("Controls","Align_left",global.alignLeftButton[0]);
ini_write_real("Controls","Align_right",global.alignRightButton[0]);

if (global.controllerEnabled)
{
    //controller options
    ini_write_real("Controller","Index",global.controllerIndex);
    ini_write_real("Controller","Left",global.leftButton[1]);
    ini_write_real("Controller","Right",global.rightButton[1]);
    ini_write_real("Controller","Up",global.upButton[1]);
    ini_write_real("Controller","Down",global.downButton[1]);
    ini_write_real("Controller","Jump",global.jumpButton[1]);
    ini_write_real("Controller","Shoot",global.shootButton[1]);
    ini_write_real("Controller","Restart",global.restartButton[1]);
    ini_write_real("Controller","Skip",global.skipButton[1]);
    ini_write_real("Controller","Suicide",global.suicideButton[1]);
    ini_write_real("Controller","Pause",global.pauseButton[1]);
    ini_write_real("Controller","Align_left",global.alignLeftButton[1]);
    ini_write_real("Controller","Align_right",global.alignRightButton[1]);
}

ini_close();

if (global.fmns){
    if (file_exists_fmns(global.configWorkingPath)){
        file_copy_fmns(global.configWorkingPath, global.configPath);
    }
}else{
    file_copy(global.configWorkingPath, global.configFailsafePath);
}
