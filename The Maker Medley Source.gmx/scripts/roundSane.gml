///roundSane(input)
var _input = argument[0];
if (_input mod 1 < 0.5){
    return (floor(_input));
}else{
    return (ceil(_input));
}
