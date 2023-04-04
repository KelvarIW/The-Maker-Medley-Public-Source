///scrFinalCalcGlowAlpha(fadeIn, fadeOut)
if (instance_exists(objFinalRNGDie)){
    if (objFinalRNGDie.latchedOn && (objFinalRNGDie.targetObj == object_index || objFinalRNGDie.targetObj == id) && objFinalRNGDie.appearLerp < 0.1){
        if (glowAlpha < 1){
            glowAlpha = min(glowAlpha+argument[0], 1);
        }
    }else{
        if (glowAlpha > 0){
            glowAlpha = max(glowAlpha-argument[1], 0);
        }
    }
}
