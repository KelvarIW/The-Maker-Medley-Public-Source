///scrPlantsEnemyStepEnd([destroyAutomatically], [updateShieldX])
//core operations for the enemy objects
var _destroyAutomatically;  // set to false to disable default behavior

//_destroyAutomatically: destroy when all gore has disappeared
if (argument_count > 0){
    _destroyAutomatically = argument[0];
}else{
    _destroyAutomatically = true;
}

if (!frozen){
    if (dead && !crushed && _destroyAutomatically && (inheritGore || goreAmt < 1)){ //see if we can destroy the enemy (we can if there is no gore/shield to draw)
        if (!instance_exists(shield)){
            var _die;
            _die = true;
            for(var i=0;i<goreAmt;i++){
                if (instance_exists(gore[i])){
                    _die = false;
                }
            }
            if (_die){
                instance_destroy();
            }
        }
    }
    
    if (!dead && instance_exists(shield) && !shield.fallen){
        shield.x = floor(x) + shieldXOff;
        if (killing){
            shield.y = floor(y) + shieldYOff;
        }
    }
    
    scrPlantsEnemyKillAnim();
    
    if (glowFrame > 0){
        glowFrame --;
    }
}
