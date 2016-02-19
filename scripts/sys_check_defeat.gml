/*
 * sys_check_defeat()
 */
 
if (ENEMIES_FAILED >= DEFEAT_RULE){
    var win = instance_create(0,0,obj_round_over);
    win.victory = false;
    timeline_index = -1;
}
