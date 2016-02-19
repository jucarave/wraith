/*
 * sys_draw_hud()
 */
 
draw_set_font(font);

draw_text(16,16, "$ " + string(MONEY));
draw_text(16,32, "AMMO: " + string(WEAPONS[WEAPON_SELECTED, 1]));
draw_text(16,48, "ENEMIES: " + string(ENEMIES_SCORE) + " / " + string(ENEMIES) );

draw_set_halign(fa_right);
draw_text(WINDOW_WIDTH - 16, 16, sys_get_time(ROUND_TIME_PLAYED));
sys_draw_mini_map();
draw_set_halign(fa_left);

var hw = WINDOW_WIDTH / 2;
var hh = WINDOW_HEIGHT;

if (SYSTEM_MESSAGE[2]-- > 0){
    draw_set_color($000000);
    draw_set_alpha(0.5);
    draw_rectangle(hw - 230, 56, hw + 230, 88, false);
    
    draw_set_halign(fa_center);
    draw_set_color(SYSTEM_MESSAGE[1]);
    draw_set_alpha(1);
    draw_text(hw, 64, SYSTEM_MESSAGE[0]);
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
}else{
    SYSTEM_MESSAGE[3] = 0;
}

if (!START_WAVE){
    draw_set_color($000000);
    draw_set_alpha(0.5);
    draw_rectangle(hw - 230, hh - 96, hw + 230, hh - 64, false);
    
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(hw, hh-88, "Press Space Bar to start the round");
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
}

for (var i=0;i<TOWERS_AVAILABLES;i++){
    draw_sprite(spr_ui_towers, i, 16 + 48 * i, WINDOW_HEIGHT - 48);
}
