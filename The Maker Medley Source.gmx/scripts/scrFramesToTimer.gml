///scrFramesToTimer(frames, [FPS], [show_minutes], [second_digit_minimum]);
// Convert frames to a timer stringx
var _fps = 50;
var _showMinutes = false;
var _secondDigits = 1;

var _frames = argument[0];
if (argument_count > 1){
    _fps = argument[1];
}
if (argument_count > 2){
    _showMinutes = argument[2];
}
if (argument_count > 3){
    _secondDigits = argument[3];
}

var _minutes = 0;
var _framesPerMinute = (60*_fps);
var _seconds = (_frames div _fps);
if (_showMinutes){
    _minutes = (_frames div _framesPerMinute);  // if _showMinutes is false, we will show the time in total seconds
    _seconds -= 60*_minutes;
    _secondDigits = 2;
}
var _secondsStr = string(_seconds);
if (string_length(_secondsStr) < _secondDigits){  // prepend single-digit second values with a "0"
    repeat(_secondDigits-1){_secondsStr = "0" + _secondsStr;}
}
var _centiseconds = ((_frames  -  (_framesPerMinute*_minutes + _fps*_seconds)) * 2);  // 1 frame = 20 ms = 2 centiseconds  (we trunicate the final millisecond digit since it is always 0)
var _centisecondsStr = string(_centiseconds);
if (string_length(_centisecondsStr) == 1){  // prepend single-digit second values with a "0"
    _centisecondsStr = "0" + _centisecondsStr;
}
var _totalStr = _secondsStr + "." + _centisecondsStr;
if (_showMinutes){
    _totalStr = string(_minutes) + ":" + _totalStr;
}

return (_totalStr);
