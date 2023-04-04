///scrEaseInOut(input, exponent)
var _input = argument[0];
var _expo = 2.4;
if (_input < 0.5){
    return (power(2, (2.4 - 1)) * power(_input, _expo));
}else{
    return (1 - (power(2 * (1-_input), _expo)/2));
}
