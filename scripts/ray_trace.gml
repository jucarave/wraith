/*
 * ray_trace(px, py, ray_dir)
 */

var px = argument[0];
var py = argument[1];
var rd = argument[2];

var cd = cos(rd);
var sd = -sin(rd);
var td = tan(rd);

var ret, 
    rx, ry, 
    gx, gy, 
    h_dist, v_dist, 
    jx, jy, 
    htx, vtx, 
    tile, 
    h_tex, v_tex;

h_tex = noone;
v_tex = noone;

if (cd > 0){ 
    rx = floor(px + 1);
    jx = 1;
}else{
    rx = floor(px) - 0.001;
    jx = -1;
}

jy = -jx * td;
ry = py - (rx - px) * td;

var hit = false;
while (!hit){
    gx = floor(rx);
    gy = floor(ry);
    
    if (world_is_solid(gx, gy)){
        h_dist = point_distance(px, py, rx, ry);
        htx = (ry * TEXTURE_WIDTH) mod TEXTURE_WIDTH;
        tile = world_get_tile(gx, gy);
        if (tile != 90){
            hit = true;
            if (tile != noone){
                h_tex = WALLS[tile];
            }
            continue;
        }
    }
    
    rx += jx;
    ry += jy;
}



if (sd > 0){ 
    ry = floor(py + 1);
    jy = 1;
}else{
    ry = floor(py) - 0.001;
    jy = -1;
}

v_dist = h_dist + 10;

if (td != 0){
    jx = -jy / td;
    rx = px - (ry - py) / td;

    hit = false;
    while (!hit){
        gx = floor(rx);
        gy = floor(ry);
        
        if (world_is_solid(gx, gy)){
            v_dist = point_distance(px, py, rx, ry);
            vtx = (rx * TEXTURE_WIDTH) mod TEXTURE_WIDTH;
            tile = world_get_tile(gx, gy);
            if (tile != 90){ 
                hit = true;
                if (tile != noone){
                    v_tex = WALLS[tile];
                }
                continue;
            }
        }
        
        rx += jx;
        ry += jy;
    }
}



var dist = h_dist;
var tx = htx;
var tex = h_tex;
var ang_b = abs(angle_difference(degtorad(player.direction), rd));

if (v_dist < h_dist){
    dist = v_dist;
    tx = vtx;
    tex = v_tex;
}


ret[0] = dist * cos(ang_b);
ret[1] = tx;
ret[2] = tex;

return ret;
