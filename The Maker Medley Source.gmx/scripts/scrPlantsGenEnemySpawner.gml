///scrPlantsGenEnemySpawner(enemy_id, [row], [delay])
// Generate an enemy spawner
// should only be run from Ctrl objects
var _enemy_id = argument[0];
if (_enemy_id >= 0 && _enemy_id < enemyTotal){
    var _spawnerinst = instance_create(768, 0, objPlantsEnemySpawner);
    _spawnerinst.wave = currentWave;
    _spawnerinst.enemy = enemySpawnObject[_enemy_id];
    _spawnerinst.subtype = enemySpawnSubtype[_enemy_id];
    _spawnerinst.points = enemySpawnCost[_enemy_id];
    _spawnerinst.enemyHP = enemySpawnHealth[_enemy_id];
    
    if (argument_count > 1){
        _spawnerinst.row = argument[1];
    }else{
        var _row;
        tempArray = 0;  // local variables can't store arrays or something I'm not exactly sure 
        
        //find number of valid rows
        var _options = 0;
        for (var i = (rows-1); i >= 0; i--){
            for (var j=( min(spawnPositionsTracked, rows-1)  - 1); j >= 0; j--){
                if (spawnRowArray[j] == i){
                    break;
                }
                if (j == 0){  // loop will finish without breaking
                    _options ++;
                    tempArray[(_options-1)] = i;
                }
            }
        }
        
        //get row
        psuedoRNGVal = scrPlantsPsuedoRNG(psuedoRNGVal, 9.79);
        var _row = tempArray[(floor(psuedoRNGVal) mod _options)];
        _spawnerinst.row = _row;
        
        // update spawn row array
        for (var i=(spawnPositionsTracked-1); i >= 1; i--){
            spawnRowArray[i] = spawnRowArray[(i-1)];  // row enemy will spawn on
        }
        spawnRowArray[0] = _row;
    }
    if (argument_count > 2){
        _spawnerinst.delay = argument[2];
    }else{
        psuedoRNGVal = scrPlantsPsuedoRNG(psuedoRNGVal, 9.79);
        _spawnerinst.delay = max((spawnMaxDelay * ((floor(psuedoRNGVal) div 10) mod 6)/6) - waveTimer, 0);
    }
    
    psuedoRNGVal = scrPlantsPsuedoRNG(psuedoRNGVal, 9.41);
    _spawnerinst.spawnedEnemyAnimMult = (0.85  +  ((1.23 - 0.85)*((floor(psuedoRNGVal) div 10) mod 6)));  // ranges from 0.85 to 1.23
    
    currentWaveHealthInit += _spawnerinst.enemyHP;
    currentWaveHealth += _spawnerinst.enemyHP;
    return (_spawnerinst);
}else{
    show_debug_message("ERROR! Adding enemy to wave " + string(currentWave) + "; provided index (" + string(_enemy_id) + ") is outside the bounds of the enemy array.");
    if (_enemy_id >= enemyTotal){
        show_debug_message("Ensure you are passing the index for the enemy arrays, *Not* the enemy object's object_index");
    }
    
    return (-4);
}
