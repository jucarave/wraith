/*
 * sys_buy_weapon(weapon, ammo, cost)
 */
 
var weapon = argument[0];
var ammo = argument[1];
var cost = argument[2];

var _x = x, _y = y;

with (obj_system){
    if (MONEY >= cost){
        map[_x, _y] += 1;
        WEAPONS[weapon, 0] = true;
        WEAPONS[weapon, 1] += ammo;
        MONEY -= cost;
        
        WEAPON_SELECTED = weapon;
        player.moved = true;
        
        sys_add_message("Weapon bought!", $32FF32, 60, 2);
        audio_play_sound(snd_buying, 0, false);
        return true;
    }else{
        sys_add_message("Not enough money!", $0000FF, 60, 2);
        audio_play_sound(snd_error, 0, false);
        return false;
    }
}
