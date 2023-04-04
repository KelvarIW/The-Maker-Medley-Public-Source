///scrLoadConfig()
//loads config settings, sets default config if it doesn't exist
if (global.fmns){
    if (!directory_exists_fmns(global.saveDataPath)){
        directory_create_fmns(global.saveDataPath);
    }
    if (file_exists_fmns(global.configPath)){
        file_copy_fmns(global.configPath, global.configWorkingPath);
    }
}
ini_open(global.configWorkingPath);

//general settings
global.muteMusic = ini_read_real("Settings","Mute Music",false);
global.muteSFX = ini_read_real("Settings","Mute SFX",false);
global.volumeLevel = clamp(floor(ini_read_real("Settings","Main Volume", 80)),0,100);
global.musicLevel = clamp(floor(ini_read_real("Settings","Music Volume",50)),0,100);
global.sfxLevel = clamp(floor(ini_read_real("Settings","SFX Volume",50)),0,100);
global.fullscreenMode = ini_read_real("Settings","Fullscreen mode",false);
global.smoothingMode = false; //ini_read_real("Settings","Smoothing mode",false);
global.vineMode = ini_read_real("Settings","Vine Mode", 1);
global.autoRestart = ini_read_real("Settings","Automatic Restart", false);
global.refightAutosave = ini_read_real("Settings","Autosave during Refights", true);
global.refightShields = ini_read_real("Settings","Shields during Refights", true);
global.defaultBuffed = ini_read_real("Settings","Cutscenes start Buffed Fights", false);

//global.dialogue = ini_read_real("Settings","Enable Dialogue", true);

//graphics
global.dropshadows = ini_read_real("Graphics", "Enable Dropshadows",true);
global.extraEffects = ini_read_real("Graphics", "Extra Effects",true);
global.identifiers = ini_read_real("Graphics", "Enable Identifiers", true);
global.colorBlind = ini_read_real("Graphics", "Color Blind Assistance", false);
global.screenshake = ini_read_real("Graphics", "Screen Shake", 1);

if (!global.muteSFX){
    audio_group_set_gain(RoomSounds, global.sfxLevel/100 * global.volumeLevel/100, 0);
}else{
    audio_group_set_gain(RoomSounds, 0, 0);
}

window_set_fullscreen(global.fullscreenMode);

//keyboard controls
global.leftButton[0] = ini_read_real("Controls","Left",vk_left);
global.rightButton[0] = ini_read_real("Controls","Right",vk_right);
global.upButton[0] = ini_read_real("Controls","Up",vk_up);
global.downButton[0] = ini_read_real("Controls","Down",vk_down);
global.jumpButton[0] = ini_read_real("Controls","Jump",vk_shift);
global.shootButton[0] = ini_read_real("Controls","Shoot",ord("Z"));
global.restartButton[0] = ini_read_real("Controls","Restart",ord("R"));
global.skipButton[0] = ini_read_real("Controls","Skip",ord("S"));
global.suicideButton[0] = ini_read_real("Controls","Suicide",ord("Q"));
global.pauseButton[0] = ini_read_real("Controls","Pause",ord("P"));
global.alignLeftButton[0] = ini_read_real("Controls","Align_left",ord("A"));
global.alignRightButton[0] = ini_read_real("Controls","Align_right",ord("D"));

//menu keys (not rebindable)
global.menuLeftButton[0] = vk_left;
global.menuRightButton[0] = vk_right;
global.menuUpButton[0] = vk_up;
global.menuDownButton[0] = vk_down;
global.menuAcceptButton[0] = vk_shift;
global.menuBackButton[0] = ord("Z");
global.menuOptionsButton[0] = vk_enter;

if (global.controllerEnabled)
{
    //controller options
    global.controllerIndex = ini_read_real("Controller", "Index", -1); //-1 means no controller
    global.leftButton[1] = ini_read_real("Controller","Left",gp_padl);
    global.rightButton[1] = ini_read_real("Controller","Right",gp_padr);
    global.upButton[1] = ini_read_real("Controller","Up",gp_padu);
    global.downButton[1] = ini_read_real("Controller","Down",gp_padd);
    global.jumpButton[1] = ini_read_real("Controller","Jump",gp_face1);
    global.shootButton[1] = ini_read_real("Controller","Shoot",gp_face3);
    global.restartButton[1] = ini_read_real("Controller","Restart",gp_face4);
    global.skipButton[1] = ini_read_real("Controller","Skip",gp_face2);
    global.suicideButton[1] = ini_read_real("Controller","Suicide",gp_select);
    global.pauseButton[1] = ini_read_real("Controller","Pause",gp_start);
    global.alignLeftButton[1] = ini_read_real("Controller","Align_left",gp_shoulderl);
    global.alignRightButton[1] = ini_read_real("Controller","Align_right",gp_shoulderr);
}

//menu buttons (not rebindable)
global.menuLeftButton[1] = gp_padl;
global.menuRightButton[1] = gp_padr;
global.menuUpButton[1] = gp_padu;
global.menuDownButton[1] = gp_padd;
global.menuAcceptButton[1] = gp_face1;
global.menuBackButton[1] = gp_face2;
global.menuOptionsButton[1] = gp_select;

ini_close();
scrSaveConfig();    //save config in case something changed
