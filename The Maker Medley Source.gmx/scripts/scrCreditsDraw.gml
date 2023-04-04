///scrCreditsDraw()
//should only be called from objCreditsCtrl
relativeSpacing = 24;
startDrawing = false;
stopDrawing = false;
draw_set_font(fDefault18);
draw_set_color(c_white);
draw_set_valign(fa_top);

do{
    //Stage 1
    scrCreditsText(relativeSpacing, "title", 0, -1);
    for (var i=0; i<levelNum[0];i++){
        scrCreditsText(relativeSpacing, "level", 0, i);
    }
    
    //Boss 1
    relativeSpacing += 80;
    scrCreditsText(relativeSpacing, "title", 1, -1);
    for (var i=0; i<levelNum[1];i++){
        scrCreditsText(relativeSpacing, "boss", 1, i);
    }
    
    //Stage 2
    scrCreditsText(relativeSpacing, "title", 2, -1);
    for (var i=0; i<levelNum[2];i++){
        scrCreditsText(relativeSpacing, "level", 2, i);
    }
    
    //Boss 2
    relativeSpacing += 80;
    scrCreditsText(relativeSpacing, "title", 3, -1);
    for (var i=0; i<levelNum[3];i++){
        scrCreditsText(relativeSpacing, "boss", 3, i);
    }
    
    //Knockoff Rush
    relativeSpacing += 80;
    scrCreditsText(relativeSpacing, "title", 4, -1);
    scrCreditsText(relativeSpacing, "level", 4, 0);
    scrCreditsText(relativeSpacing, "level", 4, 1);
    scrCreditsText(relativeSpacing, "level", 4, 2);
    
    //Final Stage and Boss
    relativeSpacing += 80;
    scrCreditsText(relativeSpacing, "title", 5, -1);
    scrCreditsText(relativeSpacing, "image spread", 5, -1);
    
    relativeSpacing += 80;
    var _xOff = 96;
    var _xSpacing = 152;
    scrCreditsText(relativeSpacing, "title", 6, -1);
    for (var i=1; i<=5; i++){
        scrCreditsText(relativeSpacing, "Elephant Crew", 6, i);
    }
    
    //Testers  (draws four at a time)
    scrCreditsText(relativeSpacing, "header" , 7, -1);
    scrCreditsText(relativeSpacing, "testers", 7, 0);
    scrCreditsText(relativeSpacing, "testers", 7, 4);
    
    //Thanks
    relativeSpacing += 80;
    scrCreditsText(relativeSpacing, "header", 8, -1);
    for (var i=0; i<levelNum[8];i++){
        scrCreditsText(relativeSpacing, "thanks list", 8, i);
    }
    
    if (!startDrawing){
        //show_debug_message("reached end of credits");
    }
    stopDrawing = true;
}until (stopDrawing);

/*
// show scroll height
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outline(400, 212, string(relativeSpacing), 2, c_black, 12);
*/
