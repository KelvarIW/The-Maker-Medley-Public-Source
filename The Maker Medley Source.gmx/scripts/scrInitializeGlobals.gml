//initializes all global variables needed for the game
scrSetGlobalOptions();       //initialize global game options

if (!is_string(global.workingDir)){
    global.workingDir = "";
}

global.savenum = 1;
global.totalSaves = 3;
global.difficulty = 0;  //0 = medium, 1 = hard, 2 = very hard, 3 = impossible
global.death = 0;
global.time = 0;
global.timeMicro = 0;
global.saveRoom = "rStage01Abstr4ktNew";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.playerScale = 1;
global.savePlayerScale = 1;
global.playerXScale = 1;
global.savePlayerXScale = 1;
global.playerPower = 0; //0 = none; 1 = co-op teleporter; 2 = telejump
global.savePlayerPower = 0;
global.playerJumps = 2; //3 = yellow star, 2 = grey, 1 = black
global.savePlayerJumps = 2;
global.grav = 1;
global.saveGrav = 1;
global.dotkid = false; // ADDED: whether or not player is dotkid
global.vine7 = 0; //ADDED: jungle adventure vines
global.playerV = false; // ADDED: vvvvvv kid
global.invertControls = false; //ADDED: invert controls for walk the ceiling 
global.count = 0; //ADDED: room-based oscillation timer
global.countPersistent = 0; //ADDED: persistent oscillation timer

//used if the player fully restarts the room, then presses restart to go back to their pre-full restart saved position.
global.countStored = -1;
global.countSaved = -1;

global.dead = false;
global.deathSlow = 1; //for avoidances

// SHADER ENABLED + HANDLES \\
global.rainbowScrollEnabled = shader_is_compiled(shdRainbowScroll);
global.waterRippleEnabled = shader_is_compiled(shdRipple);
global.waterBorderEnabled = shader_is_compiled(shdInline);
global.hueshiftEnabled = shader_is_compiled(shdHueShift);
global.kaleidoscopeEnabled = shader_is_compiled(shdKaleidoscope);
global.tonemapperEnabled = shader_is_compiled(shdTonemapper);
global.finalBKEnabled = shader_is_compiled(shdFinalBossBK);
global.finalGlowEnabled = shader_is_compiled(shdFinalWhite);
global.logoOutlineShdEnabled = shader_is_compiled(shdLogoOutline);
global.shdNoTranslucentEnabled = shader_is_compiled(shdNoTranslucent);

global.rainbowScrollHandle = shader_get_uniform(shdRainbowScroll, "xoffset");
global.hueshiftHandle = shader_get_uniform(shdHueShift, "u_Position");
global.kaleidoscopeHandle = shader_get_uniform(shdKaleidoscope,"iTime");
global.kaleidoscopeHandle2 = shader_get_uniform(shdKaleidoscope,"iResolution");
global.finalbossHandle = shader_get_uniform(shdFinalBossBK,"iTime");
global.finalbossHandle2 = shader_get_uniform(shdFinalBossBK,"iResolution");
global.finalGlowHandle = shader_get_uniform(shdFinalWhite, "size");
global.logoOutlineShdWidth = shader_get_uniform(shdLogoOutline, "pixelW");
global.logoOutlineShdHeight = shader_get_uniform(shdLogoOutline, "pixelH");
global.logoOutlineShdColor = shader_get_uniform(shdLogoOutline, "outlineCol");

global.gameClear = false;
global.saveGameClear = false;

for (var i = 99; i >= 0; i--)
{
    global.trigger[i] = false;
}

global.gameStarted = false;     //determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //sets whether or not to allow pausing (useful for bosses to prevent desync)
global.autosave = false;        //keeps track of whether or not to autosave the next time the player is created
global.noDeath = false;         //keeps track of whether to give the player god mode
global.infJump = false;         //keeps track of whether to give the player infinite jump

global.gamePaused = false;      //keeps track of whether the game is paused or not
global.pauseSprite = noone;       //stores the screen surface when the game is paused (we use a sprite so it won't be unloaded when the window is minimized)
global.pauseDelay = 0;      //sets pause delay so that the player can't quickly pause buffer

global.currentMusicID = -1;  //keeps track of what song the current music is
global.currentMusic = -1;    //keeps track of current main music instance
global.gameOverMusic = -1;   //keeps track of game over music instance
global.musicFading = -1;     //keeps track of what music is being currently faded out
global.musFadeMultiplier = 1;
global.musicFadeInc = 1/20;
global.musicFadeDec = 1/40;
global.musicFadeEnd = "stop";  //"stop"; "pause"
global.currentGain = 0;     //keeps track of current track gain when a song is being faded out

global.menuSelectPrev[0] = 0;     //keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;     //keeps track of the previously selected option when navigating away from the options menu

//get the default window size
if (surface_exists(application_surface)){
    global.windowWidth = surface_get_width(application_surface);
    global.windowHeight = surface_get_height(application_surface);
}else{
    global.windowWidth = 800;
    global.windowHeight = 608;
}

display_set_gui_size(global.windowWidth, global.windowHeight);  //set the correct gui size for the Draw GUI event

//keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

global.controllerMode = false;  //keeps track of whether to use keyboard or controller
global.controllerDelay = -1;    //handles delay between switching between keyboard/controller so that the player can't use both at the same time

randomize();    //make sure the game starts with a random seed for RNG


//THE MAKER MEDLEY
scrInitDirec();  // store consistent file paths
scrInitTexs();  // Get texture ids

