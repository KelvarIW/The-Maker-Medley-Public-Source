///scrDrawRoomTiles(depth,x,y,w,h, [offset])
var _depth, _x, _y, _w, _h, _offset, i, j, curTile;
_depth = argument[0];
_x = argument[1];
_y = argument[2];
_w = argument[3];
_h = argument[4];
_offset = 16;
if(argument_count > 5 && argument[5] > 0){ _offset = argument[5]; }
     
for( i=0; i<=ceil(_w/_offset); i+=1 ){
    for( j=0; j<=ceil(_h/_offset); j+=1 ){
        curTile = tile_layer_find(_depth,_x+(i*_offset),_y+(j*_offset));
        tile_layer_hide(_depth);
        if(curTile == -1 ){ continue; }
        draw_background_part( tile_get_background(curTile), 
        tile_get_left(curTile), tile_get_top(curTile),
        tile_get_width(curTile), tile_get_height(curTile),
        tile_get_x(curTile)-_x, tile_get_y(curTile)-_y);
    }
}
