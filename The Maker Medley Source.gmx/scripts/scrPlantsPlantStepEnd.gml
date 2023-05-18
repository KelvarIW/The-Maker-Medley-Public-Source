///scrPlantsPlantStepEnd([goreMgmt])
//core operations for the enemy objects
/*
_goreMgmt: destroy when all gore has disappeared
*/

var _goreMgmt;  // set to false to disable default behavior
if (argument_count > 0){
    _goreMgmt = argument[0];
}else{
    _goreMgmt = true;
}

if (_goreMgmt && !frozen){
    if (dead && !crushed){
        deathShadowMult = max(deathShadowMult - 0.15, 0);
    }
    if (dead && !crushed && inheritGore && deathShadowMult <= 0){ //see if we can destroy the plant (we can if there is no gore to draw, unless it was crushed)
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
