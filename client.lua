
  TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)


RegisterNetEvent('policetracker:showblip')
AddEventHandler('policetracker:showblip', function(name, can)
  if can then
    --print("bb")
        local name = namee or 'Default Blip'
        local marker = GetEntityCoords(PlayerPedId())
        local blip = AddBlipForCoord(marker)
        SetBlipSprite (blip, Config.BlipID)
        SetBlipScale  (blip, Config.BlipSize)
        SetBlipDisplay(blip, 4)
        SetBlipColour (blip, Config.BlipColorID)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING') 
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)
        Citizen.Wait(100)
        RemoveBlip(blip)
  else
    --print("aa")
RemoveBlip(blip)
  end
end)
