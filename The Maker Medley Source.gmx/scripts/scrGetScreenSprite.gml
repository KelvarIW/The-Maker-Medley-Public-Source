var _temp = -1;
if (surface_exists(application_surface)){ //yes, this is necessary. See objWorld's Step event pause code.
    //make an application_surface copy that is completely opaque
    if (!surface_exists(global.sharedSurf)){
        global.sharedSurf = surface_create(800, 608);
    }
    if (surface_exists(global.sharedSurf)){
        surface_set_target(global.sharedSurf);
        draw_clear_alpha(c_black, 0);
        
        surface_copy(global.sharedSurf, 0, 0, application_surface);
        draw_set_colour_write_enable(false, false, false, true);
        draw_rectangle(0, 0, 800, 608, false);
        draw_set_colour_write_enable(true, true, true, true);
        surface_reset_target();
        
        _temp = sprite_create_from_surface(global.sharedSurf, 0, 0, 800, 608, false, false, 0, 0);
    }else{
        _temp = sprite_create_from_surface(application_surface, 0, 0, 800, 608, false, false, 0, 0);
    }
}
return (_temp);
