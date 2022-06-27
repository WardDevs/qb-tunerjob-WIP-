local QBCore = exports['qb-core']:GetCoreObject() -- Grabs our core object
local playerData = nil


--Triggers

RegisterServerEvent("qb-tunerjob:bill:player")
AddEventHandler("qb-tunerjob:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local fname = biller.PlayerData.charinfo.firstname
        local lname = biller.PlayerData.charinfo.lastname
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'tuner' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
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


-----ITEMS


--========================================================== Turbo
RegisterNetEvent('qb-tunerjob:server:removeTurbo', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('turbo', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['turbo'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Turbo has been installed", 'success')
end)

QBCore.Functions.CreateUseableItem("turbo", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent("qb-tunerjob:client:applyTurbo", source) 
end)

--========================================================== Headlights
RegisterNetEvent('qb-tunerjob:server:removeXenon', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('headlights', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['headlights'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Xenon Headlights Installed", 'success')
end)

QBCore.Functions.CreateUseableItem("headlights", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent("qb-tunerjob:client:applyXenons", source)
end)

QBCore.Functions.CreateUseableItem("hid_controller", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:xenonMenu', source)
end)

--========================================================== Tire Repair
QBCore.Functions.CreateUseableItem("tire", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:replacePoppedTire', source) 
end)

RegisterNetEvent('qb-tunerjob:server:removeTire', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('tire', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tire'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Tire replaced", 'success')
end)

--========================================================== suspension

QBCore.Functions.CreateUseableItem("coilovers", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:coiloverMenu', source)
end)

--========================================================== Neons

QBCore.Functions.CreateUseableItem("underglow_controller", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:openNeonMenu', source)
end)

--========================================================== Windowtint

QBCore.Functions.CreateUseableItem("tint_supplies", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:openWindowTintMenu', source)
end)

RegisterNetEvent('qb-tunerjob:server:removeTintSupplies', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('tint_supplies', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tint_supplies'], "remove", 1)
end)

QBCore.Functions.CreateUseableItem("obd_scanner", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('qb-tunerjob:client:checkVehicleModsWorkStation', source)
end)
