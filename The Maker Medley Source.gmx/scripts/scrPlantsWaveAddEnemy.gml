///scrPlantsWaveAddEnemy(enemyIndex, [probabilityWeight]);
// Add an enemy to the wave's spawn pool
// should only be run from Ctrl objects
// Enemies should be represented by the index in your Ctrl object's enemy arrays  (ex: Use ENEMY_CHERRY, *Not* objPlantsCherry)
// Ommitting the spawn probability weight will fetch the enemySpawnWeight[] entry for that enemy index
var _enemy_id = argument[0];
if (_enemy_id >= 0 && _enemy_id < enemyTotal){
    var _prob;
    if (argument_count > 1){
        _prob = argument[1];
        if (_prob <= 0){
            show_debug_message("Warning!: Wave " + string(currentWave) + " enemy " + string(spawnChoices + 1) + " sets a weight <= 0. Was this intentional?");
            exit;
        }
    }else{
        _prob = enemySpawnWeight[_enemy_id];
        if (_prob <= 0){
            show_debug_message("Warning!: Wave " + string(currentWave) + " enemy " + string(spawnChoices + 1) + " attempts to use default probability weight, but that is <= 0.");
            exit;
        }
    }
    
    spawnArray[(spawnChoices*2)] = _enemy_id;
    spawnArray[((spawnChoices*2)+1)] = _prob;
    spawnChoices ++;
}else{
    show_debug_message("ERROR! Adding enemy " + string(spawnChoices + 1) + " to wave " + string(currentWave) + "; provided index (" + string(_enemy_id) + ") is outside the bounds of the enemy array.");
    if (_enemy_id >= enemyTotal){
        show_debug_message("Ensure you are passing the index for the enemy arrays, *Not* the enemy object's object_index");
    }
}
