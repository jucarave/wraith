/*
 * sys_get_weapon_name(weaponIndex)
 */
 
switch (argument[0]){
    case 0:
        return "Handgun";
        break;
    
    case 1:
        return "Submachine";
        break;
    
    default:
        return "Invalid weapon"
}
