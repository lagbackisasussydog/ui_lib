local plr = game:GetService("Players").LocalPlayer

local lib = {}
local win = {}

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
	
	if game["Run Service"]:IsStudio() then
		Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	else
		Gui.Parent = game:GetService("CoreGui")
	end
	
	Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Gui.ResetOnSpawn = false 

	Main.Name = "Main"
	Main.Parent = Gui
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 350)
	Main.Active = true
	Main.Draggable = true
	
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
	Bar.Size = UDim2.new(0, 5, 0, 330)
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
		newPanel.CanvasSize = UDim2.new(0,0,330,0)
		newPanel.Visible = true
		newPanel.Active = true
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

	function win:CreateElement(element_type,panel,...)
		if element_type == "Button" then
			local btn = Instance.new("TextButton",panel)
			btn.Size = UDim2.new(0,375,0,35)
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.BackgroundTransparency = .5
			btn.Text = ...
			btn.Active = true

			return btn
		elseif element_type == "Toggle" then
			local isPressed = false
			local btn = Instance.new("TextButton",panel)
			btn.Size = UDim2.new(0,375,0,35)
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.BackgroundColor3 = Color3.fromRGB(255,0,0)
			btn.Text = ...
			btn.Active = true

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
			lb.Active = true
		elseif element_type == "NumberBox" then
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
				local newText = Box.Text:gsub("%D","")
				Box.Text = newText
			end)
			
			return Box
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
				local newText = Box.Text:gsub("%D","")
				Box.Text = newText
			end)

			return Box
		elseif element_type == "Slider" then
			
			local mouse = plr:GetMouse()
			
			local Slider = Instance.new("Frame")
			local Name = Instance.new("TextLabel")
			local Background = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local button = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local Fill = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local button_2 = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")

			--Properties:
			
			local conf = ...
			
			Slider.Name = "Slider"
			Slider.Parent = panel
			Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(-0.287499994, 0, 0, 0)
			Slider.Size = UDim2.new(0, 365, 0, 60)

			Name.Name = "Name"
			Name.Parent = Slider
			Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Name.BackgroundTransparency = 1.000
			Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Name.BorderSizePixel = 0
			Name.Position = UDim2.new(0.0383561626, 0, 0.163636357, 0)
			Name.Size = UDim2.new(0, 132, 0, 35)
			Name.Font = Enum.Font.SourceSans
			Name.Text = conf.text
			Name.TextColor3 = Color3.fromRGB(255, 255, 255)
			Name.TextSize = 20.000

			Background.Name = "Background"
			Background.Parent = Slider
			Background.AnchorPoint = Vector2.new(0.5, 0.5)
			Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Background.BorderSizePixel = 0
			Background.Position = UDim2.new(0.698630154, 0, 0.4909091, 0)
			Background.Size = UDim2.new(0, 200, 0, 24)

			UICorner.Parent = Background

			button.Name = "button"
			button.Parent = Background
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundTransparency = 1.000
			button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			button.BorderSizePixel = 0
			button.Size = UDim2.new(0, 200, 0, 24)
			button.Font = Enum.Font.SourceSans
			button.Text = ""
			button.TextColor3 = Color3.fromRGB(0, 0, 0)
			button.TextSize = 14.000
			button.ZIndex = 1

			UICorner_2.Parent = button

			Fill.Name = "Fill"
			Fill.Parent = Background
			Fill.AnchorPoint = Vector2.new(0, 0.5)
			Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Fill.BorderSizePixel = 0
			Fill.Position = UDim2.new(-0.00136993406, 0, 0.490908951, 0)
			Fill.Size = UDim2.new(0, 200, 0, 24)

			UICorner_3.Parent = Fill
			
			TextLabel.Parent = Background
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.0500000007, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 167, 0, 24)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = ""
			TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.TextSize = 20.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			
			local start = conf.start or conf.start/100
			local max = conf.max or conf.max/100
			local Val = Instance.new("IntValue",Fill)
			TextLabel.Text = tostring(Val.Value)

			local function UpdateSlider()
				local size = math.clamp((mouse.X-Background.AbsolutePosition.X)/Background.AbsoluteSize.X,0,1)
				local ClampedValue = start + (size*(max-start))
				
				Val.Value = ClampedValue
				TextLabel.Text = tostring(Val.Value)
				Fill.Size = UDim2.fromScale(size,1)
			end

			UpdateSlider()
			
			local hovering = false
			
			local function Activate()
				hovering = true
				while hovering do
					UpdateSlider()
					task.wait()
				end
			end
			
			button.MouseButton1Down:Connect(function()
				Activate()
			end)
			
			game:GetService("UserInputService").InputEnded:Connect(function(i,p)
				if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
					hovering = false
				end
			end)
		elseif element_type == "Notification" then
			local conf = ...
			local NotificationGui = Instance.new("ScreenGui")
			local Main = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Desc = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local UIPadding = Instance.new("UIPadding")
			
			NotificationGui.Parent = game.CoreGui
			
			Main.Name = "Main"
			Main.Parent = NotificationGui
			Main.AnchorPoint = Vector2.new(0.5, 0.5)
			Main.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
			Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Main.BorderSizePixel = 0
			Main.Position = UDim2.new(0.802612484, 0, 0.878243506, 0)
			Main.Size = UDim2.new(0, 248, 0, 100)

			Title.Name = "Title"
			Title.Parent = Main
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.new(0.661290348, 0, 0.0500000007, 0)
			Title.Size = UDim2.new(0, 69, 0, 30)
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = "Notification"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Right

			Desc.Name = "Desc"
			Desc.Parent = Main
			Desc.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
			Desc.BackgroundTransparency = 1.000
			Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Desc.BorderSizePixel = 0
			Desc.Position = UDim2.new(0.0645161271, 0, 0.349999994, 0)
			Desc.Size = UDim2.new(0, 217, 0, 55)
			Desc.Font = Enum.Font.SourceSans
			Desc.Text = conf.Text
			Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
			Desc.TextSize = 14.000
			Desc.TextWrapped = true
			Desc.TextXAlignment = Enum.TextXAlignment.Right

			Frame.Parent = Main
			Frame.AnchorPoint = Vector2.new(0, 0.5)
			Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 0, 0.5, 0)
			Frame.Size = UDim2.new(0, 0, 0, 100)

			UIPadding.Parent = NotificationGui
			UIPadding.PaddingBottom = UDim.new(0,10)
			
			task.wait(conf.Duration)
			
			local tw = game:GetService("TweenService")
			local t = tw:Create(Frame,TweenInfo.new(1,Enum.EasingStyle.Exponential),{Size = UDim2.new(1,0,1,0)})
			t:Play()
			t.Completed:Wait()
			
			for _,item in NotificationGui:GetDescendants() do
				if item:IsA("TextLabel") then item.Text = "" end
				local t = tw:Create(item,TweenInfo.new(1),{BackgroundTransparency = 1})
				t:Play()
			end
			
			game.Debris:AddItem(NotificationGui,10)
		end
	end

	return win
end
return lib
