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
win:CreateButton("Button name","Image id (do not include the url. just the id)")
win:CreateElement("Button_type",your_panel,"...")

-- Button_type: Button,Toggle,Label
````

## .3
Set the element you've created to a variable and you have control of that element

ex:

```` lua
local button = win:CreateElement("Button",your_panel,"Example button") -- replace "your_panel" with the panel you've created

button.MouseButton1Up:Connect(function()
  -- Your code here
end)
````

------------

That's it

![Sample Image](https://github.com/lagbackisasussydog/ui_lib/blob/main/RobloxScreenShot20250304_123237437.png "Example")
