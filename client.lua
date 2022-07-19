if Config.UseOldESX then
    Citizen.CreateThread(function()
        ESX = nil
        
        while ESX == nil do
            TriggerEvent(Config.ESXEvent, function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end
  




_menuPool = NativeUI.CreatePool()
local injob = false
local trailerneeded = true
function trailernotneeded()
	trailerneeded = false
end
local mainMenu
		local name = Config.Blipname or 'LKW-Station'
		
		local blip = AddBlipForCoord(Config.Blipcoord.x, Config.Blipcoord.y, Config.Blipcoord.z)
		SetBlipSprite (blip, Config.BlipID)
		SetBlipScale  (blip, 0.65)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.BlipColorID)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING') 
		AddTextComponentString(name)
		EndTextCommandSetBlipName(blip)

Citizen.CreateThread(function()
    while true do
        _menuPool:ProcessMenus()
        Citizen.Wait(0)
        local pedCoord = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(Config.Truckmenu.x, Config.Truckmenu.y, Config.Truckmenu.z, pedCoord) < 3.0 then
            ESX.ShowHelpNotification(Translation[Config.Locale]['notify'])
            if IsControlJustReleased(0, 38) then
                openMenu()
				end
            end
    end
end)

local truckerjobs
 
function openMenu() 
	local injob = false
	mainmenu = NativeUI.CreateMenu(Translation[Config.Locale]['MainMenuname'], Translation[Config.Locale]['MainMenuDesc'])
	_menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)
	local TruckerJobs = NativeUI.CreateItem(Translation[Config.Locale]['JobsItemName'], Translation[Config.Locale]['JobsItemDesc'])
	local Truckk = NativeUI.CreateItem(Translation[Config.Locale]['TruckItemName'], Translation[Config.Locale]['TruckItemDesc'])
	mainmenu:AddItem(TruckerJobs)
	mainmenu:AddItem(Truckk)
	
	Truckk.Activated = function(sender,index)
		if Config.Buyabletrucks then
		mainmenu:Visible(false)
		truckbuymenu()
		print("2")
		else
			Truck:Enabled(false)
		end
	end
	TruckerJobs.Activated = function(sender,index)
		mainmenu:Visible(false)
		ESX.TriggerServerCallback('truckerjob:xp', function(xp)
		truckjob(xp)
		end)
end


end

function truckbuymenu()
	--print("function")
		truckerjobs = NativeUI.CreateMenu(Translation[Config.Locale]['JobsMenuName'], Translation[Config.Locale]['JobsMenuDesc'])
		local del = NativeUI.CreateItem(Translation[Config.Locale]['Sold'], " ")
		_menuPool:Add(truckerjobs)
		_menuPool:RefreshIndex()
		_menuPool:MouseControlsEnabled(false)
		_menuPool:MouseEdgeEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
		truckerjobs:Visible(true)
for k, v in pairs(Config.Trucks) do
	local Truck = NativeUI.CreateItem(v.label, Translation[Config.Locale]['price'] .. " " .. v.price)
	truckerjobs:AddItem(Truck)
	ESX.TriggerServerCallback("truckerjob:truck", function(truck) 
		if truck == v.spawnname then
			Truck:Enabled(false)
		end
	end)
	Truck.Activated = function(sender,index)
TriggerServerEvent("truckjob:buytruck", v.spawnname, v.price, source)
end
end
truckerjobs:AddItem(del)
del.Activated = function(sender,index)
	TriggerServerEvent("truckjob:deletetruck")
end
end

