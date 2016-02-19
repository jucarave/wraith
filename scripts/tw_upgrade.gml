/*
 * tw_upgrade(tower)
 */
 
var tower = argument[0];
if (tower.destroying){ exit; }
if (tower.progress != tower.progress_max){ exit; }

with (obj_system){
    var tower_ind = tower.tower_ind;
    
    if (!TOWERS_DEF[tower_ind, 7]){ exit; }
    var cost = TOWERS_DEF[tower_ind, 3];
    
    if (MONEY >= cost){
        MONEY -= cost;
        
        tower_ind += 3;
        tower.tower_ind = tower_ind;
        
        tower.after_build = TOWERS_DEF[tower_ind, 0];
        tower.sell_price = TOWERS_DEF[tower_ind, 1];
        tower.half_price = TOWERS_DEF[tower_ind, 2];
        tower.upgrade_price = TOWERS_DEF[tower_ind, 3];
        tower.max_distance = TOWERS_DEF[tower_ind, 4];
        tower.progress = 0;
        tower.progress_spd = TOWERS_DEF[tower_ind, 5];
        tower.fireRate = TOWERS_DEF[tower_ind, 6];
    
        sys_add_message("Tower updated!", $32FF32, 60, 2);
        audio_play_sound(snd_buying, 0, false);
        return true;
    }else{
        sys_add_message("Not enough money!", $0000FF, 60, 2);
        audio_play_sound(snd_error, 0, false);
        return true;
    }
}
