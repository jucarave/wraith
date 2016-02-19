/*
 * world_create_test()
 */

var world;

world = " 0, 0, 0, 0, 0, 4, 4, 4, 4, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 0, 4, 0, 0,90, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 3, 3,90, 3, 3, 3, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 5, 0, 0, 0, 0, 3, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 3, 4, 0, 0, 4, 3, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0," +
        " 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 0, 0, 0, 0," +
        " 1, 2, 1, 1, 2, 1, 0, 0, 1, 2, 1, 1, 2, 1," +
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," +
        " 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," +
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2," +
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," +
        " 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," +
        " 1, 1, 1,90, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1," +
        " 0, 0, 4, 0, 0, 0, 0,90, 0, 0, 0, 0, 0, 0," +
        " 0, 0, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,";

LEVEL_WIDTH = 14;
LEVEL_HEIGHT = 19;

map = world_parse(world, LEVEL_WIDTH, LEVEL_HEIGHT);
if (surface_exists(mini_map)){ surface_free(mini_map); }
mini_map = -1;

player = instance_create(6.5, 4.5, obj_player);
player.direction = 270;

var phantom = sys_create_object(0.0, 0.0, -1, false);
phantom.valid = false;
phantom.bright = true;
objects[0] = phantom;

objects[1] = sys_create_particle(6.5, 16.5, pth_scenario);
objects[2] = sys_create_particle(14.5, 16.5, pth_scenario);
objects[3] = sys_create_particle(22.5, 16.5, pth_scenario);

/*objects[4] = sys_create_object(6.5, 1.5, spr_column, true);

objects[5] = sys_create_object(3.5, 10.5, spr_column, true);
objects[6] = sys_create_object(11.5, 10.5, spr_column, true);*/


switches[0] = sys_create_switch(4.0, 4.0, SW_WEAPON, sys_array(0, 100, 25));
//switches[1] = sys_create_switch(8.0, 1.0, SW_WEAPON, sys_array(1, 30, 50));

tower_areas[0] = sys_rect(1.0, 10.0, 13.0, 15.0);

target_area = sys_array(8, 1);

enemy_areas[0, 0] = 6;
enemy_areas[0, 1] = 16;
enemy_areas[0, 2] = pth_scenario;

motionMap = world_set_motion_map(map);
var len = array_height_2d(enemy_areas);
for (var i=0;i<len;i++){
    mp_grid_path(motionMap, enemy_areas[i, 2], enemy_areas[i, 0], enemy_areas[i, 1], target_area[0], target_area[1], false);
}

LEVEL = 1;
MONEY = 175;
ENEMIES = 25;
ENEMIES_SCORE = 0;
ENEMIES_FAILED = 0;
DEFEAT_RULE = 3;

START_WAVE = false;
ROUND_TIME_PLAYED = 0;
alarm[0] = 30;

for (var i=0;i<ENEMIES;i++){
    var enemy = instance_create(0, 0, obj_enemy);
    enemy.active = false;
    
    enemies[i] = enemy;
}

for (var i=0;i<2;i++){
    WEAPONS[i, 0] = false;
}

WEAPON_SELECTED = 0;
WEAPONS[WEAPON_SELECTED, 0] = true;
WEAPONS[WEAPON_SELECTED, 1] = 100;


wve_create();
