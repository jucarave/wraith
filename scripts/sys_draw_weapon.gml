/*
 * sys_draw_weapon()
 */

if (TOWER_SELECTED == -1 && WEAPONS[WEAPON_SELECTED, 0]){
    if (WEAPON_ATTACK){
        WEAPON_ANIM_IND += WEAPON_DEF[WEAPON_SELECTED, 3];
        if (WEAPON_ANIM_IND >= WEAPON_MAX_IND){
            WEAPON_ANIM_IND = 0;
            WEAPON_ATTACK = false;
        }
    }

    var spr = WEAPON_DEF[WEAPON_SELECTED, 0];
    var ind = floor(WEAPON_ANIM_IND);
    
    draw_sprite_ext(spr, ind, SCREEN_WIDTH / 2, SCREEN_HEIGHT, 2, 2,0, c_white, 1);
}
