///scrCreditsText(height, type, index, subindex)
var _yPos = (argument[0] + 544);
var _type = argument[1];
var _ind = argument[2];    //usually stage
var _subind = argument[3];
/*var _xoff = 0, _yoff = 0;
if (argument_count > 4){
    _xoff = argument[4];
    if (argument_count > 5){
        _yoff = argument[5];
    }
}*/
var _yRelative = (_yPos - creditsScrollHeight);

if (_yRelative > 552){
    stopDrawing = true; // The functions are called from top to bottom. If one part is below the screen, the rest of the parts must be too.
}else{
    if (!startDrawing){ // Likewise, if one part is low enough to be drawn on-screen, the lower parts must be visible as well. (There are some edge cases due to the second part of the conditional, but they will only affect performance.)
        startDrawing = (_yRelative > -112 || (_type == "title" && _yRelative > -256) || (_type == "Elephant Crew" && _yRelative > -256));
    }
    if (_type == "title"){
        if (startDrawing){
            var _width, _height;
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(c_white);
            
            //main title
            draw_set_font(fFlappyCounter);
            _width = string_width(title[_ind, 0]);
            _height = string_height(title[_ind, 0]);
            //draw_sprite_ext(sprCreditsUnderline, 0, 400 - _width/2, ((_yPos-60) - creditsScrollHeight)  +  _height, _width/8, 1, 0, c_white, 1);
            draw_text_outline(400, _yRelative - 40, title[_ind, 0], 4, c_black, 12);
            
            //subtitle
            draw_set_font(fCreditsSubtitle);
            _width = string_width(title[_ind, 1]);
            _height = string_height(title[_ind, 1]);
            //draw_sprite_ext(sprCreditsUnderline, 0, 400 - _width/2, ((_yPos + 30) - creditsScrollHeight)  +  _height, _width/8, 1, 0, c_white, 1);
            draw_text_outline(400, (_yPos + 32) - creditsScrollHeight, title[_ind, 1], 2, c_black, 12);
            
            if (_ind != 5){  // Stage 4
                draw_set_halign(fa_left);
                draw_set_font(fCreditsFeaturing);
                draw_text_outline(112, (_yPos + 100) - creditsScrollHeight, "featuring...", 2, c_black, 12);
            }else{
                draw_set_halign(fa_left);
            }
        }
        // vertical spacing
        if (_ind != 5){
            relativeSpacing += 148;
        }else{
            relativeSpacing += 108;
        }
        
        draw_set_font(fDefault18);
    }else if (_type == "level" || _type == "boss"){
        if (startDrawing){
            draw_set_font(fDefault18);
            draw_set_halign(fa_left);
            if (levels[_ind, _subind] == "Avoidance-ヒッチコック"){  //special case because of the Japanese symbols
                var _strWidth = string_width("Avoidance-");
                draw_text_outline(244, _yRelative + 21, "Avoidance-", 2, c_black, 12);
                draw_set_font(fIdentifierJPCH);
                draw_text_outline(244 + _strWidth, _yRelative + 21, "ヒッチコック", 2, c_black, 12);
                draw_set_font(fDefault18);
            }else{
                draw_text_outline(244, _yRelative + 21, levels[_ind, _subind], 2, c_black, 12);
            }
            draw_text_outline(420, _yRelative + 53, "by:  " + makers[_ind, _subind], 2, c_black, 12);
            
            draw_set_color(listColCircle);
            draw_circle(672, _yRelative + 58, 25, false);
            draw_set_color(listColClick);
            draw_circle(672, _yRelative + 58, 25, true);
            draw_sprite(sprTitleMakers, makerIcon[_ind, _subind], 672, (_yPos + 58) - creditsScrollHeight);
            
            if (_type == "level"){
                draw_sprite(sprTitleStageIcon, icons[_ind, _subind], 104, _yRelative);
            }else if (_type == "boss"){
                draw_sprite(sprPracticeAttacks, icons[_ind, _subind], 104, _yRelative);
            }
            draw_set_color(c_black);
            draw_rectangle(104  -0.5, _yRelative  -0.5, 104+128  -0.5, (_yRelative + 96)  -0.5, true);
            draw_set_color(c_white);
        }
        relativeSpacing += 104;
    }else if (_type == "labeled spread"){
    /*
        if (startDrawing){
            draw_set_halign(fa_left);
            draw_text_outline(224, _yRelative, levels[_ind, _subind], 2, c_black, 12);
            draw_text_outline(400, (_yPos + 32) - creditsScrollHeight, "by:  " + makers[_ind, _subind], 2, c_black, 12);
            
            draw_sprite(sprTitleStageIcon, icons[_ind, _subind], 80, _yRelative);
            draw_set_color(c_black);
            draw_rectangle(80  -0.5, _yRelative + 1  -0.5, 80+128  -0.5, _yRelative+96 + 1  -0.5, true);
            draw_set_color(listColCircle);
            draw_circle(660, (_yPos + 80) - creditsScrollHeight, 25, false);
            draw_set_color(listColClick);
            draw_circle(660, (_yPos + 80) - creditsScrollHeight, 25, true);
            draw_set_color(c_white);
            draw_sprite(sprTitleMakers, icons[_ind, _subind], 660, (_yPos + 80) - creditsScrollHeight);
        }
        relativeSpacing += 104;
    */
    }else if (_type == "image spread"){
        if (startDrawing){
            draw_set_color(c_black);
            for (var i=0; i<floor(levelNum[_ind]); i++;){
                draw_sprite(sprTitleStageIcon, icons[_ind, i], 400  +  (i - (levelNum[_ind]-1)/2) * 160 - 64, _yRelative);
                draw_rectangle(400  +  (i - (levelNum[_ind]-1)/2) * 160 - 64  -0.5, _yRelative + 1  -0.5, 400  +  (i - (levelNum[_ind]-1)/2) * 160 + 64  -0.5, (_yRelative  + 96) + 1  -0.5, true);
            }
            draw_set_color(c_white);
        }
        relativeSpacing += 92;
    }else if (_type == "Elephant Crew"){
        draw_set_font(fDefault18);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        
        // set relativeSpacing to 64 pixels below text y offset from `_yRelative`
        switch (_subind){
            case 1:
                if (startDrawing){
                    var _spacing = 212;
                    draw_sprite(sprFinalLarryShell, 16/50 * global.count, 400-_spacing, _yRelative + 56);  // no scribble frames
                    draw_sprite(sprFinalKnightDieFlipped, (floor(global.count * 0.2) mod 4), 400  + 3, _yRelative + 52);
                    draw_sprite(sprFinalKirbyRollFlipped, 2 + 7*(floor(global.count * 0.2) mod 4), 400+_spacing, _yRelative + 58);
                    for (var i=0; i<=2; i++;){
                        draw_text_outline(400 + _spacing*(i-1), _yRelative + 96, levels[6, i], 2, c_black, 12);
                    }
                }
                relativeSpacing += 160;
            break;
            case 2:
                if (startDrawing){
                    var _spacing = 172;
                    var _scale;
                    _scale = 0.67;
                    draw_sprite_ext(sprFinalKadyCacao, (floor(global.count * 0.2) mod 4), 400 - _spacing, _yRelative + 96, _scale, _scale, 0, c_white, 1);
                    draw_text_outline(400 - _spacing, _yRelative + 198, levels[6, 3], 2, c_black, 12);
                    _scale = 1.33;
                    draw_sprite_ext(sprFinalKurathChaserDisintegrate, 1 + 8*(floor(global.count * 0.2) mod 4), (400 + _spacing) + 51, _yRelative - 80, _scale, _scale, 0, c_white, 1);
                    draw_text_outline(400 + _spacing, _yRelative + 198, levels[6, 4], 2, c_black, 12);
                }
                relativeSpacing += 262;
            break;
            case 3:
                if (startDrawing){
                    var _spacing = 200;
                    var _scale;
                    _scale = 0.75;
                    draw_sprite_ext(sprFinalPatToaster, (global.count * 0.2), (400 - _spacing), _yRelative + 114*_scale, _scale, _scale, 0, c_white, 1);
                    draw_text_outline((400 - _spacing), _yRelative + 184, levels[6, 5], 2, c_black, 12);
                    _scale = 0.75;
                    draw_sprite_part_ext(sprFinalYoyoMiku, (floor(global.count * 0.2) mod 4), 20, 0, 250, 232, (400 + _spacing) - _scale*250/2, _yRelative, _scale, _scale, c_white, 1);
                    draw_text_outline((400 + _spacing), _yRelative + 184, levels[6, 6], 2, c_black, 12);
                }
                relativeSpacing += 254;
            break;
            case 4:
                if (startDrawing){
                    var _spacing = 192;
                    var _scale;
                    _scale = 0.88;
                    draw_sprite_ext(sprFinalDribixWaveColored, (global.count * 0.2), 400 - _spacing, _yRelative + 78*_scale + 5, _scale, _scale, 0, c_white, 1);
                    draw_sprite(sprFinalTralexBartenderColored, (global.count * 0.2), 400, _yRelative + 48);
                    _scale = 0.5;
                    draw_sprite_part_ext(sprFinalSudnepMiku, (global.count * 0.2), 25, 0, 216, 218, (400 + _spacing) - _scale*216/2, _yRelative, 0.5, 0.5, c_white, 1);
                    for (var i=7; i<=9; i++;){
                        draw_text_outline(400 + _spacing*(i-8), _yRelative + 125, levels[6, i], 2, c_black, 12);
                    }
                }
                relativeSpacing += 184;
            break;
            case 5:
                if (startDrawing){
                    var _spacing = 188;
                    var _xDist = 56;  // from "center"
                    var _yDist = 28;  // from "middle"
                    var _xLoopLen = 4*_xDist, _yLoopLen = 4*_yDist;
                    var _xLoopHalf = 2*_xDist, _yLoopHalf = 2*_yDist;
                    for (var i=0; i<sprite_get_number(sprFinalP4ScribbleFragments); i++;){
                        draw_sprite_ext(sprFinalP4ScribbleFragments, i, 400 + (abs(((33.94*i) mod _xLoopLen) - _xLoopHalf) - _xDist), _yRelative + 64 + (abs(((28.79*i) mod _yLoopLen) - _yLoopHalf) - _yDist), 1, 1, 127*i, c_ltgray, 1);
                    }
                    draw_set_font(fDefault12);
                    draw_text_outline(400, _yRelative + 128, "(formerly)", 2, c_black, 12);
                    draw_set_font(fDefault18);
                    draw_text_outline(400, _yRelative + 128 + 18, "Mr. Scribble", 2, c_black, 12);
                }
                relativeSpacing += 304;
            break;
        }
    }else if (_type == "header"){
        if (startDrawing){
            var _width, _height;
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(c_white);
            
            //main title
            draw_set_font(fFlappyCounter);
            _width = string_width(title[_ind, 0]);
            _height = string_height(title[_ind, 0]);
            //draw_sprite_ext(sprCreditsUnderline, 0, 400 - _width/2, ((_yPos-60) - creditsScrollHeight)  +  _height, _width/8, 1, 0, c_white, 1);
            draw_text_outline(400, _yRelative, title[_ind, 0], 4, c_black, 12);
        }
        relativeSpacing += 108;
    }else if (_type == "testers"){
        if (startDrawing){
            var _width, _height;
            draw_set_halign(fa_center);
            draw_set_valign(fa_top);
            draw_set_color(c_white);
            
            //main title
            draw_set_font(fCreditsFeaturing);
            var _pad = 208, _num = 4;
            var _domain = (800-2*_pad), _spacing = _domain/(_num-1);
            
            for (var _count=0; _count<_num; _count++){
                draw_text_outline(_pad + (_count*_spacing), _yRelative + 48*(_count mod 2), makers[_ind, (_subind + _count)], 4, c_black, 12);
            }
        }
        relativeSpacing += 108;
    }else if (_type == "thanks list"){
        draw_set_font(fDefault18);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        
        if (startDrawing){
            draw_set_halign(fa_left);
            draw_text_outline(136, _yRelative, makers[_ind, _subind] + "  -  ", 4, c_black, 12);
            
            draw_set_halign(fa_center);
            
            draw_set_font(fDefault12);
            draw_set_halign(fa_right);
            draw_text_outline(692, _yRelative, levels[_ind, _subind], 4, c_black, 12);
        }
        
        relativeSpacing += 80;
    }
}
