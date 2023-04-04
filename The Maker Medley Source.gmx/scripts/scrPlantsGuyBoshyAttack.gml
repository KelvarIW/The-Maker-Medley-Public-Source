///scrPlantsGuyBoshyAttack()
// Only for The Guy and Boshy enemies
if (object_index == objPlantsGuy || object_index == objPlantsBoshy){
    var _bulletDmg;
    if (object_index == objPlantsGuy){
        _bulletDmg = 2;
    }else{
        _bulletDmg = 1;
    }
    
    if (!run && (((!instance_exists(shooting) || shooting.dead) || (shooting.x >= x || shooting.bbox_right < bbox_left - plantSearchDist*plantSearchIdleMult)) && (shootTimer < (shootCycleLen - (idleShootRecoverDelay*shootIdleMult))))){
        var _closestPlantX = 0;
        with (objPlantsPlant){  // search for other plants
            if (row == other.row && !dead && !scrPlantsInvincible() && scrPlantsDetectable() && !scrPlantsPlantTooLow(id) && (bbox_right+1) >= (other.bbox_left-other.plantSearchDist*other.plantSearchIdleMult) && x < other.x && x > _closestPlantX){
                _closestPlantX = x;
                other.shooting = id;
            }
        }
        if (!instance_exists(shooting)){
            run = true;
            shootTimer = shootCycleLen;
        }
    }
    
    if ((bbox_right+1) > 96 && !killing){
        if (run){
            if (instance_exists(objPlantsCtrl)){
                if (place_meeting(x, y, objPlantsPlant) || (floor(image_index) mod 2) < 1){  // stop when close to a plant  (the place_meeting check is to prevent walking past one because of the enemy animation frame)
                    var _closestPlantX = 0;
                    with (objPlantsPlant){  // check *all* plants in that region
                        if (row == other.row && !dead && !scrPlantsInvincible() && scrPlantsDetectable() && !scrPlantsPlantTooLow(id) && (bbox_right+1) >= (other.bbox_left-other.plantSearchDist) && x < other.x && x > _closestPlantX){
                            _closestPlantX = x;
                            other.shooting = id;
                            other.run = false;
                            other.shootTimer = other.shootCycleLen;
                        }
                    }
                }
                if (run){  // stop and shoot occasionally when running
                    if (shootTimer <= 0){  // check for the closest plant to shoot
                        var _closestPlantX = 0;
                        shooting = noone;
                        with (objPlantsPlant){  // check *all* plants infront of us in our row
                            if (row == other.row && !dead && !scrPlantsInvincible() && scrPlantsDetectable() && !scrPlantsPlantTooLow(id) && x < other.x && x > _closestPlantX){
                                _closestPlantX = x;
                                other.shooting = id;
                            }
                        }
                        
                        if (instance_exists(shooting) && scrPlantsDetectable(shooting) && !scrPlantsPlantTooLow(shooting)){
                            var _bullet = noone;
                            if (object_index == objPlantsGuy){
                                _bullet = scrPlantsEnemyShoot(x-40, y-18, shooting, 12);
                            }else{  // Boshy
                                _bullet = scrPlantsEnemyShoot(x-18, y-3+2*(floor(image_index) mod 2), shooting, 16);
                            }
                            
                            if (_bullet != noone){
                                _bullet.dmg = _bulletDmg;
                                _bullet.image_xscale = 2*_bulletDmg;
                                _bullet.image_yscale = 2*_bulletDmg;
                            }
                            
                            audio_play_sound(sndPlantsGuyShoot, 0, 0);
                            
                            shooting = noone;
                            shootTimer = shootCycleLen;
                        }
                    }
                }
            }
        }else{  // shoot more frequently when stopped
            if (instance_exists(shooting) && !shooting.dead){
                if (shootTimer <= 0){
                    var _bullet = noone;
                    if (object_index == objPlantsGuy){
                        _bullet = scrPlantsEnemyShoot(x-40, y-18, shooting, 12);
                    }else{  // Boshy
                        _bullet = scrPlantsEnemyShoot(x-18, y-3+2*floor(image_index mod 2), shooting, 16);
                    }
                    
                    if (_bullet != noone){
                        _bullet.dmg = _bulletDmg;
                        _bullet.image_xscale = 2*_bulletDmg;
                        _bullet.image_yscale = 2*_bulletDmg;
                    }
                    audio_play_sound(sndPlantsGuyShoot, 0, 0);
                    
                    shootTimer = shootCycleLen;
                }
            }
        }
    }else{
        run = true;
    }
}
