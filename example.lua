local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/lagbackisasussydog/ui_lib/refs/heads/main/main.lua"))

local win = lib:Init(Vector2.new(500,325),Enum.KeyCode.LeftAlt)

win:SetWindowIcon("10800748303")
local test = win:CreateButton("AutoFarm","16927814188")
win:CreateElement("Button",test,"Test button")
win:CreateElement("Toggle",test,"Toggle")
win:CreateElement("Label",test,"This is a text label")
