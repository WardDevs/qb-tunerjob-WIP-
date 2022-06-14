local QBCore = exports['qb-core']:GetCoreObject() -- Grabs our core object
local playerData = nil

RegisterServerEvent("qb-tunerjob:bill:player")
AddEventHandler("qb-tunerjob:bill:player", function(playerId, amount)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local fname = Player.PlayerData.charinfo.firstname
        local lname = Player.PlayerData.charinfo.lastname
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if xPlayer.PlayerData.job.name == 'tuner' then
            if billed ~= nil then
                if xplayer.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = xPlayer.PlayerData.job.name,
                            ['sender'] = xPlayer.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                        TriggerEvent("qb-log:server:CreateLog", "tuner", "Tuner Bill", "red", " | "..fname.." "..lname.." billed "..billed.." for"..amount.."$") 
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

RegisterServerEvent("qb-tunerjob:insure:veh")
AddEventHandler("qb-tunerjob:insure:veh", function(Plate, Model, Name)
    local Player = QBCore.Functions.GetPlayer(source)
    local fname = Player.PlayerData.charinfo.firstname
    local lname = Player.PlayerData.charinfo.lastname
    info = {
        plate = Plate,
        model = Model,
        name = Name,
    }
    if Player.Functions.AddItem("tunerinsurance", 1, false, info) then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["tunerinsurance"], "add")
        TriggerClientEvent('QBCore:Notify', source, 'Vehicle Insured', 'success')
        TriggerEvent("qb-log:server:CreateLog", "tuner", "Vehicle Insured", "green", " | "..fname.." "..lname.." Insured Model: "..Model.." With plate "..Plate.. " Name: "..Name)
        --[[ TriggerEvent("qb-log:server:CreateLog", "tuner", "Tuner Bill", "red", " | "..fname.." "..lname.." Created insurance" "Plate"..Plate.. "Model" ..Model.." Name" ..Name.. ) ]]
        
    end
    
end)