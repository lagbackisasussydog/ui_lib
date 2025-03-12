local lib = {}
local win = {}

local plr = game:GetService("Players").LocalPlayer

function lib:Init(key_bind)
	local Gui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Icon = Instance.new("ImageLabel")
	local Bar = Instance.new("Frame")
	local Panel = Instance.new("Folder")
	local List = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Notification = Instance.new("ScreenGui")
	local UIStroke = Instance.new("UIStroke")
	
	--Properties:

	Gui.Name = "Gui"
	Gui.Parent = game:GetService("CoreGui")
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
	
	UIStroke.Parent = Main
	UIStroke.Color = Color3.fromRGB(255,255,255)
	UIStroke.Thickness = 2
	
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

	local function bind() -- Main.Drag 
		local script = Instance.new('LocalScript', Main)
		local p = false

		game.UserInputService.InputBegan:Connect(function(i,p)
			if p then return end

			if i.KeyCode == key_bind then
				Gui.Enabled = not Gui.Enabled
			end
		end)
	end
	coroutine.wrap(bind)()

	function win:SetWindowIcon(ImageId)
		Icon.Image = "rbxassetid://" .. ImageId
		Icon.Transparency = 1
		if Icon.Image == "" then
			Icon.Transparency = .5
		end
	end

	function win:CreateButton(button_name,id)
		local newPanel = Instance.new("ScrollingFrame",Panel)

		newPanel.Name = button_name
		newPanel.Parent = Panel
		newPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPanel.BackgroundTransparency = 1.000
		newPanel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newPanel.BorderSizePixel = 0
		newPanel.Position = UDim2.new(0.180000007, 0, 0.036923077, 0)
		newPanel.Size = UDim2.new(0, 401, 0, 305)
		newPanel.ScrollBarThickness = 0
		newPanel.CanvasSize = UDim2.new(0,0,500,0)
		newPanel.Visible = false

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

	function win:CreateElement(element_type,panel,...)
		if element_type == "Button" then
			local btn = Instance.new("TextButton",panel)
			btn.Size = UDim2.new(0,375,0,35)
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.BackgroundTransparency = .5
			btn.Text = ...

			return btn
		elseif element_type == "Toggle" then
			local isPressed = false
			local btn = Instance.new("TextButton",panel)
			btn.Size = UDim2.new(0,375,0,35)
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.BackgroundColor3 = Color3.fromRGB(255,0,0)
			btn.Text = ...

			btn.MouseButton1Up:Connect(function()
				isPressed = not isPressed

				if isPressed then btn.BackgroundColor3 = Color3.fromRGB(0,255,0) else btn.BackgroundColor3 = Color3.fromRGB(255,0,0) end
			end)

			return btn
		elseif element_type == "Label" then
			local lb = Instance.new("TextLabel",panel)
			lb.Size = UDim2.new(0,375,0,35)
			lb.TextColor3 = Color3.fromRGB(255,255,255)
			lb.Text = ...
		elseif element_type == "HorizontalRule" then
			local hr = Instance.new("TextLabel",panel)
			hr.Size = UDim2.new(0,375,0,35)
			hr.BackgroundTransparency = 1
			hr.TextColor3 = Color3.fromRGB(255,255,255)
			hr.TextScaled = true
			hr.Text = "------------------------------------------------"
		elseif element_type == "TextBox" then
			local Frame = Instance.new("Frame")
			local Name = Instance.new("TextLabel")
			local Box = Instance.new("TextBox")
			
			Frame.Name = "TextBox"
			Frame.Parent = panel
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(-0.287499994, 0, 0, 0)
			Frame.Size = UDim2.new(0, 365, 0, 55)

			Name.Name = "Name"
			Name.Parent = Frame
			Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Name.BackgroundTransparency = 1.000
			Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Name.BorderSizePixel = 0
			Name.Position = UDim2.new(0.0383561626, 0, 0.163636357, 0)
			Name.Size = UDim2.new(0, 132, 0, 35)
			Name.Font = Enum.Font.SourceSans
			Name.Text = ...
			Name.TextColor3 = Color3.fromRGB(255, 255, 255)
			Name.TextSize = 20.000

			Box.Name = "Box"
			Box.Parent = Frame
			Box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Box.BorderSizePixel = 0
			Box.Position = UDim2.new(0.424657524, 0, 0.272727281, 0)
			Box.Size = UDim2.new(0, 200, 0, 24)
			Box.Font = Enum.Font.SourceSans
			Box.Text = ""
			Box.TextColor3 = Color3.fromRGB(0, 0, 0)
			Box.TextSize = 14.000
			Box.ClearTextOnFocus = false
			Box.TextColor3 = Color3.fromRGB(255,255,255)

			Box:GetPropertyChangedSignal("Text"):Connect(function()
			    local newText = Box.Text:gsub("%D", "") -- Remove all non-numeric characters
			    Box.Text = newText
			end)
			
			return Box
		end
	end

	return win
end
return lib
