/*
 * tw_select_tower(towerInd)
 */
 
var towerInd = argument[0];
with (obj_system){
    if (TOWER_SELECTED == towerInd){
        TOWER_SELECTED = -1;
        var phantom = objects[0];
        phantom.x = 0;
        phantom.y = 0;
        phantom.sprite_index = -1;
        exit;
    }

    var cost = TOWERS_DEF[towerInd, 1];
    if (MONEY < cost){
        sys_add_message("Not enough money!", $0000FF, 60, 2);
        audio_play_sound(snd_error, 0, false);
        return false;
    }
    
    TOWER_SELECTED = towerInd;
}