function truckjob(xp)
	local exp = NativeUI.CreateItem(Translation[Config.Locale]['yourxp'] .. " " .. xp, "")
	truckerjobs = NativeUI.CreateMenu(Translation[Config.Locale]['JobsMenuName'], Translation[Config.Locale]['JobsMenuDesc'])
	_menuPool:Add(truckerjobs)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled(false)
	_menuPool:MouseEdgeEnabled(false)
	_menuPool:ControlDisablingEnabled(false)
	truckerjobs:AddItem(exp)
	exp:Enabled(false)
	
	if not injob then
		truckerjobs:Visible(true)
		if Config.Debug then
		print(injob)
		end
		else
			if Config.Debug then
			print("ye")
			print(injob)
			end
			if Config.SNZNotify then
				exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['not_allowed_in_job'], 5000, 'fas fa-inbox')
				elseif Config.CustomNotify then
					notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['not_allowed_in_job'])
				else
					ESX.ShowNotification(Translation[Config.Locale]['not_allowed_in_job'])
				end
		end
	for k, v in pairs(Config.Jobs) do
		if v.EXP ~= nil then
			if Config.Debug then
				print(v.EXP)
			end
		local Jobs = NativeUI.CreateItem(v.J, "Benötigte EXP:" .. v.EXP)
		truckerjobs:AddItem(Jobs)
		ESX.TriggerServerCallback('truckerjob:xp', function(xp)
			 if Config.Debug then print(xp) end
			if xp <= v.EXP then
				if Config.Debug then
					print(xp)
				print(v.EXP) 
			end
		Jobs:Enabled(false)
			end
		end)
		Jobs.Activated = function(sender,index)

			ESX.TriggerServerCallback('truckerjob:xp', function(xp)
				if Config.Debug then
			print(v.EXP)
			print(xp)
				end
		if xp >= v.EXP then
			injob = true
			if Config.Debug then
			print("hä?")
		end
		if Config.Debug then
			print(v.V)
			print(v.S)
			print(v.SH)
			print(v.S.x)
			print(v.S.y)
			print(v.S.z)
			end

			ESX.TriggerServerCallback('truckerjob:truck', function(truck)
				if truck ~= nil then
					ESX.Game.SpawnVehicle(truck, v.S, v.SH, function (vehicle)
						if Config.Debug then
						print(v.T)
						print(v.S)
						print(v.SH)
						print(v.S.x)
						print(v.S.y)
						print(v.S.z)
						print(vehicle)
						end
					end)
					else
				ESX.Game.SpawnVehicle(v.V, v.S, v.SH, function (vehicle)
					if Config.Debug then
					print(v.T)
					print(v.S)
					print(v.SH)
					print(v.S.x)
					print(v.S.y)
					print(v.S.z)
					end
				end)
			end
			end)
					
			ESX.Game.SpawnVehicle(v.T, v.TT, v.TH, function (trailer)
			 local finish = AddBlipForCoord(v.F.x, v.F.y, v.F.z)
			 SetBlipColour(finish, Config.BlipColor)
			 SetBlipRoute(finish, true)
			end)
			injob = true
			if Config.Debug then
			print(injob)
			end
			SetNewWaypoint(v.S.x, v.S.y)
			if Config.SNZNotify then
				exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['spawned'], 5000, 'fas fa-inbox')
				elseif Config.CustomNotify then
					notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['spawned'])
				else
					ESX.ShowNotification(Translation[Config.Locale]['spawned'])
				end
				if Config.Debug then
				print(v.F)
				end
			check(v.F, finish, vehicle, trailer, v.S, v.D, v.R)
			end
		end)
		end
		end
	end
end

--[[
RegisterNetEvent('truckjob:truckbought')
AddEventHandler('truckjob:truckbought', function(truck)
	if Config.SNZNotify then
		exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'],Translation[Config.Locale]['TruckBought'] .. " " .. truck .. Translation[Config.Locale]['TruckBought2']  .. price, 5000, 'fas fa-inbox')
		elseif Config.CustomNotify then
			notify(Translation[Config.Locale]['truckername'],Translation[Config.Locale]['TruckBought'] .. " " .. truck .. Translation[Config.Locale]['TruckBought2']  .. price)
		else
			ESX.ShowNotification(Translation[Config.Locale]['TruckBought'] .. " " .. truck .. Translation[Config.Locale]['TruckBought2']  .. price)
		end
end)


RegisterNetEvent('truckjob:truckboughtnotenoughmoney')
AddEventHandler('truckjob:truckboughtnotenoughmoney', function(source)
	if Config.SNZNotify then
		exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['NotEnoughMoney'], 5000, 'fas fa-inbox')
		elseif Config.CustomNotify then
			notify(Translation[Config.Locale]['truckername'],Translation[Config.Locale]['NotEnoughMoney'])
		else
			ESX.ShowNotification(Translation[Config.Locale]['NotEnoughMoney'])
		end
end)
]]

