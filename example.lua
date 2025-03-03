local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/lagbackisasussydog/ui_lib/refs/heads/main/main.lua"))

local newGui = lib.Get()

local autofarm = lib.CreateButton("AutoFarm","AutoFarm","9695653110") -- Create button
local travel = lib.CreateButton("Travel","Travel","6026568198")
local setting = lib.CreateButton("Settings","Settings","6031280882")
local deb = lib.CreateButton("Dev","Debug","6022852107")

lib.SetGuiIcon("5205790785") -- Set UI icon
lib.Send("Initializing script",10) -- Send a notification

local btn1 = lib.CreatePanelElement("Button",autofarm,"Enable") -- Get button
lib.CreatePanelElement("Label",autofarm,"This is a text label")
btn1.MouseButton1Up:Connect(function() -- You can also use lib.Connect(button,function() end)
	print("Enabled")
end)

local btn2 = lib.CreatePanelElement("Toggle",travel,"Somewhere")
btn2.MouseButton1Up:Connect(function()
  -- Make your own boolean switch system
	print("Hi")
end)

local btn3 = lib.CreatePanelElement("Button",deb,"Inf Yield")
btn3.MouseButton1Up:Connect(function()
	loadstring("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")()
end)
