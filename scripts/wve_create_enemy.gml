/*
 * wve_create_enemy(x, y, enemyType, path)
 */

var _x = argument[0];
var _y = argument[1];
var path = argument[3];

//var enemy = instance_create(_x, _y, obj_enemy);
var enemy;
for (var i=0;i<ENEMIES;i++){
    var ins = enemies[i];
    if (!ins.active){ enemy = ins; }
}

enemy.x = _x;
enemy.y = _y;
enemy.path_ind = 0;
enemy.active = true;
enemy.path = path;

switch (argument[2]){
    case E_DOG:
        wve_set_enemy_properties(enemy, spr_dog, 15, 0.05, 4, 5);
        break;
    
    case E_GUARD:
        wve_set_enemy_properties(enemy, spr_guard, 30, 0.04, 5, 20);
        break;
        
    case E_SOLDIER:
        wve_set_enemy_properties(enemy, spr_soldier, 100, 0.05, 5, 50);
        break;
}

return enemy;
