/*
 * sys_enemy_line_collision(x1,y1,x2,y2)
 */

var x1, y1, x2, y2;

x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];

var near = noone;
var near_dist = 1000;

with (obj_system){
    var len = array_length_1d(enemies);
    for (var i=0;i<len;i++){
        var ins = enemies[i];
        
        var e_x1, e_y1, e_x2, e_y2, f_min, f_max;
        
        e_x1 = ins.x - INSTANCE_SIZE;
        e_y1 = ins.y - INSTANCE_SIZE;
        e_x2 = ins.x + INSTANCE_SIZE;
        e_y2 = ins.y + INSTANCE_SIZE;
        
        if (x1 == x2 && (x1 < e_x1 || x1 >= e_x2)){ continue; }
        if (y1 == y2 && (y1 < e_y1 || y1 >= e_y2)){ continue; }
        if ((x1 < e_x1 && x2 < e_x1) || (x1 >= e_x2 && x2 >= e_x2)){ continue; }
        if ((y1 < e_y1 && y2 < e_y1) || (y1 >= e_y2 && y2 >= e_y2)){ continue; }
        
        f_min = 0;
        f_max = 1;
        
        if (x2 > x1){
            f_min = max((e_x1 - x1) / (x2 - x1), f_min);
            f_max = min((e_x2 - x1) / (x2 - x1), f_max);
        }else if (x2 < x1){
            f_min = max((x1 - e_x2) / (x1 - x2), f_min);
            f_max = min((x1 - e_x1) / (x1 - x2), f_max);
        }
        
        if (y2 > y1){
            f_min = max((e_y1 - y1) / (y2 - y1), f_min);
            f_max = min((e_y2 - y1) / (y2 - y1), f_max);
        }else if (y2 < y1){
            f_min = max((y1 - e_y2) / (y1 - y2), f_min);
            f_max = min((y1 - e_y1) / (y1 - y2), f_max);
        }
        
        if (f_max < f_min){ continue; }
        
        var dist = point_distance(x1, y1, e_x1, e_y1);
        if (dist < near_dist){
            near_dist = dist;
            near = ins;
        }
    }
}

var ret;

ret[0] = near;
ret[1] = near_dist;

return ret;
