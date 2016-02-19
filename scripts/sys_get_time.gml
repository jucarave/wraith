/*
 * sys_get_time(seconds)
 */
 
var time = argument[0];
var minutes = floor(time / 60);
var seconds = time mod 60;

if (minutes < 10){ 
    minutes = "0" + string(minutes);
}

if (seconds < 10){ 
    seconds = "0" + string(seconds);
}

return string(minutes) + ":" + string(seconds);
