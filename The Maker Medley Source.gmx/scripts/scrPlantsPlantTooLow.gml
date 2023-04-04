///scrPlantsPlantTooLow(inst)
// Determines if a plant is too low to be killed by "high" hazards
// Ex:  Shurikens; Flying IWBTG Spikes
var _inst;
if (argument_count > 0){
    _inst = argument[0];
}else{
    _inst = id;
}

with (_inst){
    switch(object_index){
        case objPlantsCoinBlock:
            /*// debug
            growing = true;
            growingTimer = 12;
            */
            
            if (growing && growingTimer < 12){
                return (true);
            }
        break;
        case objPlantsCannon:
            /*// debug
            growing = true;
            growingTimer = 44;
            */
            if (growing && growingTimer < 44){
                return (true);
            }
        break;
        case objPlantsSpike:
            /*// debug
            growing = true;
            growingTimer = 16;
            */
            if (growing && growingTimer < 16){
                return (true);
            }
        break;
        case objPlantsSpringtrap:
            /*// debug
            growing = true;
            growingTimer = 17;
            */
            if (growing && growingTimer < 17){
                return (true);
            }
        break;
        case objPlantsActivator:
            return (true);
        break;
    }
}
return (false);
