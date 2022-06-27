
local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('qb-tunerjob:client:applyTurbo', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot Install while inside vehicle", "error", 3500)
        ClearPedTasks(playerPed)
        return
    end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
			local plate = GetVehicleNumberPlateText(vehicle)
			if Config.isVehicleOwned then
				QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
					if owned then
						playAnim("mini@repair", "fixing_a_ped", 35000)
						SetVehicleEngineOn(vehicle, false, false, true)
						SetVehicleDoorOpen(vehicle, 4, false, false)
						if Config.skillbarTurbo == "reload-skillbar" then
							local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
							if finished ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
								if finished2 ~= 100 then
									QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
									ClearPedTasks(playerPed)
								else
									local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
									if finished3 ~= 100 then
										QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
										ClearPedTasks(playerPed)
									else
										QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
										FreezeEntityPosition(playerPed, true)
										time = math.random(7000,10000)
										TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
										Wait(time)
										SetVehicleModKit(vehicle, 0)
										ToggleVehicleMod(vehicle, 18, true)
										SetVehicleDoorShut(vehicle, 4, false)
										ClearPedTasks(playerPed)
										FreezeEntityPosition(playerPed, false)
										SetVehicleEngineOn(vehicle, true, true)
										CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
										TriggerServerEvent('updateVehicle', CurrentVehicleData)
										TriggerServerEvent('qb-tunerjob:server:removeTurbo')
									end
								end
							end
						elseif Config.skillbarTurbo == "np-skillbar" then
							local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
							if finished ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeTurbo')
							end
						elseif Config.skillbarTurbo == "qb-skillbar" then
							local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
							Skillbar.Start({
								duration = math.random(2500,5000),
								pos = math.random(10, 30),
								width = math.random(10, 20),
							}, function()
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeTurbo')
							end, function()
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							end)
						end
					else
						QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
					end
				end, plate)
			else
				playAnim("mini@repair", "fixing_a_ped", 35000)
				SetVehicleEngineOn(vehicle, false, false, true)
				SetVehicleDoorOpen(vehicle, 4, false, false)
				if Config.skillbarTurbo == "reload-skillbar" then
					local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
					if finished ~= 100 then
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
						if finished2 ~= 100 then
							QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
							ClearPedTasks(playerPed)
						else
							local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
							if finished3 ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeTurbo')
							end
						end
					end
				elseif Config.skillbarTurbo == "np-skillbar" then
					local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
					if finished ~= 100 then
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(7000,10000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 18, true)
						SetVehicleDoorShut(vehicle, 4, false)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						SetVehicleEngineOn(vehicle, true, true)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('qb-tunerjob:server:removeTurbo')
					end
				elseif Config.skillbarTurbo == "qb-skillbar" then
					local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
					Skillbar.Start({
						duration = math.random(2500,5000),
						pos = math.random(10, 30),
						width = math.random(10, 20),
					}, function()
						QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(7000,10000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 18, true)
						SetVehicleDoorShut(vehicle, 4, false)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						SetVehicleEngineOn(vehicle, true, true)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('qb-tunerjob:server:removeTurbo')
					end, function()
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					end)
				end
			end
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

RegisterNetEvent('qb-tunerjob:client:openNeonMenu', function()
    local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed)
        local plate = GetVehicleNumberPlateText(vehicle)
        if Config.isVehicleOwned then
            QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                if owned then
                    TriggerEvent("qb-tunerjob:client:neonMenu")
                else
                    QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                end
            end, plate)
        else
            TriggerEvent("qb-tunerjob:client:neonMenu")
        end
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error", 3500)
    end
end)

RegisterNetEvent('qb-tunerjob:client:applyNeonPostion', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("qb-tunerjob:client:neonToggleMenu")
	if args == 1 then 
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
    elseif args == 2 then 
        SetVehicleNeonLightEnabled(vehicle, 0, false)
        SetVehicleNeonLightEnabled(vehicle, 1, false)
        SetVehicleNeonLightEnabled(vehicle, 2, false)
        SetVehicleNeonLightEnabled(vehicle, 3, false)
    end
end)

