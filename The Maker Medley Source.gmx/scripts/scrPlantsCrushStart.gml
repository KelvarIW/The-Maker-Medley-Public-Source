///scrPlantsCrushStart(surfaceX, surfaceY);
//surfaceX/Y: x/y coordinate of the 128x128 surface to start drawing from (0 = top/left; (crushSurfDim/2) = center/middle; crushSurfDim = right/bottom)
//for the best effect, set this so the bottom of the sprite will be at the bottom of the surface
//(for possible collab)  examples of this can be seen in the plant and enemy objects

if (crushed){
    if (instance_exists(objPlantsCtrl)){
        var _dim = objPlantsCtrl.crushSurfDim;
        if (!surface_exists(objPlantsCtrl.crushSurf)){
            objPlantsCtrl.crushSurf = surface_create(_dim, _dim);
        }
        if (surface_exists(objPlantsCtrl.crushSurf)){
            surface_set_target(objPlantsCtrl.crushSurf);
            usingCrushSurf = true;
            draw_clear_alpha(c_black, 0);
            
            preCrushX = x;
            preCrushY = y;
            x = argument[0];
            y = argument[1];
        }
    }
}
