/*
 * sys_draw_mini_map()
 */
 
var gw = 3;
if (!surface_exists(mini_map)){
    mini_map = surface_create(LEVEL_WIDTH * gw, LEVEL_HEIGHT * gw);
    
    surface_set_target(mini_map);
    for (var _x=0;_x<LEVEL_WIDTH;_x++){
        for (var _y=0;_y<LEVEL_HEIGHT;_y++){
            if (map[_x, _y] > 0 && map[_x, _y] < 90){
                draw_rectangle(_x*gw,_y*gw, _x*gw+gw-1, _y*gw+gw-1, false);
            }
        }
    }
    
    surface_reset_target();
}

var w = WINDOW_WIDTH - (LEVEL_WIDTH * gw + 16);
draw_surface(mini_map, w, 48);

var len = array_length_1d(objects);
for (var i=0;i<len;i++){
    if (!instance_exists(objects[i])) continue;
    var ins = objects[i];
    
    var c = -1;
    if (ins.object_index == obj_particle){
        c = c_aqua;
    }else if (ins.object_index == obj_tower){
        c = c_green;
    }
    
    if (c != -1){
        var x1 = floor(w + (ins.x-0.5) * gw);
        var y1 = floor(48 + (ins.y-0.5) * gw);
        
        draw_set_color(c);
        draw_rectangle(x1, y1, x1+gw-1, y1+gw-1, false);
    }
}

var len = array_length_1d(enemies);
for (var i=0;i<len;i++){
    var ins = enemies[i];
    if (!ins.active) continue;
    
    var c = c_red;
    
    if (c != -1){
        var x1 = floor(w + (ins.x-0.5) * gw);
        var y1 = floor(48 + (ins.y-0.5) * gw);
        
        draw_set_color(c);
        draw_rectangle(x1, y1, x1+gw-1, y1+gw-1, false);
    }
}

var x1 = floor(w + (player.x-0.5) * gw);
var y1 = floor(48 + (player.y-0.5) * gw);

draw_set_color(c_yellow);
draw_rectangle(x1, y1, x1+gw-1, y1+gw-1, false);

var phantom = objects[0];
if (phantom.sprite_index != -1){
    var x1 = floor(w + (phantom.x-0.5) * gw);
    var y1 = floor(48 + (phantom.y-0.5) * gw);
    
    draw_set_color(c_green);
    draw_rectangle(x1, y1, x1+gw-1, y1+gw-1, false);
}

draw_set_color(c_white);
