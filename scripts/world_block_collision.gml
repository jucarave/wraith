/*
 * world_block_collision(x1,y1,x2,y2)
 */
 
var x1 = floor(argument[0]);
var y1 = floor(argument[1]);
var x2 = floor(argument[2]);
var y2 = floor(argument[3]);

if (world_is_solid(x1, y1)) return true;
if (world_is_solid(x2, y1)) return true;
if (world_is_solid(x1, y2)) return true;
if (world_is_solid(x2, y2)) return true;

return false;
