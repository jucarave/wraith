/*
 * ply_show_instance_message(instance)
 */

var ins = argument[0];

switch (ins.object_index){
    case obj_switch:
        var wp = ins.params[0];
        if (obj_system.WEAPONS[wp, 0]){
            sys_add_message("Press 'E' to purchase ammo for the " + sys_get_weapon_name(wp), $ffffff, 15, 1);
        }else{
            sys_add_message("Press 'E' to purchase the " + sys_get_weapon_name(wp), $ffffff, 15, 1);
        }
        break;
        
    case obj_tower:
        if (ins.progress == ins.progress_max && !ins.destroying){
            var price = ins.sell_price;
            var upg = string(ins.upgrade_price);
            if (obj_system.START_WAVE){ price = ins.half_price; }
            
            if (obj_system.TOWERS_DEF[ins.tower_ind, 7]){
                sys_add_message("'Q' to Upgrade for $" + upg + " or 'E' to sell for $" + string(price), $ffffff, 5, 1);
            }else{
                sys_add_message("'E' to sell for $" + string(price), $ffffff, 5, 1);
            }
            ins.image_blend = c_aqua;
        }
        break;
}
