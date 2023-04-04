///scrTitleDrawTiles(level, tile, x, y)
var t_level = argument[0];
var t_tile = argument[1];
var t_xPos = argument[2];
var t_yPos = argument[3];
if (t_level == 1 && t_yPos >= 304)
    t_level = 3;

switch (t_level){
    case 1: //Abstr4kt
    case 7: //Chaoz
    case 9: //Erik
        //Mega Man
        switch(t_tile){
            case 1:
            case 7:
                draw_sprite(sprMakerMegaBlocks, 1, t_xPos, t_yPos);
                break;
            case 3:
            case 5:
                draw_sprite(sprMakerMegaBlocks, 2, t_xPos, t_yPos);
                break;
            case 4:
                draw_sprite(sprMakerMegaBlocks, 3, t_xPos, t_yPos);
                break;
            default:
                draw_sprite(sprMakerMegaBlocks, 0, t_xPos, t_yPos);
                break;
        }
        break;
    case 0: //Tutorial
    case 2: //Dice
        if (t_tile <= 8)
            draw_background_part(tlGrass, 32*(t_tile mod 3), 96+32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else{
            switch(t_tile){
                case 10:
                    draw_background_part(tlGrass, 64, 192, 32, 32, t_xPos, t_yPos);
                    break;
                case 11:
                    draw_background_part(tlGrass, 224, 160, 32, 32, t_xPos, t_yPos);
                    break;
                case 12:
                    draw_background_part(tlGrass, 256, 192, 32, 32, t_xPos, t_yPos);
                    break;
                case 13:
                    draw_background_part(tlGrass, 32, 192, 32, 32, t_xPos, t_yPos);
                    break;
            }
        }
        break;
    case 3: //Kurath
    case 5: //128-Up
        if (t_tile <= 8)
            draw_background_part(tlDirt, 32*(t_tile mod 3), 32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else{
            draw_background_part(tlDirt, 32*(abs(13 - t_tile)), 96, 32, 32, t_xPos, t_yPos);
        }
        break;
    case 4: //Zilily
        if (t_tile <= 8)
            draw_background_part(tlS1Zilily, 160 + 32*(t_tile mod 3), 32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else{
            draw_background_part(tlS1Zilily, 352-32*((t_tile-10) mod 2), 32 - 32*((t_tile-10) div 2), 32, 32, t_xPos, t_yPos);
        }
        break;
    case 6: //Patrick
        if (t_tile <= 8)
            draw_background_part(tlS1Pat, 32*(t_tile mod 3), 32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else{
            draw_background_part(tlS1Pat, 32*(abs(13 - t_tile)), 96, 32, 32, t_xPos, t_yPos);
        }
        break;
    case 8: //Shark 1/2
    case 8.1: //Stage 2 Abstr4kt hueshift shader failsafe (pt 1)
        switch(t_tile){
            case 1:
            case 7:
                draw_background_part(tlS2SharkBlocks, 32, 0, 32, 32, t_xPos, t_yPos);
                break;
            case 3:
            case 5:
                draw_background_part(tlS2SharkBlocks, 0, 32, 32, 32, t_xPos, t_yPos);
                break;
            case 4:
                if (t_level == 8){
                    draw_background_part(tlS2SharkBlocks, 96, 0, 32, 32, t_xPos, t_yPos);
                }else{
                    draw_background_part(tlS2SharkBlocks, 64, 32, 32, 32, t_xPos, t_yPos);
                }
                break;
            default:
                draw_background_part(tlS2SharkBlocks, 0, 0, 32, 32, t_xPos, t_yPos);
                break;
        }
        break;
    case 10: //Klamy
        switch(t_tile){
            case 0:
            case 2:
            case 6:
            case 8:
                draw_background_part(tlS2Klamy, 32 + 32*((t_tile mod 6) div 2), 32 + 32*(t_tile div 6), 32, 32, t_xPos, t_yPos);
                break;
            case 1:
                draw_background_part(tlS2Klamy, 32, 160, 32, 32, t_xPos, t_yPos);
                break;
            case 3:
                draw_background_part(tlS2Klamy, 0, 32, 32, 32, t_xPos, t_yPos);
                break;
            case 4:
                draw_background_part(tlS2Klamy, 256, 64, 32, 32, t_xPos, t_yPos);
                break;
            case 5:
                draw_background_part(tlS2Klamy, 160, 32, 32, 32, t_xPos, t_yPos);
                break;
            case 7:
                draw_background_part(tlS2Klamy, 32, 0, 32, 32, t_xPos, t_yPos);
                break;
            case 10:
            case 11:
            case 12:
            case 13:
                draw_background_part(tlS2Klamy, 64 - 32*(t_tile mod 2), 128 - 32*((t_tile-10) div 2), 32, 32, t_xPos, t_yPos);
                break;
        }
        break;
    case 11: //Stage 2 Abstr4kt
        switch(t_tile){
            case 1:
            case 7:
                draw_background_part(tlS2Abstr4kt, 32, 0, 32, 32, t_xPos, t_yPos);
                break;
            case 3:
            case 5:
                draw_background_part(tlS2Abstr4kt, 0, 32, 32, 32, t_xPos, t_yPos);
                break;
            case 4:
                draw_background_part(tlS2Abstr4kt, 32, 32, 32, 32, t_xPos, t_yPos);
                break;
            default:
                draw_background_part(tlS2Abstr4kt, 0, 0, 32, 32, t_xPos, t_yPos);
                break;
        }
        break;
    case 11.1: //Stage 2 Abstr4kt hueshift shader failsafe (pt 2)
        switch(t_tile){
            case 1:
            case 7:
                draw_background_part_ext(tlS2SharkBlocks, 32, 0, 32, 32, t_xPos, t_yPos, 1, 1, image_blend, 0.3);
                break;
            case 3:
            case 5:
                draw_background_part_ext(tlS2SharkBlocks, 0, 32, 32, 32, t_xPos, t_yPos, 1, 1, image_blend, 0.3);
                break;
            case 4:
                draw_background_part_ext(tlS2SharkBlocks, 64, 32, 32, 32, t_xPos, t_yPos, 1, 1, image_blend, 0.3);
                break;
            default:
                draw_background_part_ext(tlS2SharkBlocks, 0, 0, 32, 32, t_xPos, t_yPos, 1, 1, image_blend, 0.3);
                break;
        }
        break;
    case 12: //Vovka
        if (t_tile <= 8){
            draw_background_part(tlS2Vovka, 32 * (t_tile mod 3), 32 * (t_tile div 3), 32, 32, t_xPos, t_yPos);
        }else{
            draw_background_part(tlS2Vovka, 64 * ((t_tile - 10) mod 2), 64 * ((t_tile - 10) div 2), 32, 32, t_xPos, t_yPos);
        }
        break;
    case 13: //Telejump
        draw_set_color(c_white);
        draw_rectangle(t_xPos+0.5, t_yPos+0.5, t_xPos+32-0.5, t_yPos+32-0.5, false);
        break;
    case 14: //Geezer
        if (t_tile != 4){
            draw_sprite_ext(sprGeezerBlock, 0, t_xPos, t_yPos, 1, 1, 0, c_white, geezerAlpha[t_xPos div 32, t_yPos div 32 - 7*(t_yPos div 304)]);
        }
        break;
    case 15: //Hitchcock
        if (t_tile <= 8)
            draw_background_part(tlTitleHitchcock, 32*(t_tile mod 3), 32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else
            draw_background_part(tlTitleHitchcock, 32*(abs(13 - t_tile)), 96, 32, 32, t_xPos, t_yPos);
        break;
    case 16: //UNUSED - Stage Rush
        if (t_tile <= 8)
            draw_background_part(tlS3Hub, 32*(t_tile mod 3), 32*(t_tile div 3), 32, 32, t_xPos, t_yPos);
        else{
            draw_background_part(tlS3Hub, 32*(abs(13 - t_tile)), 96, 32, 32, t_xPos, t_yPos);
        }
        break;
    case 17: //Final Boss
        var _cornerIndex = (global.count*6/50) mod 6;
        var _beamIndex = abs(2 - ((global.count*6/50) + 2) mod 4);
        switch(t_tile){
            case 1:
            case 7:
                draw_sprite(sprFinalTiles,  9 + _beamIndex, t_xPos + 16, t_yPos + 16);
                break;
            case 3:
            case 5:
                draw_sprite(sprFinalTiles, 18 + _beamIndex, t_xPos + 16, t_yPos + 16);
                break;
            case 4:
                draw_sprite(sprFinalTiles, 24             , t_xPos + 16, t_yPos + 16);
                break;
            default:
                draw_sprite(sprFinalTiles,    _cornerIndex, t_xPos + 16, t_yPos + 16);
                break;
        }
        break;
}
