///scrCopyAspects(dest, [source])
var _from, _to;
_to = argument[0];
if (argument_count > 1){
    _from = argument[1];
}else{
    _from = id;
}

_to.sprite_index = _from.sprite_index;
_to.image_index = _from.image_index;
_to.image_xscale = _from.image_xscale;
_to.image_yscale = _from.image_yscale;
_to.image_angle = _from.image_angle;
_to.image_blend = _from.image_blend;
_to.image_alpha = _from.image_alpha;
_to.depth = _from.depth;
_to.image_speed = _from.image_speed;
