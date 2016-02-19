/*
 * tw_buy_tower(x, y)
 */
 
var _x = argument[0];
var _y = argument[1];

with (obj_system){
    var spr = TOWERS_DEF[TOWER_SELECTED, 0];
    var cost = TOWERS_DEF[TOWER_SELECTED, 1];
    
    var phantom = objects[0];
    
    if (phantom.valid){
        var len = array_length_1d(objects);
        
        var tower;
        tower = tw_create_tower(_x, _y, TOWER_SELECTED);
        
        objects[len] = tower;
    
        MONEY -= cost;
        TOWER_SELECTED = -1;
        
        phantom.x = 0;
        phantom.y = 0;
        phantom.sprite_index = -1;
        
        mp_grid_add_cell(motionMap, floor(_x), floor(_y));
        var len = array_height_2d(enemy_areas);
        for (var i=0;i<len;i++){
            mp_grid_path(motionMap, enemy_areas[i, 2], enemy_areas[i, 0], enemy_areas[i, 1], target_area[0], target_area[1], false);
        }
        
        sys_add_message("Weapon bought!", $32FF32, 60, 2);
        audio_play_sound(snd_buying, 0, false);
        return true;
    }else{
        sys_add_message("Can't place it here", $0000FF, 60, 2);
        audio_play_sound(snd_error, 0, false);
        return true;
    }
}

return false;
