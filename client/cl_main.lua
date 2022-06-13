local QBCore = exports['qb-core']:GetCoreObject() -- We've ALWAYS got to grab our core object
local onDuty = false
PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "tuner" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) -- When a player swaps jobs, it will grab the players new job
	PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function() -- This is ran when the player leaves the server
    PlayerData = {}-- Clearing out any stored memory
end)


RegisterNetEvent("qb-tunerjob:toggleDuty")
AddEventHandler("qb-tunerjob:toggleDuty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


RegisterNetEvent("qb-tunerjob:tunerStash", function()
    TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
        maxweight = 4000000,
        slots = 40,
    })
end)

RegisterNetEvent('qb-tunerjob:tunershop', function ()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "tuner", Config.Items)
end)