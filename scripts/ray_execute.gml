/*
 * ray_execute()
 */
 
if (!player.moved) exit;

player.moved = false;
 
var px = player.x;
var py = player.y;
var dir = degtorad(player.direction);

var ray_dir = (dir + FOV / 2) mod (pi * 2);
var line;
var hh = SCREEN_HEIGHT / 2;

for (var _x=0;_x<SCREEN_WIDTH;_x++){
    hit = ray_trace(px, py, ray_dir);
    
    line = BASE_HEIGHT / hit[0];
    
    stripes[_x, S_TEXTURE] = hit[2];
    stripes[_x, S_TEX_LEFT] = hit[1];
    stripes[_x, S_TOP] = hh - line / 2;
    stripes[_x, S_HEIGHT] = line / TEXTURE_HEIGHT;
    
    depths[_x] = hit[0];
    
    ray_dir -= RAY_VAR;
}
