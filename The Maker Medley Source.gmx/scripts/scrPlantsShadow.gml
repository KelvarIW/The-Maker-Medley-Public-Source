///scrPlantsShadow(inst_width, inst_height, [scale])
// Converts an instance's dimensions to a shadow x/yscale

var _shadowXScale = argument[0]/72;
var _shadowYScale = argument[1]/48;

if (argument_count > 2){
    _shadowXScale *= argument[2];
    _shadowYScale *= argument[2];
}

tempArray[0] = _shadowXScale;
tempArray[1] = _shadowYScale;
return tempArray;
