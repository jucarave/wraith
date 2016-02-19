/*
 * sys_object_block_collision(x1, y1, x2, y2)
 */

var x1 = argument[0];
var y1 = argument[1];
var x2 = argument[2];
var y2 = argument[3];

with (obj_system){
    var len = array_length_1d(objects);
    
    var o_x1, o_x2, o_y1, o_y2;
    for (var i=1;i<len;i++){
        var ins = objects[i];
        if (!instance_exists(ins)){ continue; }
        
        if (!ins.solid) continue;
        
        o_x1 = ins.x - INSTANCE_SIZE;
        o_y1 = ins.y - INSTANCE_SIZE;
        o_x2 = ins.x + INSTANCE_SIZE;
        o_y2 = ins.y + INSTANCE_SIZE;
        
        if (x2 < o_x1 || y2 < o_y1 || x1 >= o_x2 || y1 >= o_y2) continue;
        
        return ins;
    }
}

return noone;
