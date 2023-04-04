///scrPlantsEnemyAirborne([inst]);
// Determines if an enemy is airborne
var _inst;
if (argument_count > 0){
    _inst = argument[0];
}else{
    _inst = id;
}

with (_inst){
    switch(object_index){
        case objPlantsIWBTGSpike:
           return (true);
        break;
        case objPlantsBoshy:
           return (airborne);
        break;
    }
}
return (false);
