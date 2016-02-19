var tx = floor(x+cos(degtorad(direction)) * 1.3) + 0.5;
var ty = floor(y-sin(degtorad(direction)) * 1.3) + 0.5;

var x1, y1, x2, y2;

var s = obj_system.INSTANCE_SIZE;
x1 = tx - s;
y1 = ty - s;
x2 = tx + s;
y2 = ty + s;

var phantom = obj_system.objects[0];
phantom.x = tx;
phantom.y = ty;
phantom.sprite_index = obj_system.TOWERS_DEF[obj_system.TOWER_SELECTED, 0];
phantom.image_index = 2;
phantom.image_alpha = 0.8

phantom.image_blend = c_red;
phantom.valid = false;

if (!world_is_solid(tx, ty) && sys_block_in_area(x1,y1,x2,y2) && !sys_object_block_collision(x1,y1,x2,y2)){
    if (sys_check_paths(tx, ty)){
        phantom.image_blend = c_green;
        phantom.valid = true;
    }
}

sys_add_message("Clic to purchase the " + sys_get_tower_name(obj_system.TOWER_SELECTED), $ffffff, 15, 1);

if (mouse_check_button_pressed(mb_left)){
    tw_buy_tower(tx, ty);
    mouse_clear(mb_left);
}
