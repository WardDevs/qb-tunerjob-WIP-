# QBCore Tunerjob

Thanks for downloading the script this script is not plug and play you have to do add a few things so if you do not now what you are doing **DONT MESS AROUND WITH IT IT MAY CAUSE TO BREAK YOUR SERVER**


add this to qb-inventory/js/app.js

```lua
 else if (itemData.name == "tunerinsurance") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Name: </strong><span>" +
                itemData.info.name +
                "</span></p><p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p><p><strong>Vehicle Model: </strong><span>" +
                itemData.info.model +
                "</span></p>"
            );
```

add the items in qb-core/shared/items.lua

```lua
 ["tunerinsurance"]				 = {["name"] = "tunerinsurance", 					["label"] = "tunerinsurance", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "tunerinsurance.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "Insurance"},
```

Add the job in qb-core/shared/jobs.lua (this is mechanic job copy and pasted)
```lua
    ['tuner'] = {
		label = 'Tuner 6STR',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
```



## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [qb-log](https://github.com/qbcore-framework/qb-logs) - For logging certain events
- [qb-input](https://github.com/qbcore-framework/qb-input) - For Billing
- [qb-target](https://github.com/qbcore-framework/qb-target) - For opening stuff lol
- [qb-management](https://github.com/qbcore-framework/qb-management) - For Managing Players and money


## Preview

- [Click Me (Streamable)](https://streamable.com/620nou)


## Todo
- Add Logs ✅
- Add Items to tuner shops (Doing it now)
- Make Items useable (like the rgb controler and stuff) (Doing it now)
- Add Garage
- Add the flatbed that moves uses qb-ui
- Add qb-management
