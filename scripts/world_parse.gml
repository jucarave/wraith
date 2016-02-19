/*
 * world_parse(string world, int width, int height)
 */

var world = argument[0];
var width = argument[1];
var height = argument[2];

var map, _x = 0, _y = 0;

var i, len = string_width(world);

var num = '';
for (i=1;i<=len;i++){
    var _char = string_char_at(world, i);
    if (_char != ' '){ num += _char; }
    if (_char != ','){ continue; }
    
    map[_x++, _y] = real(num);
    num = '';
    
    if (_x == width){
        _x = 0;
        _y++;
        
        if (_y == height){
            i = len;
        }
    }
}

return map;
