/*
 * world_set_motion_map(map)
 */

var map = argument[0];
var width = array_height_2d(map);
var height = array_length_2d(map, 0);

var ret = mp_grid_create(0,0,width,height,1,1);
var _x, _y;

for (_x=0;_x<width;_x++){
    for (_y=0;_y<height;_y++){
        if (map[_x, _y] > 0 && map[_x, _y] < 90){
            mp_grid_add_cell(ret, _x, _y);
        }
    }
}

var len = array_length_1d(objects);
for (var i=0;i<len;i++){
    var ins = objects[i];
    if (!instance_exists(ins)) continue;
    
    if (ins.solid){
        mp_grid_add_cell(ret, floor(ins.x), floor(ins.y));
    }
}

return ret;
