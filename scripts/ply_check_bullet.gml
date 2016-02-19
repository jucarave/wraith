/*
 * ply_check_bullet(x, y, direction, distance)
 */
 
var x1, y1, x2, y2, dir, dist;

dir = argument[2];
dist = argument[3];

x1 = argument[0];
y1 = argument[1];
x2 = x1 + cos(degtorad(dir)) * 10.0;
y2 = y1 - sin(degtorad(dir)) * 10.0;

var wall_dist = world_line_collision(x1, y1, dir, dist);


var hit = sys_enemy_line_collision(x1,y1,x2,y2);
if (hit[0] != noone){
    if (wall_dist != -1 && wall_dist < hit[1]){
        return false;
    }
    
    var enemy = hit[0];
    enemy.hp -= 5;
}else if (wall_dist != -1){
    return false;
}

return true;
