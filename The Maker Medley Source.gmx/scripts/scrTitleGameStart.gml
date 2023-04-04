///scrTitleGameStart(action);

//Actions: 0 = Start a new game; 1 = Load an existing save; 2 = Check if the existing save is valid
var t_action = argument[0];
if (t_action == 0){
    room_goto(rMenu);
}else if (t_action == 1){ //only run if the save is valid
    scrLoadGame(true);
}else if (t_action == 2){
    scrSaveToWorkingDir();
    
    var t_savevalid = false; //does the save file exist?
    if (file_exists(global.saveWorkingPath + string(global.savenum)))  //check if the current save file exists
    {
        //load the save map
        var saveMap;
        
        if (global.extraSaveProtection) //use ds_map_secure function
        {
            saveMap = ds_map_secure_load(global.saveWorkingPath + string(global.savenum));
        }
        else    //use text file
        {
            var f = file_text_open_read(global.saveWorkingPath + string(global.savenum));
            if (f == -1){    //should never happen, but who knows?
                f = file_text_open_write(global.saveWorkingPath + string(global.savenum));
                file_text_close(f);
                f = file_text_open_read(global.saveWorkingPath + string(global.savenum));
            }
            
            saveMap = ds_map_create();
            ds_map_read(saveMap, base64_decode(file_text_read_string(f)));
            
            file_text_close(f);
        }
        
        if (saveMap == -1) //is the save file map valid?
        {
            t_savevalid = false;
        }
        file_delete(global.saveWorkingPath + string(global.savenum));
        
        //destroy the map
        ds_map_destroy(saveMap);
    }
    return t_savevalid;
}
