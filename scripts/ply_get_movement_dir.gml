/*
 * ply_get_movement_dir()
 */

var dir = -1;

var up = keyboard_check(ord('W'));
var left = keyboard_check(ord('A'));
var down = keyboard_check(ord('S'));
var right = keyboard_check(ord('D'));

if (!up && !left && !down && !right){ return dir; }

dir = direction;
if (down){ dir += 180; }

if (left){
    if (up){ dir += 45; }else
    if (down){ dir -= 45; }else
    { dir = direction + 90; }
}else if (right){
    if (up){ dir -= 45; }else
    if (down){ dir += 45; }else
    { dir = direction - 90; }
}

return dir;
