/*
 * sys_init()
 */

SCREEN_WIDTH = 320;
SCREEN_HEIGHT = 240;

WINDOW_WIDTH = 640;
WINDOW_HEIGHT = 480;

BASE_HEIGHT = 300;

FOV = degtorad(60);
RAY_VAR = degtorad(60 / SCREEN_WIDTH);

TEXTURE_WIDTH = 64;
TEXTURE_HEIGHT = 64;

INSTANCE_SIZE = 0.3;

for (var i=0;i<2;i++){
    WEAPONS[i, 0] = false;
    WEAPONS[i, 1] = 0;
}

WEAPON_SELECTED = 0;
WEAPONS[WEAPON_SELECTED, 0] = true;
WEAPONS[WEAPON_SELECTED, 1] = 30;

MONEY = 1000;

SYSTEM_MESSAGE[0] = "";
SYSTEM_MESSAGE[1] = c_white;
SYSTEM_MESSAGE[2] = 0;
SYSTEM_MESSAGE[3] = 0;

TOWERS_AVAILABLES = 2;
TOWER_SELECTED = -1;

LEVEL = 1;
ENEMIES = 25;
ENEMIES_SCORE = 0;
ENEMIES_FAILED = 0;
DEFEAT_RULE = 0;
START_WAVE = false;
ROUND_TIME_PLAYED = 0;

map = -1;
motionMap = -1;
player = -1;
objects = -1;
enemies = -1;
switches = -1;
tower_areas = -1;
enemy_areas = -1;
target_area = -1;
visible_instances = ds_list_create();
load_level = -1;

surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);

LEVEL_WIDTH = 0;
LEVEL_HEIGHT = 0;
mini_map = -1;

stripes[0] = 0;
depths[0] = 0;
for (var i=0;i<SCREEN_WIDTH;i++){
    stripes[i, S_TEXTURE] = noone;
    stripes[i, S_TEX_LEFT] = 0;
    stripes[i, S_TOP] = 0;
    stripes[i, S_HEIGHT] = SCREEN_HEIGHT;
    
    depths[i] = 0;
}

for (var i=0;i<5;i++){
    LEVELS[i] = false;
}

LEVELS[0] = true;
