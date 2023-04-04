///scrTMMDrawTitle(surfX, surfY, surfXScale, surfYScale, [surfID])
var surfID;
if (argument_count > 4){
    _surfID = argument[4];
}else{
    _surfID = global.sharedSurf2;  // default
}

if (surface_exists(_surfID)){
    var _surfX = argument[0];
    var _surfY = argument[1];
    var _surfXScale = argument[2];
    var _surfYScale = argument[3];
    //center surface on coordinates
    _surfX -= (surface_get_width(_surfID)/2) * _surfXScale;
    _surfY -= (surface_get_height(_surfID)/2) * _surfYScale;
    
    var _usingSurf = (global.logoOutlineShdEnabled);
    if (_usingSurf){
        var _outThick = 6;
        shader_set(shdLogoOutline);
        shader_set_uniform_f(global.logoOutlineShdWidth, _outThick/800);
        shader_set_uniform_f(global.logoOutlineShdHeight, _outThick/608);
        shader_set_uniform_f(global.logoOutlineShdColor, TITLE_OUTLINE_COLOR);
    }
    
    draw_surface_ext(_surfID, _surfX, _surfY, _surfXScale, _surfYScale, 0, c_white, 1);
    
    if (_usingSurf){
        shader_reset();
    }
}
