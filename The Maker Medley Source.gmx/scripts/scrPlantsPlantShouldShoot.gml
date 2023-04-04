///scrPlantsPlantShouldShoot()
// returns true if there is a target to shoot at
with (objPlantsEnemy){  // check for enemies in row
    if ((!dead && x >= (other.x-18)) && (object_index != objPlantsIWBTGSpike || other.object_index == objPlantsSpike) && row == other.row){  // objPlantsSpike projectiles can hit flying spikes
        return (true);
        break;
    }
}

if (object_index != objPlantsSpike){  // objPlantsSpike projectiles need a set target
    with (objPlantsMikuSpinner){   // check for slotted fruit (accounting for the slot range)
        if (holding && ((row == other.row && (x + slotDistance) >= other.x) || (abs(row - other.row) <= 1 && (x + (slotDistance*sin(pi/4))) >= other.x))){
            return (true);
        }
    }
}

return (false);