RegisterNetEvent('qb-tunerjob:client:applyNeonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("qb-tunerjob:client:neonColorMenu")
	if args == 1 then 
        SetVehicleNeonLightsColour(vehicle, 222, 222, 255)
    elseif args == 2 then 
        SetVehicleNeonLightsColour(vehicle, 2, 21, 255)
    elseif args == 3 then 
        SetVehicleNeonLightsColour(vehicle, 3, 83, 255)
    elseif args == 4 then 
        SetVehicleNeonLightsColour(vehicle, 0, 255, 140)
    elseif args == 5 then 
        SetVehicleNeonLightsColour(vehicle, 94,	255, 1)
    elseif args == 6 then 
        SetVehicleNeonLightsColour(vehicle, 255, 255, 0)
    elseif args == 7 then 
        SetVehicleNeonLightsColour(vehicle, 255, 150, 0)
    elseif args == 8 then 
        SetVehicleNeonLightsColour(vehicle, 255, 62, 0)
    elseif args == 9 then 
        SetVehicleNeonLightsColour(vehicle, 255, 1, 1)
    elseif args == 10 then 
        SetVehicleNeonLightsColour(vehicle, 255, 50, 100)
    elseif args == 11 then 
        SetVehicleNeonLightsColour(vehicle, 255, 5, 190)
    elseif args == 12 then 
        SetVehicleNeonLightsColour(vehicle, 35,	1, 255) 
    elseif args == 13 then 
        SetVehicleNeonLightsColour(vehicle, 15, 3, 255)     
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('qb-tunerjob:client:neonMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "adjust vehicle underglow",
            isMenuHeader = true
        },
        {
            header = "Toggle Neon",
            txt = "",
            params = {
                event = "qb-tunerjob:client:neonToggleMenu",
            }
        },
        {
            header = "Change Color",
            txt = "",
            params = {
                event = "qb-tunerjob:client:neonColorMenu",
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 14
            }
        },
    })
end)

RegisterNetEvent('qb-tunerjob:client:neonToggleMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "toggle underglow on/off",
            isMenuHeader = true
        },
        {
            header = "Turn On",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonPostion",
                args = 1
            }
        },
        {
            header = "Turn Off",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonPostion",
                args = 2
            }
        },
        {
            header = "< return",
            txt = "",
            params = {
                event = "qb-tunerjob:client:neonMenu",
            }
        },
    })
end)

RegisterNetEvent('qb-tunerjob:client:neonColorMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "adjust underglow color",
            isMenuHeader = true
        },
        {
            header = "White",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 1
            }
        },
        {
            header = "Blue",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 2
            }
        },
        {
            header = "Electric Blue",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 3
            }
        },
        {
            header = "Mint Green",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 4
            }
        },
        {
            header = "Lime Green",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 5
            }
        },
        {
            header = "Yellow",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 6
            }
        },
        {
            header = "Golden Shower",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 7
            }
        },
        {
            header = "Orange",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 8
            }
        },
        {
            header = "Red",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 9
            }
        },
        {
            header = "Pony Pink",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 10
            }
        },
        {
            header = "Hot Pink",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 11
            }
        },
        {
            header = "Purple",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 12
            }
        },
        {
            header = "Blacklight",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyNeonColor",
                args = 13
            }
        },
        {
            header = "< return",
            txt = "",
            params = {
                event = "qb-tunerjob:client:neonMenu",
            }
        },
    })
end)

local windows = {
    "windscreen",
    "windscreen_r",
    "window_lf",
    "window_rf",
    "window_lr",
    "window_rr",
    "window_lm",
    "window_rm",
}
exports['qb-target']:AddTargetBone(windows, {
    options = {
        {
            event = "qb-tunerjob:client:openWindowTintMenu",
            icon = "fas fa-circle",
            label = "Apply window tint",
            item = 'tint_supplies',
        },
    },
    distance = 1.5
})

RegisterNetEvent('qb-tunerjob:client:openWindowTintMenu', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot Install while inside vehicle", "error", 3500)
        return
    end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
            if Config.isVehicleOwned then
                local plate = GetVehicleNumberPlateText(vehicle)
                QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                    if owned then
                        TriggerEvent("qb-tunerjob:client:windowTintMenu")
                    else
                        QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                    end
                end, plate)
            else
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
            end        
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

