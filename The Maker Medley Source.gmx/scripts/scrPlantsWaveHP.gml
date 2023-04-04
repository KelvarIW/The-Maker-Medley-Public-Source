///scrPlantsWaveHP(wave)
var _wave = argument[0];  // what wave of enemies to check for the hp of;  -1 for all enemies
var _checkAllWaves = (_wave < 0);
var _healthCounter = 0;

with (objPlantsEnemy){
    if (!dead && (_checkAllWaves || wave == _wave)){  // before the final wave, we wait for all enemies to die
        _healthCounter += hp;
        if (instance_exists(shield)){
            _healthCounter += shield.durability;
        }
    }
}
with (objPlantsEnemySpawner){
    if (_checkAllWaves || wave == _wave){  // before the final wave, we wait for all enemies to die
        _healthCounter += enemyHP;  // enemyHP includes shield durability
    }
}

return(_healthCounter);
