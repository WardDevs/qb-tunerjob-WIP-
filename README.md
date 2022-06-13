# QBCore Tunerjob

Thanks for downloading the script this script is not plug and play you have to do add a few things so if you do not now what you are doing **DONT MESS AROUND WITH IT IT MAY CAUSE TOY BREAK YOUR SERVER


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

also add this to qb-core/shared/items.lua

```lua
	["tunerinsurance"]				 = {["name"] = "tunerinsurance", 					["label"] = "tunerinsurance", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "tunerinsurance.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "Insurance"},
```



## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [qb-log](https://github.com/qbcore-framework/qb-logs) - For logging certain events
- [qb-input](https://github.com/qbcore-framework/qb-input) - For accessing evidence stashes
- [qb-target](https://github.com/qbcore-framework/qb-target) - For accessing opening stuff lol