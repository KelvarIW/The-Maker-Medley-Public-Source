///scrDrawPie(x, y, value, max, colour, radius, transparency, angle, [sections])


if (argument[2] > 0) { // no point even running if there is nothing to display (also stops /0)
    var i, len, tx, ty, val;
    
    var numberofsections, sizeofsection;
    if (argument_count >= 9)
        numberofsections = argument[8];
    else
        numberofsections = 60;
    sizeofsection = 360/numberofsections
    
    val = (argument[2]/argument[3]) * numberofsections;
    
    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
        draw_set_colour(argument[4]);
        draw_set_alpha(argument[6]);
        
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(argument[0], argument[1]);
        
        for(i=0; i<=val; i++) {
            len = (i*sizeofsection)+argument[7];
            tx = lengthdir_x(argument[5], len);
            ty = lengthdir_y(argument[5], len);
            draw_vertex(argument[0]+tx, argument[1]+ty);
        }
        draw_primitive_end();
        
    }
    draw_set_alpha(1);
    draw_set_color(c_white);
}