RegisterNetEvent('qb-tunerjob:client:applyTint', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
    local chance = math.random(0,100)
	if args == 1 then 
        if Config.skillbarRemoveTint == "reload-skillbar" then
            local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
            if finished ~= 100 then
                ClearPedTasks(playerPed)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            else
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end
        elseif Config.skillbarRemoveTint == "np-skillbar" then
            local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
            if finished ~= 100 then
                ClearPedTasks(playerPed)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            else
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end
        elseif Config.skillbarRemoveTint == "qb-skillbar" then
            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
            Skillbar.Start({
                duration = math.random(2500,5000),
                pos = math.random(10, 30),
                width = math.random(10, 20),
            }, function()
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end, function()
                ClearPedTasks(playerPed)
                TriggerEvent("qb-tunerjob:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            end)
        end
    elseif args == 2 then 
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 1% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
            if chance <= 50 then
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 1)
                TriggerServerEvent('qb-tunerjob:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 1% tint", "success", 3500)
            else
                QBCore.Functions.Notify("Failed to apply 1% tint, Try again", "error", 3500)
                TriggerEvent("qb-tunerjob:client:windowTintList")
			end
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 3 then
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 5% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
            if chance <= 50 then
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 2)
                TriggerServerEvent('qb-tunerjob:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 5% tint", "success", 3500)
            else
                QBCore.Functions.Notify("Failed to apply 5% tint, Try again", "error", 3500)
                TriggerEvent("qb-tunerjob:client:windowTintList")
			end
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 4 then 
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 15% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
            if chance <= 50 then
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 3)
                TriggerServerEvent('qb-tunerjob:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 15% tint", "success", 3500)
            else
                QBCore.Functions.Notify("Failed to apply 15% tint, Try again", "error", 3500)
                TriggerEvent("qb-tunerjob:client:windowTintList")
			end
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 5 then
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 25% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
            if chance <= 50 then
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 5)
                TriggerServerEvent('qb-tunerjob:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 25% tint", "success", 3500)
            else
                QBCore.Functions.Notify("Failed to apply 25% tint, Try again", "error", 3500)
                TriggerEvent("qb-tunerjob:client:windowTintList")
			end
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('qb-tunerjob:client:windowTintMenu', function()
    local playerPed	= PlayerPedId()
    ClearPedTasks(playerPed)
    exports['qb-menu']:openMenu({
		{
            header = "Window Tinting",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Window Tint",
            txt = "view available window tints",
            params = {
                event = "qb-tunerjob:client:windowTintList",
            }
        },
        {
            header = "Remove Tint",
            txt = "Remove current tint",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 1
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 6
            }
        },
    })
end)

RegisterNetEvent('qb-tunerjob:client:windowTintList', function()
    exports['qb-menu']:openMenu({
		{
            header = "Window Tint",
            txt = "apply vehicle tint",
            isMenuHeader = true
        },
        {
            header = "1% Tint",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 2
            }
        },
        {
            header = "5% Tint",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 3
            }
        },
        {
            header = "15% Tint",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 4
            }
        },
        {
            header = "25% Tint",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyTint",
                args = 5
            }
        },
        {
            header = "< Return",
            txt = "",
            params = {
                event = "qb-tunerjob:client:windowTintMenu",
            }
        },
    })
end)


