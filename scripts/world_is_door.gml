/*
 * world_is_door(x, y)
 */
 
var tile = world_get_tile(argument[0], argument[1]);
if (tile == 3){
    return true;
}

return false;
