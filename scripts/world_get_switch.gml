/*
 * world_get_switch(x, y)
 */
 
var gx = floor(argument[0]);
var gy = floor(argument[1]);

var sw = noone;

with (obj_system){
    var len = array_length_1d(switches);
    for (var i=0;i<len;i++){
        var ins = switches[i];
        
        if (ins.x == gx && ins.y == gy){
            sw = ins;
            i = len;
        }
    }
    
    if (sw != noone){
        return sw;
    }
}

return noone;
