/*
 * sys_create_switch(x, y, type, params)
 */
 
var _x = argument[0];
var _y = argument[1];
var type = argument[2];
var params = argument[3];

var sw = instance_create(_x, _y, obj_switch);
sw.type = type;
sw.params = params;

return sw;
