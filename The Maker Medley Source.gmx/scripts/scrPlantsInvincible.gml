///scrPlantsInvincible([inst]);
//Determines if a plant can be shot or eaten
var _inst;
if (argument_count > 0){
    _inst = argument[0];
}else{
    _inst = id;
}

with (_inst){
    switch(object_index){
        case objPlantsShuriken:
        case objPlantsActivator:
            return (true);
        break;
    }
}
return (false);
