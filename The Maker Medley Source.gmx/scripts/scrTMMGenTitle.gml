///scrTMMGenTitle(type, timer, textX1, textY1, textAng1, textStr1, textX2, textY2, textAng2, textStr2, ...);
// Call this before scrTMMDrawTitle

var _type = argument[0];  // 0 = base text; 1 = actual title; 2 = knockoff rush; 3 = th^nk you for pl^ying
var _timer = argument[1];
var _textArgCount = 4;  // x, y, ang, str
//var _surfaceOpacityShader = global.shdNoTranslucentEnabled;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (_type == 2){
    draw_set_font(fStageClear);
}else{
    draw_set_font(fTitleBlue);
}

if (!surface_exists(global.sharedSurf)){
    global.sharedSurf = surface_create(800, 608);
}
if (!surface_exists(global.sharedSurf2)){
    global.sharedSurf2 = surface_create(800, 608);
}

var _yellowTextCount = 1;  // final `_yellowTextCount` strings drawn will be yellow
if (_type == 3){
    _yellowTextCount = 2;
}

if (surface_exists(global.sharedSurf) && surface_exists(global.sharedSurf2)){
    surface_set_target(global.sharedSurf);
    draw_clear_alpha(c_black, 0);
    
    //Draw initial text
    var _textNum = (argument_count - 2) div _textArgCount;
    var _textX = 0, _textY = 0, _textAng = 0, _textStr = "";
    var _yellowThreshold = 2 + (_textArgCount*(_textNum-_yellowTextCount));
    draw_set_font(fTitleBlue);
    draw_set_color(global.titleColorA);
    //if (_surfaceOpacityShader){texture_set_interpolation(true);}
    for (var i = 2; i < (2 + (_textArgCount*_textNum)); i += _textArgCount){
        _textX = argument[i];
        _textY = argument[i+1];
        _textAng = argument[i+2];
        _textStr = argument[i+3];
        
        if (i < _yellowThreshold || _type == 3){
            _textX += 22 * (dcos(_timer + 140*i) + 1)/2;
            _textY += 10 * (-dsin(_timer + 140*i) + 1)/2;
        }
        if (i == _yellowThreshold){  // switch to yellow text
            if (_type == 1){
                draw_set_font(fTitleMaker);
            }
            draw_set_color(global.titleColorY);
        }
        draw_text_transformed(_textX, _textY, _textStr, 1, 1, _textAng);
    }
    
    // Extra text attributes
    var _charW = string_width("M");
    var _charH = string_height("M");
    var _baseInd, _textXOff = 0, _textYOff = 0, _textAng = 0;
    if (_type == 1){  // Title spike
        _baseInd = 2 + (_textArgCount * (_textNum-_yellowTextCount));  // M^KER
        _textAng = argument[_baseInd+2];
        draw_sprite_ext(sprMakerTitleSpike, 0, argument[_baseInd] + lengthdir_x((_charW*0.72), 180 + _textAng), argument[_baseInd+1] + lengthdir_y((_charH*0.72), 180 + _textAng), 1.5, 1.5, _textAng, c_white, 1);
    }else if (_type == 3){  // End of Credits
        // TH^NK
        _baseInd = 2 + (_textArgCount * (_textNum-_yellowTextCount));
        _textX = 22 * (dcos(_timer + 140*_baseInd) + 1)/2;
        _textY = 10 * (-dsin(_timer + 140*_baseInd) + 1)/2;
        _textAng = argument[_baseInd+2];
        draw_sprite_ext(sprMakerTitleSpike, 0, argument[_baseInd]  + _textX, argument[_baseInd+1]  + _textY, 1.125, 1.125, _textAng, c_white, 1);
        
        // PL^YING
        _baseInd += _textArgCount;
        _textX = 22 * (dcos(_timer + 140*_baseInd) + 1)/2;
        _textY = 10 * (-dsin(_timer + 140*_baseInd) + 1)/2;
        _textAng = argument[_baseInd+2];
        draw_sprite_ext(sprMakerTitleSpike, 0, argument[_baseInd] + lengthdir_x((_charW*0.75), 180 + _textAng)  + _textX, argument[_baseInd+1] + lengthdir_y((_charH*0.75), 180 + _textAng)  + _textY, 1.25, 1.25, _textAng, c_white, 1);
    }
    //texture_set_interpolation(false);
    
    draw_set_color(c_white);
    surface_reset_target();
    
    if (surface_exists(global.sharedSurf2)){
        surface_set_target(global.sharedSurf2);
        draw_clear_alpha(c_black, 0);
        
        // Step 1:  Add backing to text
        var _scale = 1.05;
        var _blend = c_white;
        var _usingShader = (global.hueshiftEnabled);
        
        if (_usingShader){
            shader_set(shdHueShift);
            shader_set_uniform_f(global.hueshiftHandle, 12 * (2*pi/255));
            _blend = make_color_rgb(230, 230, 230);
        }else{
            _blend = make_color_rgb(230, 230, 230);
        }
        
        // Draw back text
        if (surface_exists(global.sharedSurf)){
            draw_surface_ext(global.sharedSurf, -390*(_scale-1), -304*(_scale-1), _scale, _scale, 0, _blend, 1);
        }
        if (_usingShader){
            shader_reset();
        }
        
        // Add main text and copy to sharedSurf   ~~with alpha fix~~
        if (surface_exists(global.sharedSurf) && surface_exists(global.sharedSurf2)){
            draw_surface(global.sharedSurf, 0, 0);
            
            /*if (_surfaceOpacityShader){
                surface_set_target(global.sharedSurf);
                draw_clear_alpha(c_black, 0);
                
                if (surface_exists(global.sharedSurf2)){
                    shader_set(shdNoTranslucent);
                    draw_surface(global.sharedSurf2, 0, 0);
                    shader_reset();
                }
                
                surface_reset_target();
            }else{*/
                surface_copy(global.sharedSurf, 0, 0, global.sharedSurf2);
            //}
        }
        draw_clear_alpha(c_black, 0);
        
        // Step 2:  Draw sharedSurf with outline
        
        // Text outline red<->blue color
        var _period = 720;
        var _yInput = ((4.5*_timer) mod _period);
        
        draw_set_colour_write_enable(true, true, true, false);
        draw_rectangle_color(0, _yInput + 720, 800, _yInput + 358, global.titleColorDB, global.titleColorDB, global.titleColorR, global.titleColorR, false);
        draw_rectangle_color(0, _yInput + 360, 800, _yInput - 2, global.titleColorR, global.titleColorR, global.titleColorDB, global.titleColorDB, false);
        draw_rectangle_color(0, _yInput, 800, _yInput - 360, global.titleColorDB, global.titleColorDB, global.titleColorR, global.titleColorR, false);
        draw_rectangle_color(0, _yInput - 358, 800, _yInput - 720, global.titleColorR, global.titleColorR, global.titleColorDB, global.titleColorDB, false);
        
        // Text outline mask
        draw_set_colour_write_enable(false, false, false, true);
        if (surface_exists(global.sharedSurf)){
            var _outThick = 28;
            if (global.logoOutlineShdEnabled){
                shader_set(shdLogoOutline);
                shader_set_uniform_f(global.logoOutlineShdWidth, _outThick/800);
                shader_set_uniform_f(global.logoOutlineShdHeight, _outThick/608);
                shader_set_uniform_f(global.logoOutlineShdColor, 1, 1, 1);
                
                draw_surface(global.sharedSurf, 0, 0);
                shader_reset();
            }else{
                var _prec = 48, _angInc = 360/_prec;
                for(var i=0.5; i<(_prec+0.5); i++){
                    draw_surface(global.sharedSurf, lengthdir_x(_outThick, _angInc*i),  lengthdir_y(_outThick, _angInc*i));
                }
            }
        }
        
        if (_type == 1){
            //fill in holes
            
            // between "THE" and "MAKER"
            var _textInd = 2;
            var _centX = argument[_textInd];
            var _centY = argument[_textInd+1] + _charH/2 * 0.8;
            draw_ellipse(_centX - 80, _centY - 40, _centX + 144, _centY + 32, false);
            
            // between "MAKER" and "MEDLEY"
            _textInd += _textArgCount;
            _centX = argument[_textInd];
            _centY = argument[_textInd+1] - _charH/2 * 0.8;
            draw_ellipse(_centX - 184, _centY - 24, _centX + 156, _centY + 56, false);
        }else if (_type == 2){
            //fill in holes
            
            // between "WELCOME" and "KNOCKOFF"  (also covers  'C' in "KNOCKOFF" )
            var _textInd = 2;
            var _centX = argument[_textInd] + _charW;
            var _centY = argument[_textInd+1]  + _charH/2;
            var _hRad = string_width("WELCOME")/2 + _charW;
            draw_ellipse(_centX - _hRad, _centY - 112, _centX + _hRad, _centY + 48, false);
            
            // between "KNOCKOFF" and "RUSH"
            _textInd += _textArgCount;
            _centX = argument[_textInd];
            _centY = argument[_textInd+1];
            _hRad = string_width("RUSH")/2;
            draw_ellipse(_centX - _hRad, _centY - 64, _centX + _hRad, _centY + 24, false);
            /*
            // between "TO" and "KNOCKOFF"
            _textInd += _textArgCount;
            _centX = argument[_textInd] - _charW;
            _centY = argument[_textInd+1] + _charH/2;
            _hRad = 32;
            draw_ellipse(_centX - _hRad, _centY - 54, _centX + _hRad, _centY + 54, false);
            
            // 'C' in "KNOCKOFF"
            _textInd += _textArgCount;
            _centX = argument[_textInd];
            _centY = argument[_textInd+1];
            _hRad = 56;
            draw_ellipse(_centX - _hRad, _centY - 28, _centX + _hRad, _centY + 28, false);
            */
        }
        
        draw_set_colour_write_enable(true, true, true, true);
        
        if (surface_exists(global.sharedSurf)){draw_surface(global.sharedSurf, 0, 0);}
        surface_reset_target();
    }
    
}
