/*
 * world_get_tile(x, y)
 */
 
var cx = floor(argument[0]);
var cy = floor(argument[1]);

with (obj_system){
    if (cx < 0 || cy < 0){ return noone; }
    if (cx >= array_height_2d(map) || cy >= array_length_2d(map, 0)){ return noone; }
    
    return map[cx, cy];
}
