# dog's ui library

---------
I don't recommend this.

----------

How to use:

## .1
To create the gui, use lib:Init(Enum.KeyCode.YourKeyCode) and set it as a variable

ex:

````lua
local win = lib:Init(Enum.KeyCode.LeftAlt)
````

## .2
Basic syntax: 

````lua
win:CreateButton("Button name","Image id (do not include the url. just the id)") -- returns the panel
win:CreateElement("Button_type",your_panel,"...") -- returns the button

-- Button_type: Button,Toggle,Label
````
------------

That's it

![Sample Image](https://github.com/lagbackisasussydog/ui_lib/blob/main/RobloxScreenShot20250304_123237437.png "Example")

-----------

Exclusive version

``````lua
local Lib = require(game.ReplicatedStorage.WaitunLib)
local Win = Lib:Create()
local Panel = Win:AddPanel("Panel","6031265976")

local btn = Panel:CreateElement(1,"hi")
local tg = Panel:CreateElement(2,"hi")
Panel:CreateElement(3,"hi")
Panel:CreateElement(4,{
	Text = "hi",
	Min = 0,
	Max = 100
})

Panel:Button1Up(btn,function()
	Win:ChangeAttribute("HideGui",{
		[1] = true,
		[2] = Enum.KeyCode.LeftAlt
	})
	Win:ChangeAttribute("Color",{
		[1] = Color3.fromRGB(255, 85, 255),
		[2] = Color3.fromRGB(168, 56, 168)
	})
end)

Panel:CreateElement(5,{
	Text = "Test",
	List = {"Test1","Test2","Test3","Test4","Test5","Test6","Test7"},
	Default = "Test1"
})
``````

