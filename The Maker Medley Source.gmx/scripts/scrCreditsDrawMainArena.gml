///scrCreditsDrawMainArena(tileset)
//for tileState 0
//outer border
var _tileset = argument[0];
if (_tileset != 13 && _tileset != 17){  // if we are running this event with tileset 17, we must be running this through objDropShadows
    if (_tileset != 8){  //Shark's tileset doesn't have any walls that are more than 1 block thick
        for (var i=0; i<25; i++){
            scrTitleDrawTiles(_tileset, 4, 32*i, 0);
            scrTitleDrawTiles(_tileset, 4, 32*i, 576);
        }
        for (var j=1; j<18; j++){
            scrTitleDrawTiles(_tileset, 4, 0, 32*j);
            scrTitleDrawTiles(_tileset, 4, 768, 32*j);
        }
    }else{
        for (var i=1; i<24; i++){
            scrTitleDrawTiles(_tileset, 7, 32*i, 0);
            scrTitleDrawTiles(_tileset, 1, 32*i, 576);
        }
        for (var j=1; j<18; j++){
            scrTitleDrawTiles(_tileset, 3, 768, 32*j);
            scrTitleDrawTiles(_tileset, 5,  0, 32*j);
        }
        
        //corners
        scrTitleDrawTiles(_tileset, 10, 0, 0);
        scrTitleDrawTiles(_tileset, 11, 768, 0);
        scrTitleDrawTiles(_tileset, 12, 0, 576);
        scrTitleDrawTiles(_tileset, 13, 768, 576);
    }
    
    //inner border
    for (var i=2; i<23; i++){
        scrTitleDrawTiles(_tileset, 7, 32*i, 32);
        scrTitleDrawTiles(_tileset, 1, 32*i, 544);
    }
    for (var j=2; j<17; j++){
        scrTitleDrawTiles(_tileset, 3, 736, 32*j);
        scrTitleDrawTiles(_tileset, 5,  32, 32*j);
    }
    
    //corners
    scrTitleDrawTiles(_tileset, 10, 32, 32);
    scrTitleDrawTiles(_tileset, 11, 736, 32);
    scrTitleDrawTiles(_tileset, 12, 32, 544);
    scrTitleDrawTiles(_tileset, 13, 736, 544);
}else{
    draw_set_color(c_white);
    draw_rectangle(0 - 0.5, 0 - 0.5, 800 - 0.5, 64 - 0.5, false);       //top
    draw_rectangle(0 - 0.5, 544 - 0.5, 800 - 0.5, 608 - 0.5, false);    //bottom
    
    draw_rectangle(0 - 0.5, 64 - 0.5, 64 - 0.5, 544 - 0.5, false);       //left
    draw_rectangle(736 - 0.5, 64 - 0.5, 800 - 0.5, 544 - 0.5, false);       //right
}

