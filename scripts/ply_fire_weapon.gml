/*
 * ply_fire_weapon()
 */
 
with (obj_system){
    if (TOWER_SELECTED != -1){ exit; }
    if (!WEAPONS[WEAPON_SELECTED, 0]){ exit; }
    
    if (WEAPONS[WEAPON_SELECTED, 1] > 0){
        var loop = WEAPON_DEF[WEAPON_SELECTED, 1];
        var sound = WEAPON_DEF[WEAPON_SELECTED, 2];
        var dist = 10.0;
        
        if (WEAPON_ATTACK && !loop) exit;
        
        if (loop){
            if (!WEAPON_ATTACK){
                WEAPON_ANIM_IND = WEAPON_LOOP_IND - 2;
                WEAPONS[WEAPON_SELECTED, 1] -= 1;
                audio_play_sound(sound, 1, false);
                ply_check_bullet(obj_player.x, obj_player.y, obj_player.direction, dist);
            }else if (WEAPON_ANIM_IND >= WEAPON_LOOP_IND){
                WEAPON_ANIM_IND = WEAPON_LOOP_IND - 2;
                WEAPONS[WEAPON_SELECTED, 1] -= 1;
                audio_play_sound(sound, 1, false);
                ply_check_bullet(obj_player.x, obj_player.y, obj_player.direction, dist);
            }
        }else if (!loop){
            WEAPON_ANIM_IND = 0;
            WEAPONS[WEAPON_SELECTED, 1] -= 1;
            audio_play_sound(sound, 1, false);
            ply_check_bullet(obj_player.x, obj_player.y, obj_player.direction, dist);
        }
        
        WEAPON_ATTACK = true;
    }else{
        if (!audio_is_playing(snd_no_ammo)){
            audio_play_sound(snd_no_ammo, 0, false);
        }
    }
}
