/*
 * sys_check_paths(block_x, block_y)
 */
 
var _x = floor(argument[0]);
var _y = floor(argument[1]);

with (obj_system){
    mp_grid_add_cell(motionMap, _x, _y);
    
    var i, ex, ey;
    var len = array_height_2d(enemy_areas);
    for (i=0;i<len;i++){
        ex = enemy_areas[i, 0];
        ey = enemy_areas[i, 1];
    
        if (!mp_grid_path(motionMap, pth_temp, ex, ey, target_area[0], target_area[1], false)){
            mp_grid_clear_cell(motionMap, _x, _y);
            return false;
        }
    }
    
    mp_grid_clear_cell(motionMap, _x, _y);
}

return true;
