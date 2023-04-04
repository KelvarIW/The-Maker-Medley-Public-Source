///scrPlantsEnemyPushable([inst]);
//Determines if an enemy can be moved by other objects (i.e. TMM Spring)
var _inst;
if (argument_count > 0){
    _inst = argument[0];
}else{
    _inst = id;
}

if (scrPlantsEnemyAirborne(_inst)){
    return (false);
}
return (true);
