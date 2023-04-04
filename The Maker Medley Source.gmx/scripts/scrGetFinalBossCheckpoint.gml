///scrGetFinalBossCheckpoint()
var t_num = 0;
switch(room){
    case rFinalBoss_1:
        t_num = 1;
        break;
    case rFinalBoss_2:
        if (view_xview >= room_width-800){
            t_num = 3;
        }else{
            t_num = 2;
        }
        break;
    case rFinalBoss_3:
        t_num = 4;
        break;
    case rFinalBoss_4:
        if (!buff()){
            if (view_yview >= 608){
                t_num = 6;
            }else{
                t_num = 5;
            }
        }else{
            t_num = 5;
        }
        break;
    default:
        t_num = 0;
        break;
}
return t_num;
