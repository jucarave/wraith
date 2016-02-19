/*
 * sys_block_in_area(x1, y1, x2, y2)
 */
 
var x1, y1, x2, y2;

x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];

with (obj_system){
    var len = array_length_1d(tower_areas);
    for (var i=0;i<len;i++){
        var ar = tower_areas[i];
        
        if (x2 >= ar[0] && y2 >= ar[1] && x1 < ar[2] && y1 < ar[3]){
            return true;
        }
    }
    
    return false;
}
