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
