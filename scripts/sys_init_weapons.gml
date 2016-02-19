/*
 * sys_init_weapons()
 */
 
WEAPON_ANIM_IND = 0;
WEAPON_MAX_IND = 5;
WEAPON_LOOP_IND = 3;
WEAPON_ATTACK = false;

WEAPON_DEF[0, 0] = spr_gun;
WEAPON_DEF[0, 1] = false;
WEAPON_DEF[0, 2] = snd_gun_shot;
WEAPON_DEF[0, 3] = 0.3;

WEAPON_DEF[1, 0] = spr_machine_gun;
WEAPON_DEF[1, 1] = true;
WEAPON_DEF[1, 2] = snd_machine_gun_shot;
WEAPON_DEF[1, 3] = 0.5;
