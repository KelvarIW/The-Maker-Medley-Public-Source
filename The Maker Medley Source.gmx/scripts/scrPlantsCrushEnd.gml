///scrPlantsCrushEnd(crushTimer);
var _crushTimer = argument[0];
if (usingCrushSurf){
    surface_reset_target();
    usingCrushSurf = false;
    x = preCrushX;
    y = preCrushY;
    
    if (instance_exists(objPlantsCtrl)){
        if (surface_exists(objPlantsCtrl.crushSurf)){
            var _dim = objPlantsCtrl.crushSurfDim;
            draw_surface_ext(objPlantsCtrl.crushSurf, x - (_dim/2), y+32  -  _dim * (1 - min(_crushTimer, 0.84)), 1, (1 - min(_crushTimer, 0.84)), 0, c_white, image_alpha);
        }
    }
}
