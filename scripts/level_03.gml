/*
 * world_create_test()
 */

var world;

world = " 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0," + 
        " 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4," +
        "90, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0,90," + 
        " 4, 4,90, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,90, 4, 4," + 
        " 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 4, 4, 4, 4, 4, 4, 4, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1," + 
        " 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1," + 
        " 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1," + 
        " 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0," + 
        " 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0," + 
        " 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 4, 4, 3, 3,90, 3, 3, 3, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0,90, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0," + 
        " 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,";

LEVEL_WIDTH = 17;
LEVEL_HEIGHT = 31;

map = world_parse(world, LEVEL_WIDTH, LEVEL_HEIGHT);
if (surface_exists(mini_map)){ surface_free(mini_map); }
mini_map = -1;

player = instance_create(8.5, 25.5, obj_player);
player.direction = 90;

var phantom = sys_create_object(0.0, 0.0, -1, false);
phantom.valid = false;
phantom.bright = true;
objects[0] = phantom;

objects[1] = sys_create_particle(1.5, 2.5, pth_scenario);
objects[2] = sys_create_particle(-7.5, 2.5, pth_scenario);
objects[3] = sys_create_particle(-15.5, 2.5, pth_scenario);
objects[4] = sys_create_particle(-23.5, 2.5, pth_scenario);
objects[5] = sys_create_particle(-31.5, 2.5, pth_scenario);

objects[6] = sys_create_particle(16.5, 2.5, pth_scenario_02);
objects[7] = sys_create_particle(24.5, 2.5, pth_scenario_02);
objects[8] = sys_create_particle(32.5, 2.5, pth_scenario_02);
objects[9] = sys_create_particle(40.5, 2.5, pth_scenario_02);
objects[10] = sys_create_particle(48.5, 2.5, pth_scenario_02);


switches[0] = sys_create_switch(11.0, 25.0, SW_WEAPON, sys_array(0, 100, 25));
switches[1] = sys_create_switch(6.0, 25.0, SW_WEAPON, sys_array(1, 30, 100));

tower_areas[0] = sys_rect(1.0, 4.0, 16.0, 23.0);

target_area = sys_array(5, 28);

enemy_areas[0, 0] = 2;
enemy_areas[0, 1] = 2;
enemy_areas[0, 2] = pth_scenario;

enemy_areas[1, 0] = 15;
enemy_areas[1, 1] = 2;
enemy_areas[1, 2] = pth_scenario_02;

motionMap = world_set_motion_map(map);
var len = array_height_2d(enemy_areas);
for (var i=0;i<len;i++){
    mp_grid_path(motionMap, enemy_areas[i, 2], enemy_areas[i, 0], enemy_areas[i, 1], target_area[0], target_area[1], false);
}

LEVEL = 3;
MONEY = 300;
ENEMIES = 170;
ENEMIES_SCORE = 0;
ENEMIES_FAILED = 0;
DEFEAT_RULE = 20;

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
