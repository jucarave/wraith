/*
 * sys_switch_weapon(weaponIndex)
 */
 
var ind = argument[0];

with (obj_system){
    if (TOWER_SELECTED != -1){ exit; }
    if (WEAPON_SELECTED == ind) exit;
    
    if (WEAPONS[ind, 0]){
        WEAPON_SELECTED = ind; 
        audio_play_sound(snd_pick_ammo, 0, false);
    }
}
