/*
 * ray_cast_objects()
 */
 
var len = array_length_1d(objects);

var i, j, k, ins, dir, ang_b, fov, dist, sl, sw, tw, ls, added;
fov = radtodeg(FOV);
var l_ang = (player.direction + fov / 2);

tw = TEXTURE_WIDTH;

ds_list_clear(visible_instances);

for (k=0;k<2;k++){
    for (i=0;i<len;i++){
        if (k == 0){ 
            ins = objects[i]; 
            if (!instance_exists(ins)){ continue; }
        }else if (k == 1){ 
            ins = enemies[i]; 
            if (!ins.active) continue;
        }
        
        dir = point_direction(player.x,player.y,ins.x,ins.y);
        ang_b = abs(angle_difference(player.direction, dir));
        
        if (ang_b > fov){
            continue;
        }
        
        l_dif = angle_difference(l_ang, dir);
        dist = point_distance(player.x,player.y,ins.x,ins.y) * cos(degtorad(ang_b));
        
        if (dist == 0) continue;
        
        ins.screen_x = l_dif / fov * SCREEN_WIDTH;
        ins.image_xscale = (BASE_HEIGHT / dist) / TEXTURE_HEIGHT;
        ins.left = -1;
        ins.right = -1;
        ins.dist = dist;
        
        sl = floor(ins.screen_x - tw / 2 * ins.image_xscale);
        sw = floor(sl + tw * ins.image_xscale);
        
        for (j=sl;j<sw;j++){
            if (j < 0 || j >= SCREEN_WIDTH) continue;
            
            if (dist <= depths[j]){
                if (ins.left == -1){ ins.left = floor((j - sl) / ins.image_xscale); }
                ins.right = ceil((j - sl) / ins.image_xscale);
            }
        }
        
        if (ins.left != -1 && ins.right != ins.left){
            ls = ds_list_size(visible_instances);
            added = false;
            for (j=0;j<ls;j++){
                var prev_obj = ds_list_find_value(visible_instances, j);
                if (dist > prev_obj.dist){
                    ds_list_insert(visible_instances, j, ins);
                    added = true;
                    j = ls;
                }
            }
            
            if (!added){
                ds_list_add(visible_instances, ins);
            }
        }
    }
    
    len = array_length_1d(enemies);
}
