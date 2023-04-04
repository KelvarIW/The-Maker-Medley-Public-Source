///scrPlantsDetectable([inst]);
//Determines if a plant can be purposely interacted with by enemies
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
            return (false);
         break;
    }
}
return (true);
