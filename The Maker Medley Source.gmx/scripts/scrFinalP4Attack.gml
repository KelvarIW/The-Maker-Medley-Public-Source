///scrFinalP4Attack()
// Was originally in objFinalBossChar_4; Moved to its own script during the creation of the (now unused) "dual attack" mode
var _buffOff = 0;
switch(phase){
    case 1: //Pieceofcheese89
        if (!(global.dead && ((phaseTimer+1) == 21 || (phaseTimer+1) == 71 || (phaseTimer+1) == 121))){
            phaseTimer ++;
            if (phaseTimer == 1 || phaseTimer == 51 || phaseTimer == 101){
                dieChangeState = 1;
            }else if (phaseTimer == 141){
                dieChangeState = -1;
            }else if (phaseTimer >= 220){
                phase = -1;
            }else{
                if (phaseTimer == 21 || phaseTimer == 71 || phaseTimer == 121){
                    var _num;
                    if (buff()){
                        _num = 5;
                    }else{
                        _num = 3;
                    }
                    var _angInc = (360/_num);
                    var _inst = noone, _offset = irandom(_angInc); //, _delay = irandom_range(24, 60);
                    for(var i=0; i<_num; i++;){
                        _inst = instance_create(x, y, objFinalP4LarryMagic);
                        _inst.direction = _offset + _angInc*(i + random_range(-0.5, 0.5));
                        _inst.vspeed += (_inst.speed * 2/5);
                        _inst.speedInit = _inst.speed;
                        _inst.delay = 4;
                        _inst.sfx = (i == 0);
                        //make the projectiles "emerge" quicker
                        _inst.x += lengthdir_x(40, _inst.direction);
                        _inst.y += lengthdir_y(40, _inst.direction);
                    }
                    audio_play_sound(sndMakerPlayerGrowBig, 0, 0);
                }
            }
        }else{
            dieChangeState = -1;
        }
    break;
    case 2: //Smartkin
        var _shootNum, _shootDelay;
        if (buff()){
            _shootNum = 8;
            _shootDelay = 40;
        }else{
            _shootNum = 3;
            _shootDelay = 14;
        }
        if (!(global.dead && ((phaseTimer+1) == 1 || (phaseTimer+1) == 31 || ((phaseTimer+1) >= 100 && (phaseTimer+1) <= (100 + _shootDelay*(_shootNum-1)) && ((phaseTimer+1 - 100) mod _shootDelay) == 0)))){
            phaseTimer ++;
            if (phaseTimer == 1){
                dieChangeState = 1;
            }else if (phaseTimer == 31){
                var _num;
                if (!buff()){
                    _num = 14;
                }else{
                    _num = 20;
                }
                var _inst = noone;
                for (var i=0; i<=20; i++){
                    _inst = instance_create(x, y-sprite_height/3, objFinalKnightRocks);
                    _inst.hspeed = lerp(-5.5, 5.5, i/_num + random_range(-0.25, 0.25));
                    _inst.vspeed = lerp(-5.25, -2.75, abs(i-(_num/2))/_num + random_range(-0.25, 0.25));
                }
                audio_play_sound(sndMakerSamplePunch, 0, 0);
            }
            if ((phaseTimer == 100 || phaseTimer == 114 || phaseTimer == 128) && instance_exists(objPlayer)){
                var _inst;
                
                if (buff()){
                    _inst = instance_create(x, y, objFinalKnightTHRounded);
                    _inst.tag = 2;
                    
                    with (_inst){
                        event_user(0);
                        
                        image_xscale = 1.2;
                        image_yscale = 1.2;
                        
                        //make the projectiles "emerge" quicker
                        x += lengthdir_x(40, direction);
                        y += lengthdir_y(40, direction);
                    }
                }else{
                    var _num;
                    _num = ((phaseTimer - 100) div 14);  // number of additional bullets
                    
                    for (var i=-(_num/2); i<=(_num/2); i++){
                        _inst = instance_create(x, y, objFinalKnightTHRounded);
                        _inst.tag = 2;
                        
                        with (_inst){
                            event_user(0);
                            
                            image_xscale = 1.4;
                            image_yscale = 1.4;
                            
                            direction += 12*i;
                            //make the projectiles "emerge" quicker
                            x += lengthdir_x(40, direction);
                            y += lengthdir_y(40, direction);
                        }
                    }
                }
                audio_play_sound(sndShootLoud, 0, 0);
            }else if (phaseTimer == 165){
                dieChangeState = -1;
            }else if (phaseTimer >= 185){
                phase = -1;
            }
        }else{
            dieChangeState = -1;
        }
    break;
    case 3: //Klazen108
        var _freeze = true;
        if (!global.dead && instance_exists(objFinalP4KirbyProjs)){
            _freeze = !(objFinalP4KirbyProjs.rowVisible[(objFinalP4KirbyProjs.columns-1)]);
        }else{
            _freeze = (global.dead && ((phaseTimer+1) == 1));
        }
        
        if (!_freeze){
            phaseTimer ++;
            if (phaseTimer == 1 && instance_exists(objPlayer)){
                var _spawnX = 0;
                if (objPlayer.x <= 400){
                    _spawnX = 800;
                }else{
                    _spawnX = 0;
                }
                
                instance_create(_spawnX, (blockHeight - 16), objFinalP4KirbyProjs);
                dieChangeState = 1;
            }
            
            if (phaseTimer == 28){
                dieChangeState = -1;
            }else if (phaseTimer == 60){
                phase = -1;
            }
        }
    break;
    case 4: //Kadykunde
        if (global.dead && (phaseTimer < 1 || global.deathSlow < (16/40))){
            phaseTimer = 0;
            dieChangeState = -1;
        }else{
            phaseTimer ++;
            if (phaseTimer == 1){
                dieChangeState = 1;
            }
            if (phaseTimer >= 1 && phaseTimer <= 185 && phaseTimer mod 8 == 1){
                var _inst;
                _inst = instance_create(400 + irandom_range(0, 368)*spawnSide, 556, objFinalKadyProj);
                _inst.index = 2;
                with (_inst)
                    event_user(0);
                spawnSide = -spawnSide;
            }
            
            if (phaseTimer == 210){
                dieChangeState = -1;
            }
            
            if (phaseTimer == 280){
                phase = -1;
            }
        }
    break;
    case 5: //Kurath
        var _phaseTimerMod = (phaseTimer mod 180);
        if (!(global.dead && ((phaseTimer+1) == 1 || (_phaseTimerMod+1) == 71 || (_phaseTimerMod+1) == 161))){
            phaseTimer ++;
            
            var _tiltAmt;
            if (!buff()){
                _tiltAmt = 8;
            }else{
                _tiltAmt = 18;
            }
            
            //if (phaseTimer < 341){
            if (phaseTimer < 161){
                if (phaseTimer >= 1 && phaseTimer <= 20){
                    view_angle = lerp(0, 22.5 * (-spawnSide), cos((1 - phaseTimer/20) * pi)/2 + 0.5);
                }else if (_phaseTimerMod >= 1 && _phaseTimerMod <= 20){
                    view_angle = lerp(-22.5 * (-spawnSide), 22.5 * (-spawnSide), cos((1 - (_phaseTimerMod+20)/40) * pi)/2 + 0.5);
                }else if (_phaseTimerMod >= 71 && _phaseTimerMod <= 110){
                    view_angle = lerp(-22.5 * (-spawnSide), 22.5 * (-spawnSide), cos((1 - (_phaseTimerMod-70)/40) * pi)/2 + 0.5);
                }/*else if (_phaseTimerMod >= 161 && _phaseTimerMod < 180){
                    view_angle = lerp(-22.5 * (-spawnSide), 22.5 * (-spawnSide), cos((1 - (_phaseTimerMod-160)/40) * pi)/2 + 0.5);
                }*/
                if (_phaseTimerMod == 1 || _phaseTimerMod == 91){
                    instance_create(400 + 400*(spawnSide), 64, objFinalP4KurathSpike);
                    instance_create(400 + 400*(spawnSide), 224, objFinalP4KurathSpike);
                    instance_create(400 + 400*(spawnSide), 384, objFinalP4KurathSpike);
                    instance_create(400 + 400*(spawnSide), 544, objFinalP4KurathSpike);
                }else if (_phaseTimerMod == 21 || _phaseTimerMod == 111){
                    audio_play_sound(sndMakerSampleGlass, 0, 0);
                    with (objFinalP4KurathSpike){
                        if (action == 1){
                            hSpd = random_range(7, 10)*(-side);
                            vSpd = -random_range(2, 4);
                            action = 2;
                        }
                    }
                    spawnSide *= -1;
                }
                
                if (_phaseTimerMod == 17){
                    dieChangeState = 1;
                }
            }else{
                if (phaseTimer >= 161 && phaseTimer <= 181){
                    view_angle = lerp(-22.5 * (-spawnSide), 0, cos((1 - (phaseTimer-161)/20) * pi)/2 + 0.5);
                }else if (phaseTimer > 250){
                    view_angle = 0;
                    phase = -1;
                }
            }
        }
        if (global.dead){
            dieChangeState = -1;
        }
    break;
    case 6: //patrickgh3
        if (!global.dead){
            phaseTimer ++;
            if (phaseTimer == 1){
                dieChangeState = 1;
            }
            if (phaseTimer >= 1 && phaseTimer <= 241 && phaseTimer mod 60 == 1){
                instance_create(400 + irandom_range(0, 300)*spawnSide, 608-104, objFinalP4PatTear);
                spawnSide = -spawnSide;
                audio_play_sound(sndMakerSampleThrow, 0, 0);
            }else if (phaseTimer == 291){
                dieChangeState = -1;
            }else if (phaseTimer == 428){
                phase = -1;
            }
        }else{
            dieChangeState = -1;
        }
    break;
    case 7: //YoYoYoDude1
        var _timerInc = 1;
        
        if (!global.dead){
            if (phaseTimer == 1){
                dieChangeState = 1;
            }
            
            var _spdChange = -1;
            if (buff()){
                _spdChange = 1;
            }
            if (phaseTimer <= 65 || phaseTimer >= 225){
                yoyoSpeed = 1;
            }else if (phaseTimer >= 115 && phaseTimer <= 175){
                yoyoSpeed = 1 + 0.4*_spdChange;
            }else if (phaseTimer > 65 && phaseTimer < 115){
                yoyoSpeed = 1 + _spdChange * 0.4*(sin((phaseTimer-65)/50));
            }else if (phaseTimer > 175 && phaseTimer < 225){
                yoyoSpeed = 1 + _spdChange * 0.4*(1 - sin((phaseTimer-175)/50));
            }
            if (phaseTimer == 65){
                audio_play_sound(sndFinalP4YoyoSlow, 0, 0);
            }else if (phaseTimer >= 175 && (phaseTimer - 175) < yoyoSpeed){
                audio_play_sound(sndFinalP4YoyoSpeed, 0, 0);
            }
            
            if (phaseTimer == 235){
                dieChangeState = -1;
            }
        }else{
            dieChangeState = -1;
        }
        _timerInc = (yoyoSpeed * global.deathSlow);
        phaseTimer += _timerInc;
        
        if ((phaseTimer mod 12) < _timerInc && phaseTimer < 195){
            var _num = 0, _spd = 0;;
            if (phaseTimer mod 24 < _timerInc){
                _num = 3;
                _spd = irandom_range(8.4, 11);
                
                scrMakeShapes(x,y,random(360), 3, _num, _spd, objFinalYoyoFruit);
            }else{
                _num = 5;
                _spd = irandom_range(4.6, 6.4);
                
                scrMakeShapes(x,y,random(360), 4, _num, _spd, objFinalYoyoFruit);
            }
            with (objFinalYoyoFruit){
                if (index == -1){
                    index = 1;
                    event_user(0);
                }
            }
            var _snd = -4;
            _snd = audio_play_sound(sndMakerSamplePunch, 0, 0);
            audio_sound_pitch(_snd, 0.4 + (random_range(0.5, 0.95) * ((_timerInc + 1)/2)) );
        }
        with (objFinalYoyoFruit){
            if (other.phaseTimer <= 175){
                spdMult = other.yoyoSpeed;
            }else{
                spdMult = 0.5 + (other.yoyoSpeed-0.5)/2;
            }
        }
        
        if (phaseTimer >= 225 || _timerInc <= 0){
            dieChangeState = -1;
        }
        if (phaseTimer >= 264){
            phase = -1;
        }
    break;
    case 8: //Dribix
        if (!global.dead){
            phaseTimer ++;
            if (!buff()){
                if (phaseTimer >= 1 && phaseTimer <= 301 && phaseTimer mod 100 == 1){
                    instance_create(400 + irandom_range(0, 270)*spawnSide, 524, objFinalP4DribixTorch);
                    spawnSide = -spawnSide;
                    dieChangeState = 1;
                }else if (phaseTimer == 341){
                    dieChangeState = -1;
                }else if (phaseTimer == 389){
                    phase = -1;
                }
            }else{
                if (phaseTimer >= 1 && phaseTimer <= 181 && phaseTimer mod 60 == 1){
                    instance_create(400 + irandom_range(0, 270)*spawnSide, 524, objFinalP4DribixTorch);
                    spawnSide = -spawnSide;
                    
                    dieChangeState = 1;
                }else if (phaseTimer == 221){
                    dieChangeState = -1;
                }else if (phaseTimer == 269){
                    phase = -1;
                }
                
            }
        }else{
            dieChangeState = -1;
        }
    break;
    case 9: //Tralex
        if (!global.dead){
            phaseTimer ++;
            if (phaseTimer == 1){dieChangeState = 1;}
            if (!global.dead && (phaseTimer >= 1 && phaseTimer < 201 && phaseTimer mod 50 == 1)){
                instance_create(400 + irandom_range(160, 296)*spawnSide, 608 + random_range(208, 320), objFinalP4TralexSpawner);
                spawnSide = -spawnSide;
            }else if (phaseTimer == 241){
                dieChangeState = -1;
            }else if (phaseTimer == 296){
                if (!buffDualAttacks){  // (removed) dual-attack version only destroys shurikens when both attacks end
                    with (objFinalP4TralexStar){
                        expand = true;
                        speed = 0;
                        gravity = 0;
                    }
                    audio_sound_pitch(audio_play_sound(sndMakerSampleBlaster, 0, 0), 1.4);
                }
            }else if (phaseTimer == 410){
                phase = -1;
            }
        }else{
            dieChangeState = -1;
        }
    break;
    case 10: //Sudnep
        if (buff()){
            _buffOff = 1;
        }
        if (!global.dead){
            phaseTimer ++;
            if (phaseTimer == 1){
                var _inst;
                _inst = instance_create(400, 736, objFinalP4SudnepCherries);
                _inst.image_index = 0;
                _inst.sfx = true;
                _inst = instance_create(400, 736, objFinalP4SudnepCherries);
                _inst.image_index = 0;
                _inst.sineAng = 180;
                
                dieChangeState = 1;
            }else if (phaseTimer == 205 + (-20 * _buffOff)){
                with (objFinalP4SudnepCherries){
                    shrink = true;
                    shrinkNum ++;
                }
            }else if (phaseTimer == 230 + (40*_buffOff)){
                dieChangeState = -1;
            }else if (phaseTimer == 270 + (40*_buffOff)){
                phase = -1;
            }
        }else{
            dieChangeState = -1;
        }
    break;
}
