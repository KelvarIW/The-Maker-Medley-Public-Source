///draw_text_outline(x,y,str,outwidth,outcol,outfidelity)
// Created by Andrew McCluskey http://nalgames.com/

// x, y: Coordinates to draw at
// str: String to draw
// outwidth: Width of outline in pixels
// outcol: Colour of outline (main text draws with regular set colour)
// outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

var dto_dcol=draw_get_color();

draw_set_color(argument[4]);
var _inc = 360/argument[5];

for(var dto_i=45; dto_i<405; dto_i+=_inc)
{
    draw_text((argument[0]+lengthdir_x(argument[3],dto_i)),(argument[1]+lengthdir_y(argument[3],dto_i)),argument[2]);
}

draw_set_color(dto_dcol);

draw_text(argument[0],argument[1],argument[2]);
