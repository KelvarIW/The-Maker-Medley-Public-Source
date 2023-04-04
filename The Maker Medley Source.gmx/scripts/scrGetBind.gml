///scrGetBind(key, type, [default]);
//A merged script for scrGetKeybind() and scrGetControllerBind()

var _key = argument[0];

if (argument[1] == 1){
    if (argument_count > 2)
        return scrGetControllerBind(_key[1], argument[2]);
    else
        return scrGetControllerBind(_key[1]);
}else{
    if (argument_count > 2)
        return scrGetKeybind(_key[0], argument[2]);
    else
        return scrGetKeybind(_key[0]);
}
