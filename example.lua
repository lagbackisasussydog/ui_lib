local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/lagbackisasussydog/ui_lib/refs/heads/main/main.lua"))()

local win = lib:Init(Enum.KeyCode.LeftAlt)

win:SetWindowIcon("10800748303")
local test = win:CreateButton("AutoFarm","16927814188")
win:CreateElement("Button",test,"Test button")
win:CreateElement("Toggle",test,"Toggle")
win:CreateElement("Label",test,"This is a text label")
win:CreateElement("TextBox",test,"This is a non-number box")
win:CreateElement("NumberBox",test,"This is a number-only box")
win:CreateElement("Slider",test,{
    ["text"] = "This is a slider",
    ["start"] = 1,
    ["max"] = 100
})
win:CreateElement("Notification",test,{
    ["Text"] = "This is a notification",
    ["Duration"] = 5
})
