if Config.UseOldESX then
    local ESX = nil

    TriggerEvent(Config.ESXEvent, function(obj) 
        ESX = obj 
    end)
end

RegisterNetEvent('truckjob:receivemoney')
AddEventHandler('truckjob:receivemoney', function(reward)
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.addAccountMoney(money, reward)--als ob das so easy funktioniert#
end)




--RegisterNetEvent('truckjob:receiveexp')
--AddEventHandler('truckjob:receiveexp', function(difficulty)
--local _source = source
--local xPlayer = ESX.GetPlayerFromId(_source)
--    ---- print(playerId)
--    MySQL.Async.execute('SELECT * from users WHERE identifier = @identifier', {
--          ['@identifier'] = xPlayer.identifier,
--      },function(result)
--      if result then
--        for _, v in pairs(result) do
--           addexp(v.truckerexp, difficulty)
--        end
--      end
--    end)
--  end)
--
--  function addexp(truckerexp, difficulty)
--
--    if difficulty == "easy"
-- truckerexp = truckerexp + Config.Easy.reward
--  elseif difficulty == "normal"
--  truckerexp = truckerexp + Config.Normal.reward
--elseif difficulty == "hard"
--truckerexp = truckerexp + Config.Hard.reward
--end
--    MySQL.Async.transaction('UPDATE users SET truckerexp = truckerexp + truckerexp WHERE identifier = @identifier ', {
--        ['@identifier'] = xPlayer.identifier,
--        ['@truckerexp'] = truckerexp,
--
--    },function(result)
--        truckerexp = 0


ESX.RegisterServerCallback('truckerjob:xp', function(source, cb, difficulty, reward)
local ssource = source
    local xPlayer = ESX.GetPlayerFromId(ssource)
    ---- print(playerId)
    MySQL.Async.fetchAll('SELECT * from users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	},function(result)
      if result then
        for _, v in pairs(result) do
            -- print(v.truckerexp)
            cb(v.truckerexp)
            if reward ~= nil then
                xPlayer.addAccountMoney('money', reward)
                  end
            if difficulty == "easy" or "hard" or "normal" then
                addexp(v.truckerexp, difficulty, ssource)
            else
                -- print(difficulty)
            end
           --addexp(v.truckerexp, difficulty)
        end
    else
        -- print("NO EXP TABLE FOUND PLEASE ADD IT IN YOUR MYSQL!!")
      end

  
    end)
  end)

function addexp(truckerexp, difficulty, source)
    local ssource = source
    local xPlayer = ESX.GetPlayerFromId(ssource)
    -- print(xPlayer.identifier)
    -- print("addexp")
if difficulty == "easy" then
 truckerexp = truckerexp + Config.Easyreward
-- print("easy")
  elseif difficulty == "normal" then
  truckerexp = truckerexp + Config.Normalreward
  -- print("normal")
elseif difficulty == "hard" then
truckerexp = truckerexp + Config.Hardreward
 -- -- print("hard")
end
local ssource = source
local xPlayer = ESX.GetPlayerFromId(ssource)
    if Config.MYSQL == 'mysql-async' then
        MySQL.Async.execute('UPDATE users SET truckerexp = @truckerexp WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier,
        ['@truckerexp'] = truckerexp,
    },function()
        truckerexp = 0
    end)
    else

        exports.oxmysql:transaction('UPDATE users SET truckerexp = truckerexp + truckerexp WHERE (identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
            ['@truckerexp'] = truckerexp,
    
        },function(result)
            truckerexp = 0
        end)
    end
end



AddEventHandler("truckerjob:addexp", function(xp, difficulty)
addexp(xp, difficulty)
end)

