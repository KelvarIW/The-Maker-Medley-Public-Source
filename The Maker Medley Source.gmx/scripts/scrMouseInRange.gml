///scrMouseInRange(x1, y1, x2, y2, relativeToView)
var _x1, _y1, _x2, _y2, _relative;
_x1 = argument[0];
_y1 = argument[1];
_x2 = argument[2];
_y2 = argument[3];
_relative = argument[4];

if (_relative){
    _x1 += view_xview;
    _x2 += view_xview;
    _y1 += view_yview;
    _y2 += view_yview;
}

return (mouse_x >= _x1 && mouse_x < _x2 && mouse_y >= _y1 && mouse_y < _y2);
