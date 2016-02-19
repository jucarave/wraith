/*
 * world_is_solid(cell_x, cell_y)
 */

var cx = floor(argument[0]);
var cy = floor(argument[1]);

with (obj_system){
    if (cx < 0 || cy < 0){ return true; }
    if (cx >= array_height_2d(map) || cy >= array_length_2d(map, 0)){ return true; }
    
    if (map[cx, cy] >= 1){
        return true;
    }
    
    return false;
}