RegisterNetEvent('qb-tunerjob:client:applyXenons', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot Install while inside vehicle", "error", 3500)
        ClearPedTasks(playerPed)
        return
    end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
			if Config.isVehicleOwned then
				local plate = GetVehicleNumberPlateText(vehicle)
				QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
					if owned then
						playAnim("mini@repair", "fixing_a_ped", 35000)
						if Config.skillbarXenons == "reload-skillbar" then
							local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
							if finished ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
								if finished2 ~= 100 then
									QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
									ClearPedTasks(playerPed)
								else
									local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
									if finished3 ~= 100 then
										QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
										ClearPedTasks(playerPed)
									else
										QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
										FreezeEntityPosition(playerPed, true)
										time = math.random(3000,7000)
										TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
										Wait(time)
										SetVehicleModKit(vehicle, 0)
										ToggleVehicleMod(vehicle, 22, true)
										ClearPedTasks(playerPed)
										FreezeEntityPosition(playerPed, false)
										CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
										TriggerServerEvent('updateVehicle', CurrentVehicleData)
										TriggerServerEvent('qb-tunerjob:server:removeXenon')
									end
								end
							end
						elseif Config.skillbarXenons == "np-skillbar" then
							local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
							if finished ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeXenon')
							end
						elseif Config.skillbarXenons == "qb-skillbar" then
							local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
							Skillbar.Start({
								duration = math.random(2500,5000),
								pos = math.random(10, 30),
								width = math.random(10, 20),
							}, function()
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeXenon')
							end, function()
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							end)
						end
					else
						QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
					end
				end, plate)
			else
				playAnim("mini@repair", "fixing_a_ped", 35000)
				if Config.skillbarXenons == "reload-skillbar" then
					local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
					if finished ~= 100 then
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
						if finished2 ~= 100 then
							QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
							ClearPedTasks(playerPed)
						else
							local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
							if finished3 ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('qb-tunerjob:server:removeXenon')
							end
						end
					end
				elseif Config.skillbarXenons == "np-skillbar" then
					local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
					if finished ~= 100 then
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(3000,7000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 22, true)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('qb-tunerjob:server:removeXenon')
					end
				elseif Config.skillbarXenons == "qb-skillbar" then
					local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
					Skillbar.Start({
						duration = math.random(2500,5000),
						pos = math.random(10, 30),
						width = math.random(10, 20),
					}, function()
						QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(3000,7000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 22, true)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('qb-tunerjob:server:removeXenon')
					end, function()
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					end)
				end
			end
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

RegisterNetEvent('qb-tunerjob:client:xenonMenu', function()
	local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		local plate = GetVehicleNumberPlateText(vehicle)
		if Config.isVehicleOwned then
			QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
				if owned then
					xenonControllerMenu()
				else
					QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
				end
			end, plate)
		else
			xenonControllerMenu()
		end
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error", 3500)
    end
end)

RegisterNetEvent('qb-tunerjob:client:applyXenonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
    xenonControllerMenu()
	if args == 1 then 
		SetVehicleHeadlightsColour(vehicle, 0)
    elseif args == 2 then 
		SetVehicleHeadlightsColour(vehicle, -1)      
    elseif args == 3 then 
		SetVehicleHeadlightsColour(vehicle, 1)    
    elseif args == 4 then 
		SetVehicleHeadlightsColour(vehicle, 2)    
    elseif args == 5 then
		SetVehicleHeadlightsColour(vehicle, 3)
	elseif args == 6 then
		SetVehicleHeadlightsColour(vehicle, 4)    
	elseif args == 7 then
		SetVehicleHeadlightsColour(vehicle, 5)    
	elseif args == 8 then
		SetVehicleHeadlightsColour(vehicle, 6)    
	elseif args == 9 then
		SetVehicleHeadlightsColour(vehicle, 7)    
	elseif args == 10 then
		SetVehicleHeadlightsColour(vehicle, 8)    
	elseif args == 11 then
		SetVehicleHeadlightsColour(vehicle, 9)   
	elseif args == 12 then
		SetVehicleHeadlightsColour(vehicle, 10)    
	elseif args == 13 then
		SetVehicleHeadlightsColour(vehicle, 11)    
	elseif args == 14 then
		SetVehicleHeadlightsColour(vehicle, 12)    
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

function xenonControllerMenu()
    exports['qb-menu']:openMenu({
		{
            header = "Xenon Menu",
            txt = "adjust vehicle headlight color",
            isMenuHeader = true
        },
		{
            header = "Stock",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 1
            }
        },
        {
            header = "Ice blue",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 2
            }
        },
		{
            header = "Blue",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 3
            }
        },
		{
            header = "Electric Blue",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 4
            }
        },
		{
            header = "Mint Green",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 5
            }
        },
		{
            header = "Lime Green",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 6
            }
        },
		{
            header = "Yellow",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 7
            }
        },
		{
            header = "Golden",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 8
            }
        },
		{
            header = "Orange",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 9
            }
        },
		{
            header = "Red",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 10
            }
        },
		{
            header = "Pony Pink ",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 11
            }
        },
		{
            header = "Hot Pink",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 12
            }
        },
		{
            header = "Purple",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 13
            }
        },
		{
            header = "Blacklight",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 14
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-tunerjob:client:applyXenonColor",
				args = 15
            }
        },
    })
end