//Reduce amount of memory required for surfaces
if (!variable_global_exists("sharedSurf")){
    global.sharedSurf = -4;
}
if (!variable_global_exists("sharedSurf2")){
    global.sharedSurf2 = -4;
}
if (!variable_global_exists("sharedSurf3")){
    global.sharedSurf3 = -4;
}

// Game progress tracking -- Rooms do not have to be in order
global.stageRooms = (scrGetRoomNum(rTMM_ClearLobby)+1);
for(var i = 0; i < global.stageRooms; i++){
    global.roomProgress[i] = -1;
}
global.farthestRoom = -1;
global.roomSaveTo = -1;
global.saveFarthestRoom = -1;

// Practice Mode
global.practicing = false;
global.practiceBoss = -1;
global.practiceWaypointStart = 0;
global.practiceWaypointEnd = 0;
global.practiceFinalBossVal[9] = 0;
global.practiceFinalBossVal2[9] = 0;  // buffed P4
global.practiceModeBuffed = false;

// Attacks unlocked (stored here as well as in records; highest from either is used)
global.SaveFile_beelzFarthest = -1;
global.SaveFile_chaozFarthest = -1;
global.SaveFile_geezerFarthest = -1;
for (var i=8; i>0; i--;){
    global.SaveFile_undertaleEncountered[i] = 0;
}
global.SaveFile_undertaleEncountered[0] = 1;
global.SaveFile_touhouFarthest = -1;
global.SaveFile_finalBossFarthest = -1;

// Practice Menu Values
global.practSelectBoss = -1;
global.loadGameMenuStart = rOpening;
global.practiceBosses = 6;

global.beelzMax = 5;
global.chaozMax = 8;
global.geezerMax = 5;
global.undertaleMax = 9;
global.touhouMax = 9;
global.finalBossMax = 10;

global.bossMarkers[(global.practiceBosses-1)] = 1;
global.bossMarkers[0] = global.beelzMax;
global.bossMarkers[1] = global.chaozMax;
global.bossMarkers[2] = global.geezerMax;
global.bossMarkers[3] = global.undertaleMax;
global.bossMarkers[4] = global.touhouMax;
global.bossMarkers[5] = global.finalBossMax;
global.finalBossHPMax = 100;
global.finalBossBuffHPMax = 100;
global.finalBossHPPracticeTemp = global.finalBossHPMax;

for(var i=global.undertaleMax-1; i>=0;i--){
    global.undertalePracticingIndex[i] = -1;
}
global.undertalePracticingNum = 0;  // Number of attacks to chain together for each practice "run"

global.finalBossPhases = 6;
global.finalBossBuffPhases = 5;  // no checkpoint before Sudnep
for(var i=0; i<global.finalBossPhases; i++){
    global.finalBossHP[i] = global.finalBossHPMax;
    global.saveFinalBossHP[i] = global.finalBossHP[i];
    global.finalBossBuffHP[i] = global.finalBossBuffHPMax;
    global.saveFinalBossBuffHP[i] = global.finalBossBuffHP[i];
    
    global.finalBossBuffCheckpoint = 0;
}
global.finalStartAtBuffed = false;

// Recorded statistics (not tied to any save file)
scrInitRecord();

// Used to track recorded variables
global.startedBossFromBeginning = false;
global.startedS4FromBeginning = false;
global.challengeMode = false;
global.shieldHitsTaken = 0;

//The Maker Medley Settings
global.coinCount = 0;
global.blueCoinCount = 0;
global.shield = 0;
global.canRestart = true;

// One screen; 85% of save troubles
global.klamyMax = 2;
global.klamySaves = global.klamyMax;  // Number remaining
global.saveKlamySaves = global.klamyMax;
global.klamySaveCurr = 0;  // for current session; not saved to file; not used for saving to file; not used in load game
global.saveKlamySaveCurr = global.klamySaveCurr;  // for "full restart" compatibility

global.S4KlamyMax = 1;
global.S4KlamySaves = 1;  // Number remaining
global.saveS4KlamySaves = 1;
global.S4KlamySaveCurr = 0;  // for current session; not saved to file; not used for saving to file; not used in load game
global.saveS4KlamySaveCurr = global.S4KlamySaveCurr;
for(var i=3;i>=0;i--;){ // [index 3] is for stage 4
    global.klamySaveCoord[i, 0] = -1; //x
    global.saveKlamySaveCoord[i, 0] = -1;
    global.klamySaveCoord[i, 1] = -1; //y
    global.saveKlamySaveCoord[i, 1] = -1;
}

global.abstr4ktGrav = 0;
global.saveAbstr4ktGrav = 0;
global.hitchAutostart = false;
global.hitchTransitionTime = 0;
global.playElevator = false; //animation in the first NANG room (after the transition)
global.flappyStarted = false;
global.scribbleP4LastDeath = -1;

global.totalSRCoins = 3;
for (var i=(global.totalSRCoins-1); i>=0; i--){
    global.SRCoin[i] = 0;
    global.saveSRCoin[i] = 0;
}

global.totalQuadCoins = 4;
for (var i=(global.totalQuadCoins-1); i>=0; i--){
    global.QuadCoin[i] = 0;
    global.saveQuadCoin[i] = 0;
    global.QuadCoinAtStart[i] = 0; //for blue coin saving animation
    global.QuadCoinEverCollected[i] = 0; //for blue coin saving animation
}

// Shared colors
global.titleColorY = make_color_hsv( 31, 192, 247);
global.titleColorA = make_color_hsv(145, 192, 247);
global.titleColorDB = make_color_rgb(44, 62, 115);
global.titleColorR = make_color_rgb(168, 77, 52);
global.titleColorOut = make_color_rgb(125, 237, 218);
