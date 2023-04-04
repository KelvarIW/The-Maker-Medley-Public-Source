///scrCreditsDrawTileColumn(tileset, column, [offset], [scale])
var _tileset = argument[0];
var _columnOrig  =  argument[1];
var _xoff = 0, _scale = 1;
if (argument_count > 2){
    _xoff = argument[2];
}
if (argument_count > 3){
    _scale = argument[3];
}

if (_columnOrig < 0 || _columnOrig > (columnNum-1)){exit;}
var _column = _columnOrig;
var _numColumns = 4;  // rightmost 3 always shown  +  leftmost 1 for transition
var _drawWidth = 3*32;
var _scaleCrop = _drawWidth * (1-_scale);  // width not drawn during appearance animation
var _xpos = _drawWidth,   _xposInit = _xpos;  // _xposInit is for S2 Abstr4kt failsafe

// special cases
var _sharkIndex = 8;  // shark has 2 layers of the beam tiles
var _abstr4kt2Index = 11;
var _resetShader = false;

// S2 Abtr4kt failsafe
var _abstr4ktFailsafe = false;
var _abstr4kt2FailsafeCol = c_white;
var _abstr4ktFailsafeLoopNum = 0;
var _runTimes = 1;
var _spikeAlpha = 1;

// also draws the column immediately to the left for the smooth movement
var _usingSurf = false;
//var _shouldUseSurf = true;  //global.extraEffects;
//if (_shouldUseSurf){
if (!surface_exists(global.sharedSurf)){
    global.sharedSurf = surface_create(800, 608);
}
if (surface_exists(global.sharedSurf)){
    surface_set_target(global.sharedSurf);
    draw_clear_alpha(c_black, 0);
/*  _usingSurf = true;
    }
}
if (!_usingSurf){
    _xpos = _columnOrig*32;  // doesn't match with background columns
}
*/
    // Stage 2 Abstr4kt hue shift or failsafe
    if (_tileset == _abstr4kt2Index){
        if (global.hueshiftEnabled){
            shader_set(shdHueShift);
            shader_set_uniform_f(global.hueshiftHandle, global.count*pi/200);
            _resetShader = true;
        }else{
            _abstr4ktFailsafe = true;
            _abstr4kt2FailsafeCol = make_color_hsv(255 * (1 - (global.count mod 400)/400), 225, 225);
            _tileset = 8.1;
            _runTimes = 2;
        }
    }
    
    // this method requires we check the farthest right column first, and then move one left
    // we will draw the target column, decrease that value by one, and then draw the target column again
    // we stop after the second target column is drawn
    repeat(_runTimes){
        do {
            while (_column >= 25){
                _column --;
                _xpos -= 32;
            }
            if (_column == 24){
                if (_tileset != _sharkIndex){
                    for (var j=0; j<19; j++){
                        scrTitleDrawTiles(_tileset, 4, _xpos, 32*j);
                    }
                }else{
                    scrTitleDrawTiles(_tileset, 11, _xpos, 0);
                    for (var j=1; j<18; j++){
                        scrTitleDrawTiles(_tileset, 3, _xpos, 32*j);
                    }
                    scrTitleDrawTiles(_tileset, 13, _xpos, 576);
                }
                
                _column --;
                _xpos -= 32;
            }
            
            if (_column == 23){
                scrTitleDrawTiles(_tileset, 11, _xpos, 32);
                for (var j=2; j<17; j++){
                    scrTitleDrawTiles(_tileset, 3, _xpos, 32*j);
                }
                scrTitleDrawTiles(_tileset, 13, _xpos, 544);
                
                // top and bottom-most rows
                if (_tileset != _sharkIndex){
                    scrTitleDrawTiles(_tileset, 4, _xpos, 0);
                    scrTitleDrawTiles(_tileset, 4, _xpos, 576);
                }else{
                    scrTitleDrawTiles(_tileset, 7, _xpos, 0);
                    scrTitleDrawTiles(_tileset, 1, _xpos, 576);
                }
                
                _column --;
                _xpos -= 32;
            }
            
            repeat(_numColumns){  // check this range repeatedly (there can be multiple rows drawn, and more than one might both be within this range)
                if (_column >= 2 && _column <= 22){
                    scrTitleDrawTiles(_tileset, 7, _xpos, 32);
                    scrTitleDrawTiles(_tileset, 1, _xpos, 544);
                    if (_tileset != _sharkIndex){
                        scrTitleDrawTiles(_tileset, 4, _xpos, 0);
                        scrTitleDrawTiles(_tileset, 4, _xpos, 576);
                    }else{
                        scrTitleDrawTiles(_tileset, 7, _xpos, 0);
                        scrTitleDrawTiles(_tileset, 1, _xpos, 576);
                    }
                    
                    // spikes
                    var _spikeInd = scrCreditsStageSpikeIndex(_tileset);
                    var _spikeBlend = c_white;
                    
                    // S2 Abstr4kt behavior
                    
                    // Draw spikes
                    var _spikeYscale = 1;
                    if (_column == 2 || _column == 22){  // L/R horizontal
                        if (_column == 22){_spikeYscale = -1;}
                        for (var j=3; j<16; j++){
                            draw_sprite_ext(sprMakerSpike, _spikeInd, _xpos + 16, 32*j + 16, 1, _spikeYscale, 270, image_blend, _spikeAlpha);
                        }
                    }else{  // T/B vertical
                        draw_sprite_ext(sprMakerSpike, _spikeInd, _xpos + 16, 32*2 + 16, 1, -1, 0, image_blend, _spikeAlpha);
                        draw_sprite_ext(sprMakerSpike, _spikeInd, _xpos + 16, 32*16 + 16, 1, 1, 0, image_blend, _spikeAlpha);
                    }
                    
                    _column --;
                    _xpos -= 32;
                }
            }
            
            if (_column == 1){
                scrTitleDrawTiles(_tileset, 10, _xpos, 32);
                for (var j=2; j<17; j++){
                    scrTitleDrawTiles(_tileset, 5, _xpos, 32*j);
                }
                scrTitleDrawTiles(_tileset, 12, _xpos, 544);
                
                // top and bottom-most rows
                if (_tileset != _sharkIndex){
                    scrTitleDrawTiles(_tileset, 4, _xpos, 0);
                    scrTitleDrawTiles(_tileset, 4, _xpos, 576);
                }else{
                    scrTitleDrawTiles(_tileset, 7, _xpos, 0);
                    scrTitleDrawTiles(_tileset, 1, _xpos, 576);
                }
                
                _column --;
                _xpos -= 32;
            }
            
            if (_column == 0){
                if (_tileset != _sharkIndex){
                    for (var j=0; j<19; j++){
                        scrTitleDrawTiles(_tileset, 4, _xpos, 32*j);
                    }
                }else{
                    scrTitleDrawTiles(_tileset, 10, _xpos, 0);
                    for (var j=1; j<18; j++){
                        scrTitleDrawTiles(_tileset, 5, _xpos, 32*j);
                    }
                    scrTitleDrawTiles(_tileset, 12, _xpos, 576);
                }
                
                _column --;_xpos -= 32;break;
            }
        }until (_column <= (_columnOrig - _numColumns) || _column < 0);
        
        if (_runTimes > 1 && _abstr4ktFailsafeLoopNum == 0){
            image_blend = _abstr4kt2FailsafeCol;
            draw_set_colour_write_enable(1, 1, 1, 0);
            _spikeAlpha = 0.3;
            _tileset = 11.1;
            
            _column = _columnOrig;
            //if (_usingSurf){
                _xpos = _xposInit;
            /*}else{
                _xpos = _columnOrig*32;
            }*/
            _abstr4ktFailsafeLoopNum ++;
        }
    }
    
    //S2 Abstr4kt clean-up
    if (_resetShader){
        shader_reset();
        _resetShader = false;
    }
    draw_set_colour_write_enable(1, 1, 1, 1);
    image_blend = c_white;
    
    //draw to tileSurf
    //if (_usingSurf){
    surface_reset_target();
    if (surface_exists(global.sharedSurf)){
        draw_surface_part(global.sharedSurf, (32 + columnOffset) + _scaleCrop/2, 0, _drawWidth*_scale, 608, (32*_columnOrig - (_drawWidth - 32) + _scaleCrop/2) + columnOffset, 0);
    }
    //}
}
