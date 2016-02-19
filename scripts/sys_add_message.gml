/*
 * sys_add_message(message, color, time, priority)
 */
 
var msg = argument[0]; 
var col = argument[1];
var tim = argument[2];
var pri = argument[3];

with (obj_system){
    if (SYSTEM_MESSAGE[2] == 0 || pri >= SYSTEM_MESSAGE[3]){
        SYSTEM_MESSAGE[0] = msg;
        SYSTEM_MESSAGE[1] = col;
        SYSTEM_MESSAGE[2] = tim;
        SYSTEM_MESSAGE[3] = pri;
    }
}
