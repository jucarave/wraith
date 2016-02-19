/*
 * tw_create_tower(x, y, tower_ind)
 */
 
var _x = argument[0];
var _y = argument[1];
var tower_ind = argument[2];

var tower = instance_create(_x, _y, obj_tower);
tower.sprite_index = spr_building_tower;
tower.after_build = TOWERS_DEF[tower_ind, 0];
tower.solid = true;
tower.sell_price = TOWERS_DEF[tower_ind, 1];
tower.half_price = TOWERS_DEF[tower_ind, 2];
tower.upgrade_price = TOWERS_DEF[tower_ind, 3];
tower.max_distance = TOWERS_DEF[tower_ind, 4];
tower.progress_spd = TOWERS_DEF[tower_ind, 5];
tower.fireRate = TOWERS_DEF[tower_ind, 6];
tower.tower_ind = tower_ind;

return tower;
