///scrPlantsSpawnWave(points);
// Enemies should be represented by the index in your Ctrl object's enemy arrays  (ex: Use ENEMY_CHERRY, *Not* objPlantsCherry)
// Using a negative value for the spawn probability weight will fetch the enemySpawnWeight[] entry for that object

var _spikeAllowance = 2;
if (currentWave == 20){
    _spikeAllowance = 1;  // inspired by Zilyno's attempt  :(
}
var _points = argument[0];
//Spawn enemy spawners
if (spawnChoices > 0 && _points > 0){  // failsafe
    var _waveEnemyHealth = 0;  //used to calculate initial wave health
    var _enemyTotal = 0;
    var _weightSum = 0;
    //show_debug_message("wave " + string(currentWave) +  ": spawnChoices = " + string(spawnChoices));
    
    //get spawn weight totals
    if (spawnChoices <= 1){
        _weightSum = spawnArray[0+1];
    }else{
        for(var i=0; i<(2*spawnChoices); i+=2;){
            _weightSum += spawnArray[(i+1)];
            //show_debug_message("wave " + string(currentWave) +  ";  _weightSum:  " + string(_weightSum));
        }
    }
    
    //set random enemy spawn delays
    var _unweighted = 0;
    var _enemyIndex = 0;  // in choice array
    
    while (_points > 0){
        if (spawnChoices > 1){
            psuedoRNGVal = scrPlantsPsuedoRNG(psuedoRNGVal, 8.79);
            _unweighted = (((floor(psuedoRNGVal) mod 60)/60) * _weightSum);
            //show_debug_message("psuedoRNGVal:  " + string(psuedoRNGVal));
            //show_debug_message("_weightSum:  " + string(_weightSum));
            //show_debug_message("_unweighted:  " + string(_unweighted));
            
            for (var i=0; i<spawnChoices; i++;){
                _unweighted -= spawnArray[((2*i) + 1)];
                //show_debug_message("i = " +string(i)+ "; _unweighted = " +string(_unweighted));
                if (_unweighted < 0.01){
                    _enemyIndex = i;
                    break;
                }
            }
        }else{
            _enemyIndex = 0;
        }
        
        /*  // TMM making me miss GMS2, as usual  :P
        if (enemySpawnCost[_enemy_id] > _points){
            array_delete(spawnArray, _enemyIndex);
            spawnChoices --;
            if (spawnChoices < 1){  // failsafe;  default cherries have a spawn cost of "1" and should always be a possible spawn
                show_debug_message("Failsafe: Wave " + string(currentWave) + " ran out of spawn options with " + string(_points) + "spawn points remaining!");
                break;
            }else{
                //recalculate weight sum
                if (spawnChoices <= 1){
                    _weightSum = enemySpawnWeight[spawnArray[0]];
                }else{
                    for (var i=0; i<spawnChoices; i++){
                        _weightSum += enemySpawnWeight[spawnArray[i]];
                    }
                }
                continue;
            }
        }
        */
        //show_debug_message("_enemyIndex:  " + string(_enemyIndex));
        var _enemy_id = spawnArray[(2*_enemyIndex)];
        
        // check if we can spawn this enemy
        if (enemySpawnCost[_enemy_id] > _points || (_enemy_id == ENEMY_SPIKE && _spikeAllowance <= 0)){  // spawn is not valid
            //copy spawn option list to second (temporary) array
            spawnArray2[0] = 0;
            array_copy(spawnArray2, 0, spawnArray, 0, (2*spawnChoices));
            var _choicesPrev = spawnChoices;
            
            // clear original spawn option list
            spawnArray = 0;
            spawnChoices = 0;
            
            //generate new spawn option list
            for (var i=0; i<(2*_choicesPrev); i+=2;){
                if (enemySpawnCost[spawnArray2[i]] <= _points && !(spawnArray2[i] == ENEMY_SPIKE && _spikeAllowance <= 0)){
                    spawnArray[(2*spawnChoices)] = spawnArray2[i];
                    spawnArray[(2*spawnChoices) + 1] = spawnArray2[i+1];
                    spawnChoices ++;
                }
            }
            
            // recalculate spawn "weight" sum
            _weightSum = 0;
            for(var i=0; i<(2*spawnChoices); i+=2;){
                _weightSum += spawnArray[(i+1)];
            }
            show_debug_message("wave " + string(currentWave) +  ": _enemyIndex = " + string(_enemyIndex) +  "; spawnChoices = " + string(spawnChoices));
            
            if (spawnChoices < 1){  // failsafe;  default cherries have a spawn cost of "1" and should always be a possible spawn
                show_debug_message("Failsafe: Wave " + string(currentWave) + " ran out of spawn options with " + string(_points) + " spawn points remaining!");
                break;
            }else{
                continue;
            }
        }else{
            //Generate spawner for the chosen enemy
            var _spawnerinst = scrPlantsGenEnemySpawner(_enemy_id);
            if (_enemy_id == ENEMY_SPIKE){
                _spikeAllowance --;
            }
            _points -= enemySpawnCost[_enemy_id];
            _enemyTotal ++;
        }
    }
    
    currentWaveHealth = currentWaveHealthInit;
    currentWavePointSpawned = 0;
}
