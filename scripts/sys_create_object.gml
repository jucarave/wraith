/*
 * sys_create_object(x, y, sprite, solid)
 */
 
var _x = argument[0];
var _y = argument[1];
var spr = argument[2];
var _s = argument[3];

var object = instance_create(_x, _y, obj_object);
object.sprite_index = spr;
object.solid = _s;

return object;
