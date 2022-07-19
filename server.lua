

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        for k, playerId in pairs(GetPlayers()) do
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local item = xPlayer.getInventoryItem(Config.Item)
    local job = xPlayer.job.name
    local name = xPlayer.getName()
    if job == Config.Policejob and item.count >= 1 and item ~= nil then
        local can = true
        TriggerClientEvent("policetracker:showblip", playerId, name, can)
    else
        local can = false
        TriggerClientEvent("policetracker:showblip", playerId, name, can)
    end
        end
    end
end)

