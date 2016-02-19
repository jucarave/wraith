/*
 * sys_draw_objects()
 */
 
var len = ds_list_size(visible_instances);

var tw = obj_system.TEXTURE_WIDTH;
var th = obj_system.TEXTURE_HEIGHT;

for (i=0;i<len;i++){
    ins = ds_list_find_value(visible_instances, i);
    if (ins.sprite_index == -1) continue;
    
    var c = ins.image_blend;
    
    /*if (!ins.bright){
        var fog = max(10.0 - ins.dist, 0.0) / 10.0;
        var c = $ffffff;
        if (fog == 0.0){ c = $000000; }else
        { fog = 255 * fog; c = make_color_rgb(fog, fog, fog); }
    }*/
    
    var scale = ins.image_xscale;
    var left = floor(ins.screen_x + (ins.left - tw / 2) * scale);
    var top = floor(120 - (th / 2) * scale);
    
    var r = ins.right;
    if (r >= TEXTURE_WIDTH) r = TEXTURE_WIDTH;
    
    draw_sprite_part_ext(
        ins.sprite_index, ins.image_index, 
        ins.left, 0, r, th,
        left, top,
        scale, scale, 
        c, ins.image_alpha
    );
    
    if (ins.object_index == obj_enemy){
        var hp = ins.hp / ins.mHp;
        
        draw_set_color(c_green);
        draw_rectangle(left, top, left + TEXTURE_WIDTH * scale * hp, top + 3 * scale, false);
        
        draw_set_color(c_black);
        draw_rectangle(left, top, left + TEXTURE_WIDTH * scale, top + 3 * scale, true);
        
        draw_set_color(c_white);
    }else if (ins.object_index == obj_tower && ins.progress < ins.progress_max){
        var p = ins.progress / ins.progress_max;
        var t = floor(top + 10 * scale);
        var b = floor(top + 13 * scale);
        
        draw_set_color(ins.progress_col);
        draw_rectangle(left, t, left + TEXTURE_WIDTH * scale * p, b, false);
        
        draw_set_color(c_black);
        draw_rectangle(left, t, left + TEXTURE_WIDTH * scale, b, true);
        
        draw_set_color(c_white);
    }
}