function check(finishcoords, finish, vehicle, trailer, endpos, difficulty, reward)
	local checkpoint = false
	local missionfailed = false
	checkpoint = false
	local trailerneeded = true
	trailerneeded = true
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local pedCoord = GetEntityCoords(PlayerPedId())
			local veh = GetVehiclePedIsIn(PlayerPedId())
			if GetDistanceBetweenCoords(finishcoords, pedCoord) < 10.0 and not checkpoint and IsVehicleAttachedToTrailer(veh) then
				if Config.SNZNotify then
				exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['checkpoint'], 5000, 'fas fa-inbox')
				elseif Config.CustomNotify then
					notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['checkpoint'])
				else
					ESX.ShowNotification(Translation[Config.Locale]['checkpoint'])
				end
				--Citizen.Wait(10000)
				ESX.Game.DeleteObject(trailer)
				RemoveBlip(finish)
				SetBlipRoute(finish, false)
				local endblip = AddBlipForCoord(endpos)
			 SetBlipColour(endblip, Config.BlipColor)
			 SetBlipRoute(endblip, true)
			 donee(vehicle, trailer, endpos, endblip, difficulty, reward)
			 checkpoint = true
			 trailernotneeded()
			elseif GetDistanceBetweenCoords(finishcoords, pedCoord) < 10.0 and not checkpoint and not IsVehicleAttachedToTrailer(veh) and not missionfailed then
				if Config.SNZNotify then
					exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['trailer_deleted'], 5000, 'fas fa-inbox')
					elseif Config.CustomNotify then
						notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['trailer_deleted'])
					else
						ESX.ShowNotification(Translation[Config.Locale]['trailer_deleted'])
					end
				Citizen.Wait(10000)
				DeleteVehicle(trailer)
				if Config.SNZNotify then
					exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['truck_deleted'], 5000, 'fas fa-inbox')
					elseif Config.CustomNotify then
						notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['truck_deleted'])
					else
						ESX.ShowNotification(Translation[Config.Locale]['truck_deleted'])
					end
				RemoveBlip(finish)
				SetBlipRoute(finish, false)
				Citizen.Wait(10000)
				local playerveh = GetVehiclePedIsIn(PlayerPedId())
				DeleteVehicle(playerveh)
				missionfailed = true
				injob = false
				if Config.Debug then
				print(missionfailed)
				end
			elseif Config.Debugg then
					if GetDistanceBetweenCoords(finishcoords, pedCoord) < 10.0 then
					print("distancecheck done")
					print(IsVehicleAttachedToTrailer(vehicle))
					print(missionfailed)
					print(checkpoint)
				end
				end

	end
		end)
		end

		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(50)
				if injob then
					truckerjobs:Visible(false)
					if Config.Debug and Config.Spam then
						print("injob yay! checking if trailer works")
					end
					if IsPedInAnyVehicle(PlayerPedId(), false) then
						local veh = GetVehiclePedIsIn(PlayerPedId())
						if not IsVehicleAttachedToTrailer(veh) and trailerneeded then
							if Config.Debug and Config.Spam then
							print(trailerneeded)
							end
							if Config.SNZNotify then
								exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['NoTrailerAttached'], 5000, 'fas fa-inbox')
								elseif Config.CustomNotify then
									notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['NoTrailerAttached'])
								else
									ESX.ShowNotification(Translation[Config.Locale]['NoTrailerAttached'])
								end
						end
					end
				end
			end
		end)

		function donee(vehicle, trailer, endpos, endblip, difficulty, reward)
			local donee = nil
			donee = false
		Citizen.CreateThread(function()
				while true do
					Citizen.Wait(10)
			local pedCoord = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(endpos, pedCoord) < 10.0 and not donee then
				donee = true
				if Config.SNZNotify then
					exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['finished'], 5000, 'fas fa-inbox')
					elseif Config.CustomNotify then
						notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['finished'])
					else
						ESX.ShowNotification(Translation[Config.Locale]['checkpoint'])
					end
			TriggerServerEvent("truckjob:receivemoney", reward)
			if Config.SNZNotify then
					exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['reward'] .. reward .. Config.Currency, 51000, 'fas fa-inbox')
					elseif Config.CustomNotify then
						notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['reward'] .. reward .. Config.Currency)
					else
						ESX.ShowNotification(Translation[Config.Locale]['reward'] .. reward .. Config.Currency)
					end
					if Config.SNZNotify then
						exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['Lease'] .. Config.LeasePrice .. Config.Currency, 51000, 'fas fa-inbox')
						elseif Config.CustomNotify then
							notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['Lease'] .. Config.LeasePrice .. Config.Currency)
						else
							ESX.ShowNotification(Translation[Config.Locale]['Lease'] .. Config.LeasePrice .. Config.Currency)
						end
			local pedCoord = GetEntityCoords(PlayerPedId())
			RemoveBlip(endblip)
				SetBlipRoute(endblip, false)
				if Config.SNZNotify then
					exports['SNZ_UI']:AddNotification(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['finished'], 5000, 'fas fa-inbox')
					elseif Config.CustomNotify then
						notify(Translation[Config.Locale]['truckername'], Translation[Config.Locale]['finished'])
					else
						ESX.ShowNotification(Translation[Config.Locale]['finished'])
					end
				ESX.TriggerServerCallback('truckerjob:xp', function(xp, difficulty, reward, donee)
				end)
				
				local pedCoord = GetEntityCoords(PlayerPedId())
				local pvehicle = GetVehiclePedIsIn(PlayerPedId())
				ESX.Game.DeleteVehicle(pvehicle)
				ESX.Game.DeleteVehicle(vehicle)
				ESX.Game.DeleteObject(trailer)
				RemoveBlip(endblip)
					SetBlipRoute(endblip, false)
					injob = false
					end
			end
		end)
		end

-- 200

-- 400


