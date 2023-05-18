///scrPlantsEnShouldAttack()
if (instance_exists(objPlantsCtrl)){
    var _column = (x-96) div 64;
    if (_column >= 0 && _column < objPlantsCtrl.columns && row >= 0 && row < objPlantsCtrl.rows){  // Check: in field constraints
        var _xx = 96 + (_column*64);
        if (x == median(_xx + 16, x, _xx + 52)){  // Check: "blocked" by plant
            var _inst = (objPlantsCtrl.plantGrid[_column, row]);  // get id in array position
            if (_inst >= 0 && instance_exists(_inst)){  // Check: _inst is valid id
                if ((_inst.object_index != objPlantsSpringtrap || object_index == objPlantsIWBTGSpike) && !scrPlantsInvincible(_inst.object_index)){  // Check: plant is valid target
                    return (true);
                }
            }
        }
    }
}
return (false);
