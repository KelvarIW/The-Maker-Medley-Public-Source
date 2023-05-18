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
        if (!instance_exists(attacking) && scrPlantsEnShouldAttack()){
            var _column = (x-96) div 64;
            hspeed = 0;
            attacking = objPlantsCtrl.plantGrid[_column, row];
            attackingTimer = attackingTimerLen;
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
