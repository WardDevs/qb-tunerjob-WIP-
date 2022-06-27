Config = {}

Config.Job = 'tuner'

--qb-skillbar np-skillbar reload-skillbar

Config.skillbarTurbo        = "qb-skillbar" 
Config.skillbarXenons       = "qb-skillbar" 
Config.skillbarRemoveTint   = "qb-skillbar"

Config.checkTunesMessage = "phone"

Config.minigame = {
    correctBlocks = 3,    -- Number of correct blocks the player needs to click
    incorrectBlocks = 3,  -- Number of incorrect blocks after which the game will fail
    timetoShow = 3,       -- Time in secs for which the right blocks will be shown
    timetoLose = 10,      -- Maximum time after timetoshow expires for player to select the right blocks
}

Config.isVehicleOwned = false                    --  [true or false] checks if the vehicle is owned

Config.Items = {
label = "Tuner Shop",
    slots = 14,
    items = {
        [1] = {
            name = "turbo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "headlights",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "coilovers",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "coilover_wrenches",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "hid_controller",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "underglow_controller",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "tint_supplies",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "obd_scanner",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "repairkit",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "advancedrepairkit",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "pixellaptop",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "nitrous",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "harness",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cleaningkit",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 14,
        },
    }
    
}