///scrDrawTimer(x, y, frames, [align], [show_minutes], [second_digit_minimum])
// scale?
if (global.screenshotMode){exit;}
var _textX = roundSane(argument[0]);
var _textY = roundSane(argument[1]);
var _frames = floor(argument[2]);
var _align = fa_center;
var _showMin = false;
var _secondDigits = 1;

if (argument_count > 3){
    _align = argument[3];
}
if (argument_count > 4){
    _showMin = argument[4];
}
if (argument_count > 5){
    _secondDigits = max(argument[5], 1);
}

// Convert frames to a string
var _timeStr = scrFramesToTimer(_frames, 50, _showMin, _secondDigits);

// Draw timer string
var _sepWidth = 2;
var _numWidth = (string_width("0")) + _sepWidth;
var _punctWidth = (string_width(":")) + _sepWidth;
var _halfNumWidth = _numWidth/2;
var _halfPunctWidth = _punctWidth/2;

var _strLen = string_length(_timeStr);
var _numInString = string_length(string_digits(_timeStr));
var _strWidth = (_numWidth * (_numInString-1))  +  (_punctWidth * (_strLen - _numInString))  - _sepWidth;

if (_align == fa_left){
    // nothing
}else if (_align == fa_right){
    _textX -= (_strWidth);
}else{
    _textX -= _strWidth/2;
}
_textX = roundSane(_textX - _halfNumWidth);

//show_debug_message( "starting text at x=" + string(_textX) + ";  ending at x=" + string(_textX + _strWidth) );

draw_set_halign(fa_center);
var _char = "";
var _xoff = 0;

for (var i=1; i<=_strLen; i++){
    _char = string_char_at(_timeStr, i);
    if (_char == ":" || _char == "."){
        draw_text((_textX + _xoff)  + _halfPunctWidth, _textY, string_char_at(_timeStr, i));
        _xoff += _punctWidth;
    }else{
        draw_text((_textX + _xoff)  + _halfNumWidth, _textY, string_char_at(_timeStr, i));
        _xoff += _numWidth;
    }
}
