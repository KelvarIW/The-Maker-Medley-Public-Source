///scrCreditsDrawBKColumn(back, left, width)
var _tileset = argument[0];
var _startX  = argument[1];
var _width = argument[2];
var _endX  =  (_startX + _width);

if (_width >= 1){
    switch(_tileset){
        case 2: //Dice
            scrDrawTiledArea(bkMakerSky, -((((-global.count - _startX) mod 500) + 500) mod 500), 64, _startX, 64, _endX, 544);
            break;
        case 4: //zilily
            draw_set_color(zililyCol);
            draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
            draw_set_color(c_white);
            
            var _scale = 2;
            var _yoff = 64;
            var _top = _yoff/_scale;
            draw_sprite_part_ext(sprS1ZililyBK, global.count/2, _startX/_scale, _top, _width/_scale, (304-_top), _startX, _yoff, _scale, _scale, c_white, 1);
        break;
        case 6: //Patrick
            if (global.hueshiftEnabled){
                shader_set(shdHueShift);
                shader_set_uniform_f(global.hueshiftHandle, 1.745);
                scrDrawTiledArea(bkS2Abstr4ktNew, -((((-0.425*global.count - _startX) mod 256) + 256) mod 256), 64, _startX, 64, _endX, 544);
                shader_reset();
            }else{
                draw_set_color(c_white);
                draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
                scrDrawTiledAreaExt(bkS2Abstr4ktShaderFailsafe, -((((-0.425*global.count - _startX) mod 256) + 256) mod 256), 64, _startX, 64, _endX, 544, 1, 1, patrickFailsafeCol, 1);
            }
            if (global.hueshiftEnabled){shader_reset();}
        break;
        case  5:  // 128-Up
        case  7:  // Chaoz Airflow
        case  8:  // Shark 1/2
        case 10:  // Klamy Spiky Situation
        case 12:  // Vovka
        case 16:  // Knockoff Rush
            var _tex = -1;
            if (_tileset == 5){
                _tex = global._128BackTex;
            }else if (_tileset == 7){
                _tex = global.chaozBackTex;
            }else if (_tileset == 8){
                _tex = global.sharkBackTex;
            }else if (_tileset == 10){
                _tex = global.klamyBackTex;
            }else if (_tileset == 12){
                _tex = global.vovkaBackTex;
            }else{
                _tex = global.knockoffBackTex;
            }
            var _xOff = (_startX mod 64);
            scrDrawTexturedArea(_tex, _xOff, 0, _startX, 64, _endX, 544);
        break;
        case 11: //Abstr4kt 2
            if (global.hueshiftEnabled){
                shader_set(shdHueShift);
                shader_set_uniform_f(global.hueshiftHandle, 2*pi * global.count/400);
                scrDrawTiledArea(bkS2Abstr4ktNew,               -((((-0.425*global.count - _startX) mod 256) + 256) mod 256), 64, _startX, 64, _endX, 544);
                shader_reset();
            }else{
                draw_set_color(c_white);
                draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
                scrDrawTiledAreaExt(bkS2Abstr4ktShaderFailsafe, -((((-0.425*global.count - _startX) mod 256) + 256) mod 256), 64, _startX, 64, _endX, 544, 1, 1, make_color_hsv(255 * (1 - (global.count mod 400)/400), 255, 255), 1);
            }
        break;
        /*
        case 13: //UNUSED - Telejump
        case 14: //UNUSED - Geezer
            draw_set_color(c_black);
            draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
            draw_set_color(c_white);
        break;
        */
        case 15: //Hitchcock
            draw_set_color(hitchcockCol);
            draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
            draw_set_color(c_white);
        break;
        /*  //The Final Boss background should not be drawn during the column-switching part of the credits
        case 17: //Final Boss
            if (global.finalBKEnabled){
                shader_set(shdFinalBossBK);
                shader_set_uniform_f(global.finalbossHandle, global.countPersistent * 0.0025);
                shader_set_uniform_f(global.finalbossHandle2, 800, 608);
                texture_set_repeat(true);
                draw_rectangle(_startX  -0.5, 64, _endX  -0.5, 544, false);
                texture_set_repeat(false);
                shader_reset();
            }else{
                scrDrawTiledArea(bkFinalScribbleFailsafe, -((floor(0.25*global.countPersistent) - (11 / max(view_wview/800, 0.01))) mod 512), ((floor(0.875*global.countPersistent) - (12 / max(view_hview/608, 0.01))) mod 512), view_xview, view_yview, view_xview + view_wview, view_yview + view_hview);
            }
        break;
        */
    }
}
