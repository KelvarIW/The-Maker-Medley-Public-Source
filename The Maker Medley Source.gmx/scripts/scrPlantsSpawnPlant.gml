///scrPlantsSpawnPlant(column, row, object);
var _col = argument[0];
var _row = argument[1];
var _obj = argument[2];
var _inst = instance_create((96 + 32) + _col*64, (160 + 32) + _row*64, _obj);

_inst.animMult = 0.95  +  ((1.08 - 0.95)*((floor(visual_psuedoRNGVal) div 10) mod 6));
_inst.column = _col;
_inst.row = _row;

// place in the plant grid
if (scrPlantsStationary(_obj)){
    plantGrid[_col, _row] = _inst;
}

if (_obj == objPlantsActivator){
    activatorPrev = (activatorsPlaced) mod 8;
    _inst.image_index = activatorPrev;
    activatorsPlaced ++;
    activatorTransition = 1;
    var _activatorIndex = 5;
    iconSubimg[_activatorIndex] = (activatorsPlaced) mod 8;
}

return(_inst);
