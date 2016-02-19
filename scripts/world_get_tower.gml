/*
 * world_get_tower(x, y)
 */
 
var gx = floor(argument[0]);
var gy = floor(argument[1]);

var tw = noone;

with (obj_system){
    var len = array_length_1d(objects);
    for (var i=0;i<len;i++){
        var ins = objects[i];
        if (!instance_exists(ins)){ continue; }
        
        if (ins.object_index == obj_tower && floor(ins.x) == gx && floor(ins.y) == gy){
            tw = ins;
            i = len;
        }
    }
    
    if (tw != noone){
        return tw;
    }
}

return noone;
