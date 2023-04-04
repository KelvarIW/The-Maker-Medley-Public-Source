/// scrSaveGame(savePosition)
///saves the game
///argument0 - sets whether the game should save the player's current location or just save the deaths/time

var savePosition = argument0;

var _player = objPlayer;
if (room == rFinalBoss_3){
    _player = objFinalP3Player;
}

//save the player's current location variables if the script is currently set to (we don't want to save the player's location if we're just updating death/time)
if (savePosition && instance_exists(_player))
{   
    global.saveRoom = room_get_name(room);
    global.savePlayerX = _player.x;    
    global.savePlayerY = _player.y;
    global.savePlayerScale = _player.image_xscale; //we'll assume the player's xscale is the same as their yscale
    global.savePlayerPower = global.playerPower;
    global.savePlayerXScale = _player.xScale; //the direction the player is facing in
    global.savePlayerJumps = global.playerJumps;
    global.saveGrav = global.grav;
    
    //check if player is saving inside of a wall or in the ceiling when the player's position is floored to prevent save locking
    with (_player)
    {
        if (!place_free(floor(global.savePlayerX),global.savePlayerY))
        {
            global.savePlayerX += 1;
        }
        
        if (!place_free(global.savePlayerX,floor(global.savePlayerY)))
        {
            global.savePlayerY += 1;
        }
        
        if (!place_free(floor(global.savePlayerX),floor(global.savePlayerY)))
        {
            global.savePlayerX += 1;
            global.savePlayerY += 1;
        }
    }
    
    //floor player position to match standard engine behavior
    global.savePlayerX = floor(global.savePlayerX);
    global.savePlayerY = floor(global.savePlayerY);
    
    //The Maker Medley Settings
    global.saveKlamySaves = global.klamySaves;
    global.saveS4KlamySaves = global.S4KlamySaves;
    global.saveKlamySaveCurr = global.klamySaveCurr;  // for "full restart" compatibility
    global.saveS4KlamySaveCurr = global.S4KlamySaveCurr;  // for "full restart" compatibility
    
    for(var i=0;i<=3;i++){
        global.saveKlamySaveCoord[i, 0] = global.klamySaveCoord[i, 0];
        global.saveKlamySaveCoord[i, 1] = global.klamySaveCoord[i, 1];
    }
    for (var i=0; i<global.totalSRCoins; i++){
        global.saveSRCoin[i] = global.SRCoin[i];
    }
    for(var i=0; i<global.totalQuadCoins; i++){
        global.saveQuadCoin[i] = global.QuadCoin[i];
    }
    global.saveAbstr4ktGrav = global.abstr4ktGrav;
    for (var i = 0; i<global.finalBossPhases; i++){
        global.saveFinalBossHP[i] = global.finalBossHP[i];
        global.saveFinalBossBuffHP[i] = global.finalBossBuffHP[i];
    }
    global.saveGameClear = global.gameClear;
    
    global.countStored = -1;
}
global.farthestRoom = max(global.farthestRoom, scrGetRoomNum(room));

//create a map for save data
var saveMap = ds_map_create();

ds_map_add(saveMap,"version", global.gameVersion);
ds_map_add(saveMap,"death",global.death);
ds_map_add(saveMap,"time",global.time);
ds_map_add(saveMap,"timeMicro",global.timeMicro);

/*  //Unused data from Engine code
ds_map_add(saveMap,"difficulty",global.difficulty);
ds_map_add(saveMap,"saveRoom",global.saveRoom);
ds_map_add(saveMap,"savePlayerX",global.savePlayerX);
ds_map_add(saveMap,"savePlayerY",global.savePlayerY);
ds_map_add(saveMap,"savePlayerXScale",global.savePlayerXScale);
ds_map_add(saveMap,"saveGrav",global.saveGrav);

for (var i = 0; i < global.secretItemTotal; i++)
{
    ds_map_add(saveMap,"saveSecretItem["+string(i)+"]",global.saveSecretItem[i]);
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    ds_map_add(saveMap,"saveBossItem["+string(i)+"]",global.saveBossItem[i]);
}
*/

//Game Progress
for (var i = 0; i < global.stageRooms; i++)
{
    ds_map_add(saveMap, "roomProgress["+string(i)+"]", global.roomProgress[i]);
}
ds_map_add(saveMap, "farthestRoom", global.farthestRoom);

// Unlocked Attacks
ds_map_add(saveMap, "beelzFarthest", global.beelzFarthest);
ds_map_add(saveMap, "chaozFarthest", global.chaozFarthest);
ds_map_add(saveMap, "geezerFarthest", global.geezerFarthest);
for(var i=0; i<global.undertaleMax; i++){
    ds_map_add(saveMap, "undertaleEncountered[" + string(i) + "]", global.undertaleEncountered[i]);
}
ds_map_add(saveMap, "touhouFarthest", global.touhouFarthest);
ds_map_add(saveMap, "finalBossFarthest", global.finalBossFarthest);


//Misc. Variables
ds_map_add(saveMap, "KlamySaves", global.saveKlamySaves);
ds_map_add(saveMap, "S4KlamySaves", global.saveS4KlamySaves);
for(var i=0; i<=3; i++){
    ds_map_add(saveMap, "KlamySaveX[" + string(i) + "]", global.saveKlamySaveCoord[i, 0]);
    ds_map_add(saveMap, "KlamySaveY[" + string(i) + "]", global.saveKlamySaveCoord[i, 1]);
}
for(var i=0; i<global.totalSRCoins; i++){
    ds_map_add(saveMap, "SRCoin[" + string(i) + "]", global.saveSRCoin[i]);
}
for(var i=0; i<global.totalQuadCoins; i++){
    ds_map_add(saveMap, "QuadCoin[" + string(i) + "]", global.saveQuadCoin[i]);
    ds_map_add(saveMap, "QuadCoinEverCollected[" + string(i) + "]", global.QuadCoinEverCollected[i]);
}

for(var i=0; i<global.finalBossPhases; i++){
    ds_map_add(saveMap, "finalBossHP[" + string(i) + "]", global.saveFinalBossHP[i]);
    ds_map_add(saveMap, "finalBossBuffHP[" + string(i) + "]", global.saveFinalBossBuffHP[i]);
}

ds_map_add(saveMap, "finalBossBuffCheckpoint", global.finalBossBuffCheckpoint);

ds_map_add(saveMap,"saveGameClear",global.saveGameClear);

//save the map to a file
if (global.extraSaveProtection) //use ds_map_secure function
{
    ds_map_secure_save(saveMap, global.saveWorkingPath + string(global.savenum));
}
else    //use text file
{
    //open the save file
    var f = file_text_open_write(global.saveWorkingPath + string(global.savenum));
    
    //write map to the save file with base64 encoding
    file_text_write_string(f,base64_encode(ds_map_write(saveMap)));
    
    file_text_close(f);
}
//destroy the map
ds_map_destroy(saveMap);

//change the temp file to savedata
scrWorkingDirToSave();

scrSaveRecord();
