/*
 * sys_create_particle(x, y, path)
 */
 
var _x = argument[0];
var _y = argument[1];
var _p = argument[2];

var par = instance_create(_x, _y, obj_particle);
par.sprite_index = spr_particle;
par.path = _p;

return par;
