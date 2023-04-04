///scrPlantsPsuedoRNG(val, mult)
// Change the Psuedo RNG value
// only for objPlantsCtrl
var _input = argument[0];
var _mult = argument[1];  // what to multiply psuedoRNGVal by
_input *= _mult;
while (_input >= 180){
    _input -= 180;
}

// correct the value if it gets too small
if (_input < 8){
    _input = max(_input, 1.1) * 13.5;
}
return (_input);
