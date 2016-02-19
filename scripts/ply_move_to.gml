/*
 * ply_move_to(direction)
 */

var dir = argument[0];
var xTo = cos(degtorad(dir)) * spd;
var yTo = -sin(degtorad(dir)) * spd;

var x1, x2, y1, y2, s;
s = obj_system.INSTANCE_SIZE;

x1 = x - s;
x2 = x + s + xTo;
y1 = y - s;
y2 = y + s;

if (xTo < 0){
    x1 += xTo;
    x2 -= xTo;
}

var block_col = world_block_collision(x1,y1,x2,y2);
var obj_col = sys_object_block_collision(x1,y1,x2,y2);
if (!block_col && !obj_col){
    x += xTo;
}
 
x1 = x - s;
x2 = x + s;
y1 = y - s;
y2 = y + s + yTo;

if (yTo < 0){
    y1 += yTo;
    y2 -= yTo;
}

block_col = world_block_collision(x1,y1,x2,y2);
obj_col = sys_object_block_collision(x1,y1,x2,y2);
if (!block_col && !obj_col){
    y += yTo;
}
