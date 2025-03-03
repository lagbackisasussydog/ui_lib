-- Gui to Lua
-- Version: 3.2

-- Instances:

local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Icon = Instance.new("ImageLabel")
local Bar = Instance.new("Frame")
local Panel = Instance.new("Folder")
local List = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Notification = Instance.new("ScreenGui")
local Main2 = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Message = Instance.new("TextLabel")

--Properties:

Notification.Name = "Notification"
Notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main2.Name = "Main2"
Main2.Parent = Notification
Main2.AnchorPoint = Vector2.new(0.5, 0.5)
Main2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Main2.BackgroundTransparency = 0.500
Main2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main2.BorderSizePixel = 0
Main2.Position = UDim2.new(1.839999974, 0, 0.795000017, 0)
Main2.Size = UDim2.new(0, 300, 0, 150)

Title.Name = "Title"
Title.Parent = Main2
Title.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Title.BackgroundTransparency = 0.500
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0500000007, 0, 0.0733333305, 0)
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Font = Enum.Font.SourceSans
Title.Text = "NOTIFICATION"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 25.000

Message.Name = "Message"
Message.Parent = Main2
Message.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
Message.BackgroundTransparency = 0.500
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0.0500000007, 0, 0.319999993, 0)
Message.Size = UDim2.new(0, 274, 0, 87)
Message.Font = Enum.Font.SourceSans
Message.Text = "..."
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextSize = 25.000
Message.TextWrapped = true

Gui.Name = "Gui"
Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.ResetOnSpawn = false 

Main.Name = "Main"
Main.Parent = Gui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 500, 0, 325)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

Icon.Name = "Icon"
Icon.Parent = Main
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 0.500
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.0799999982, 0, 0.12153846, 0)
Icon.Size = UDim2.new(0, 55, 0, 55)

Bar.Name = "Bar"
Bar.Parent = Main
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0.151999995, 0, 0.036923077, 0)
Bar.Size = UDim2.new(0, 5, 0, 305)
Bar.ZIndex = -1

Panel.Name = "Panel"
Panel.Parent = Main

List.Name = "List"
List.Parent = Main
List.Active = true
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.BorderColor3 = Color3.fromRGB(0, 0, 0)
List.BorderSizePixel = 0
List.Position = UDim2.new(0.0240000002, 0, 0.249230772, 0)
List.Size = UDim2.new(0, 55, 0, 235)
List.ZIndex = 0
List.ScrollBarThickness = 0

UIListLayout.Parent = List
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Scripts:

local function JVTMTLJ_fake_script() -- Main.Drag 
	local script = Instance.new('LocalScript', Main)

	local frame = script.Parent
	frame.Active = true
	frame.Draggable = true
	
	local p = false
	
	game.UserInputService.InputBegan:Connect(function(i,p)
		if p then return end
		
		if i.KeyCode == Enum.KeyCode.LeftAlt then
			Gui.Enabled = not Gui.Enabled
		end
	end)
end
coroutine.wrap(JVTMTLJ_fake_script)()

local plr = game:GetService("Players").LocalPlayer

local lib = {}

function lib.Create()
	return Gui
end

function lib.SetGuiIcon(ImageId)
	Icon.Image = "rbxassetid://" .. ImageId
	Icon.Transparency = 1
	if Icon.Image == "" then
		Icon.Transparency = .5
	end
end

function lib.CreateButton(panel_name,button_name,id)
	local newPanel = Instance.new("Frame",Panel)
	
	newPanel.Name = panel_name
	newPanel.Parent = Panel
	newPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	newPanel.BackgroundTransparency = 1.000
	newPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newPanel.BorderSizePixel = 0
	newPanel.Position = UDim2.new(0.180000007, 0, 0.036923077, 0)
	newPanel.Size = UDim2.new(0, 401, 0, 305)
	newPanel.Visible = false
	Instance.new("UICorner",newPanel)
	
	local newButton = Instance.new("ImageButton",List)
	newButton.Name = button_name
	newButton.Size = UDim2.new(0,55,0,55)
	newButton.BackgroundTransparency = 1
	newButton.Image = "rbxassetid://" .. id
	
	local lista = Instance.new("UIListLayout")
	lista.Parent = newPanel
	lista.HorizontalAlignment = Enum.HorizontalAlignment.Center
	lista.SortOrder = Enum.SortOrder.LayoutOrder
	lista.Padding = UDim.new(0,5)
	
	newButton.MouseButton1Up:Connect(function()
		for _,frame in Panel:GetChildren() do
			frame.Visible = false
		end
		newPanel.Visible = true
	end)
	
	return newPanel
end

function lib.CreatePanelElement(button_type,panel,...)
	if button_type == "Button" then
		local btn = Instance.new("TextButton",panel)
		btn.Size = UDim2.new(0,375,0,35)
		btn.TextColor3 = Color3.fromRGB(255,255,255)
		btn.BackgroundTransparency = .5
		btn.Text = ...
		
		return btn
	elseif button_type == "Toggle" then
		local isPressed = false
		local btn = Instance.new("TextButton",panel)
		btn.Size = UDim2.new(0,375,0,35)
		btn.TextColor3 = Color3.fromRGB(255,255,255)
		btn.BackgroundTransparency = .5
		btn.BackgroundColor3 = Color3.fromRGB(255,0,0)
		btn.Text = ...
		
		btn.MouseButton1Up:Connect(function()
			isPressed = not isPressed
			
			if isPressed then btn.BackgroundColor3 = Color3.fromRGB(0,255,0) else btn.BackgroundColor3 = Color3.fromRGB(255,0,0) end
		end)
		
		return btn
	elseif button_type == "Label" then
		local lb = Instance.new("TextLabel",panel)
		lb.Size = UDim2.new(0,375,0,35)
		lb.TextColor3 = Color3.fromRGB(255,255,255)
		lb.Text = ...
	end
end

function lib.Send(msg,duration)
	local tw = game:GetService("TweenService")
	local track1 = tw:Create(Main2,TweenInfo.new(4,Enum.EasingStyle.Quart),{Position = Main2.Position - UDim2.new(1,0,0,0)})
	local track2 = tw:Create(Main2,TweenInfo.new(8,Enum.EasingStyle.Quart),{Position = Main2.Position + UDim2.new(1,0,0,0)})

	Message.Text = msg
	track1:Play()
	wait(duration)
	track2:Play()
end

function lib.Connect(button,func)
	button.MouseButton1Up:Connect(func)
end

return lib
