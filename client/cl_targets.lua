Citizen.CreateThread(function()

    exports['qb-target']:AddBoxZone("TunerBill", vector3(132.98, -3014.98, 7.68), 1.5, 1.5, {
        name="TunerBill",
        heading=0,
        debugPoly=true,
        minZ = 3.64,
        maxZ = 6.99,
    }, {
        options = {
            {
            event = "qb-tunerjob:bill",
            icon = "far fa-clipboard",
            label = "Bill a Player",
            job = "tuner",
            },
            {
                event = "qb-tunerjob:insurance",
                icon = "far fa-clipboard",
                label = "Insurance",
                job = "tuner",
                },
        },
        distance = 1.5    
    })

    exports['qb-target']:AddBoxZone("TunerDuty", vector3(125.48, -3007.08, 7.04), 1.9, 1.1, {
		name = "TunerDuty",
		heading = 270.11,
		debugPoly = true,
        minZ = 3.64,
        maxZ = 7.2,
	}, {
		options = {
		    {  
			event = "qb-tunerjob:client:toggleDuty",
			icon = "far fa-bell",
			label = "Service",
			job = "tuner",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("TunerStash", vector3(128.49, -3008.34, 7.04), 1.5, 1, {
		name = "TunerStash",
		heading = 261.95,
		debugPoly = true,
        minZ = 3.64,
        maxZ = 8.99,
	}, {
		options = {
		    {  
			event = "qb-tunerjob:client:tunerStash",
			icon = "far fa-bell",
			label = "Warehouse",
			job = "tuner",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("TunerShop", vector3(128.63, -3013.95, 6.64), 1.5, 1, {
		name = "TunerShop",
		heading = 261.95,
		debugPoly = true,
        minZ = 3.64,
        maxZ = 8.99,
	}, {
		options = {
		    {  
			event = "qb-tunerjob:client:tunershop",
			icon = "far fa-bell",
			label = "Shop",
			job = "tuner",
		    },
		},
		distance = 1.5
	})

    exports['qb-target']:AddBoxZone("TunerClothing", vector3(154.5, -3011.32, 7.04), 2.2, 0.6, {
        name="TunerClothing",
        heading=0,
        debugPoly=false,
        minZ = 6.04,
        maxZ = 8.44,
        }, {
            options = {
                {
                    type = "client",
                    event = "rl-outfits-ido:client:forceUI",
                    icon = "fas fa-box",
                    label = "Outfits",
                    job = "tuner",
                }, 
                {
                    type = "client",
                    event = "clothingMenuThanks",
                    icon = "fas fa-box",
                    label = "Clothing Store",
                    job = "tuner",
                }, 
        },
            distance = 3.5
    })
end)


RegisterNetEvent("qb-tunerjob:bill")
AddEventHandler("qb-tunerjob:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-tunerjob:bill:player", bill.citizenid, bill.billprice)
    end
end)

RegisterNetEvent("qb-tunerjob:insurance")
AddEventHandler("qb-tunerjob:insurance", function()
    local insurance = exports['qb-input']:ShowInput({
        header = "Create Insurance",
		submitText = "Insurance",
        inputs = {
            {
                text = "Plate",
				name = "vehplatetuner", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Model", -- text you want to be displayed as a place holder
                name = "vehmodeltuner", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Name", -- text you want to be displayed as a place holder
                name = "nametuner", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if insurance ~= nil then
        if insurance.vehplatetuner == nil or insurance.vehmodeltuner == nil or insurance.nametuner == nil then 
            return 
        end
        TriggerServerEvent("qb-tunerjob:insure:veh", insurance.vehplatetuner, insurance.vehmodeltuner, insurance.nametuner)
    end
end)