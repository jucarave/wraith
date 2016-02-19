/*
 * world_line_collision(x, y, dir, dist)
 */

var _x = argument[0];
var _y = argument[1];
var dir = argument[2];
var dist = argument[3];

var map_x, map_y;
var _cos = cos(degtorad(dir));
var _sin = -sin(degtorad(dir));

for (var i=0;i<dist;i++){
    map_x = floor(_x);
    map_y = floor(_y);
    
    if (world_is_solid(map_x, map_y)){
        return point_distance(argument[0], argument[1], map_x + 0.5, map_y + 0.5);
    }
    
    _x += _cos;
    _y += _sin;
}

return -1;
