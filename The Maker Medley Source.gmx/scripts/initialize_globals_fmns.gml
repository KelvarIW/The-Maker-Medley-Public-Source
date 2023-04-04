///initialize_globals_fmns();
var _file = "";

if (os_type == os_windows)
    _file = "FileManager.dll";
else if (os_type == os_macosx)
    _file = "FileManager.dylib";
else if (os_type == os_linux)
    _file = "FileManager.so";

global.fmns = (file_exists(_file));
if (global.fmns){
    global.FMNS_file_copy = external_define(_file, "file_copy", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.FMNS_file_rename = external_define(_file, "file_rename", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.FMNS_file_exists = external_define(_file, "file_exists", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_file_delete = external_define(_file, "file_delete", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_directory_create = external_define(_file, "directory_create", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_directory_copy = external_define(_file, "directory_copy", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.FMNS_directory_rename = external_define(_file, "directory_rename", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.FMNS_directory_exists = external_define(_file, "directory_exists", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_directory_destroy = external_define(_file, "directory_destroy", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_set_working_directory = external_define(_file, "set_working_directory", dll_cdecl, ty_real, 1, ty_string);
    global.FMNS_get_working_directory = external_define(_file, "working_directory", dll_cdecl, ty_string, 0);
    global.FMNS_get_program_directory = external_define(_file, "program_directory", dll_cdecl, ty_string, 0);
}

global.programDir = "";
if (global.fmns){
    global.programDir = program_directory_fmns();
}else{
    global.programDir = game_save_id;
}

global.workingDir = game_save_id;  // The manual says not to do this but working_directory won't work
if (!is_string(global.workingDir) || global.workingDir == ""){  // prevent a crash
    global.workingDir = "%LOCALAPPDATA%/gamedir/The_Maker_Medley";
}
if (!is_string(global.programDir) || global.programDir == ""){  // prevent a crash
    global.programDir = "%LOCALAPPDATA%/gamedir/The_Maker_Medley";
}
