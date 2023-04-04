///scrPlantsEnemyStep([scale])
//core operations for the enemy objects
var _scale;  // set to false to disable default behavior
if (argument_count > 0){
    _scale = argument[0];
}else{
    _scale = true;
}

if (!dead && !frozen){
    if (_scale && image_xscale < scaleTo){
        image_xscale = min(scaleTo, image_xscale+scaleTo/10);
        image_yscale = image_xscale;
    }
    
    if (inheritAttacking && !killing){
        if (!instance_exists(attacking) && instance_exists(objPlantsCtrl)){
            var _column = (x-96) div 64;
            if (_column >= 0 && _column <= 8 && row >= 0 && row <= 5 && objPlantsCtrl.plantGrid[_column, row] != -1 && instance_exists(objPlantsCtrl.plantGrid[_column, row]) && (object_index == objPlantsIWBTGSpike || objPlantsCtrl.plantGrid[_column, row].object_index != objPlantsSpringtrap) && !scrPlantsInvincible((objPlantsCtrl.plantGrid[_column, row]).object_index) && ((x-96) - _column*64) == median(16, ((x-96) - _column*64), 48)){
                hspeed = 0;
                attacking = objPlantsCtrl.plantGrid[_column, row];
                attackingTimer = 0;
            }
        }
        if (instance_exists(attacking) && !attacking.dead){
            event_user(3); //attacking
        }
    }
    
    if (scrPlantsEnemyPushable(id)){
        if (pushAmt > 0){
            hspeed = 0;
            attacking = noone;
            x += pushAmt;
            if (bbox_right < 728){
                pushAmt *= 0.9;
            }else{
                pushAmt *= 0.7;
            }
            if (pushAmt <= 0.8){
                pushAmt = 0;
            }
        }
    }
}else{
    scrPlantsCrushStep();
}
