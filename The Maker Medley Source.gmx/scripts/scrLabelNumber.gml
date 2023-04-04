///scrLabelNumber(number, singular, [plural], [none]);
var _num = argument[0];
var _appendSingular = argument[1];
var _appendPlural = _appendSingular + "s";
if (argument_count > 2){
    _appendPlural = argument[2];
}
var _noneString = "";
if (argument_count > 3){
    _noneString = argument[3];
}

if (!is_string(_num)){_num = string(_num);}

if (_num == "1"){
    return (_num + " " + _appendSingular);
}else{
    if (_num == "0" && _noneString != ""){
        return (_noneString);
    }
    return (_num + " " + _appendPlural);
}
return ("");
