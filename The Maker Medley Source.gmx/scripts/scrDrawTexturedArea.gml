///scrDrawTexturedArea(texture, xOrigin, yOrigin, x1, y1, x2, y2)
// Draw a textured tiled to fill a rectangular area
// origin is given in regards to the image's dimensions
if (abs(argument[5] - argument[3]) < 1 || abs(argument[6] - argument[4]) < 1){exit;}
var _tex, _texWidth, _texHeight, xo, yo, x1,y1,x2,y2;
_tex = argument[0];
_texWidth = 1/texture_get_texel_width(_tex);
_texHeight = 1/texture_get_texel_height(_tex);
xo = argument[1];
yo = argument[2];
x1 = min(argument[3], argument[5]);
y1 = min(argument[4], argument[6]);
x2 = max(argument[3], argument[5]);
y2 = max(argument[4], argument[6]);

var _texX1, _texY1, _texX2, _texY2;
_texX1 = xo/_texWidth;
_texY1 = yo/_texHeight;
_texX2 = _texX1 + (x2-x1)/_texWidth;
_texY2 = _texY1 + (y2-y1)/_texHeight;

texture_set_repeat(true);
draw_primitive_begin_texture(pr_trianglestrip, _tex);
draw_vertex_texture(x1, y1, _texX1, _texY1);
draw_vertex_texture(x2, y1, _texX2, _texY1);
draw_vertex_texture(x2, y2, _texX2, _texY2);
draw_vertex_texture(x1, y2, _texX1, _texY2);
draw_vertex_texture(x1, y1, _texX1, _texY1);
draw_primitive_end();
