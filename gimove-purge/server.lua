function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterCommand("alert", function(source, args, rawCommand)
        CancelEvent()
        local msg = args[1]
        TriggerClientEvent("alert:Send", source, msg)
end, false)

RegisterServerEvent("alert:sv")
AddEventHandler("alert:sv", function (msg, msg2)
    TriggerClientEvent("SendAlert", -1, msg, msg2)
end)