///scrIsDebugVersion(version_name)
switch (argument[0]){
    case "0.4":
    case "0.8":
    case "0.9 debug":
        return true;
    break;
}
return false;
