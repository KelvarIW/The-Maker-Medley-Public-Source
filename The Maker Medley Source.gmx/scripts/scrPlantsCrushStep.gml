///scrPlantsCrushStep();
if (crushable && (crushed && dead) && !frozen){
    crushTimer += 1/30;
    if (crushTimer >= 4){
        instance_destroy();
    }else{
        image_alpha = (1 - max(crushTimer-3, 0));
    }
}
