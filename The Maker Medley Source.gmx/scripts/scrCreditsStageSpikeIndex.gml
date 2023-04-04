///scrCreditsStageSpikeIndex(stage)
var _stage = argument[0];
var _spikeIndex = 0;
switch(_stage){
    case 0:
    case 2:
    case 6:
    case 14:
    case 15:
        _spikeIndex = 0;
        break;
    case 1:
    case 3:
    case 7:
        _spikeIndex = 2;
        break;
    case 4:
        _spikeIndex = 9;
        break;
    case 5:
        _spikeIndex = 7;
        break;
    case 8:
        _spikeIndex = 4;
        break;
    case 9:
    case 12:
        _spikeIndex = 11;
        break;
    case 10:
        _spikeIndex = 3;
        break;
    case 11:
        _spikeIndex = 12;
        break;
    case 13:
        _spikeIndex = 5;
        break;
    case 16: //UNUSED
        _spikeIndex = 6;
        break;
    case 17:
        _spikeIndex = 13;
        break;
}
return (_spikeIndex);
