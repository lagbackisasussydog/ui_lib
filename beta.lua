local Lib = {}
local win = {}
local theme = {
	Default = {
		[1] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 255))},
		[2] = -90
	},
	Amethyst = {
		[1] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(126, 0, 126))},
		[2] = -90
	},
	Leaf = {
		[1] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 0))},
		[2] = -90
	},
	Orange = {
		[1] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 57, 0))},
		[2] = -90
	},
	Red = {
		[1] = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(145, 0, 0))},
		[2] = -90
	}
}

function Lib:Create(Exec_name : string,Key,preset)
	local Gui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Label = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local Buttons = Instance.new("ScrollingFrame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Container = Instance.new("Folder")
	local Reopen = Instance.new("ImageButton")

	local blur = Instance.new("BlurEffect",game.Lighting)
	blur.Size = 99
	blur.Enabled = true

	Gui.Name = "Gui"
	Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Gui.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = Gui
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.BackgroundTransparency = 0.500
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.49949342, 0, 0.498839915, 0)
	Main.Size = UDim2.new(0, 500, 0, 325)

	Label.Name = "Label"
	Label.Parent = Main
	Label.Active = true
	Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Label.BorderSizePixel = 0
	Label.Size = UDim2.new(0, 500, 0, 50)
	Label.Font = Enum.Font.SourceSansItalic
	Label.Text = "	" .. Exec_name
	Label.TextColor3 = Color3.fromRGB(170, 85, 127)
	Label.TextScaled = false
	Label.TextSize = 25.000
	Label.TextWrapped = true
	Label.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient.Color = theme[preset][1]
	UIGradient.Rotation = theme[preset][2]
	UIGradient.Parent = Label

	Buttons.Name = "Buttons"
	Buttons.Parent = Main
	Buttons.Active = true
	Buttons.AnchorPoint = Vector2.new(0.5, 0.5)
	Buttons.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	Buttons.BackgroundTransparency = 0.500
	Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.499000013, 0, 0.267692298, 0)
	Buttons.Size = UDim2.new(0, 450, 0, 50)
	Buttons.CanvasSize = UDim2.new(100, 0, 0, 0)
	Buttons.ScrollBarThickness = 0

	UIGridLayout.Parent = Buttons
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIGridLayout.CellSize = UDim2.new(0, 50, 0, 50)
	UIGridLayout.CellPadding = UDim2.new(0,0,0,0)

	Reopen.Name = "Reopen"
	Reopen.Parent = Gui
	Reopen.AnchorPoint = Vector2.new(0.5, 0.5)
	Reopen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Reopen.BackgroundTransparency = 0.500
	Reopen.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Reopen.BorderSizePixel = 0
	Reopen.Position = UDim2.new(0.97322762, 0, 0.498011768, 0)
	Reopen.Size = UDim2.new(0, 35, 0, 35)
	Reopen.Image = "http://www.roblox.com/asset/?id=6031090997"

	Container.Name = "Container"
	Container.Parent = Main
	
	local function open(state)
		if state then
			local t = game:GetService("TweenService"):Create(Main,TweenInfo.new(1),{Position = UDim2.new(0.49949342, 0, 0.498839915, 0)})
			game:GetService("TweenService"):Create(blur,TweenInfo.new(1),{Size = 99}):Play()
			t:Play()
			t.Completed:Wait()
		else
			local t = game:GetService("TweenService"):Create(Main,TweenInfo.new(4),{Position = UDim2.new(0.49949342, 0, 10.498839915, 0)})
			game:GetService("TweenService"):Create(blur,TweenInfo.new(.5),{Size = 0}):Play()
			t:Play()
			t.Completed:Wait()
		end
	end
	
	coroutine.wrap(function(...) 
		local pressed = true
		local uis = game:GetService("UserInputService")
	
		Reopen.MouseButton1Up:Connect(function()
			pressed = not pressed
			open(pressed)
		end)
	
		uis.InputBegan:Connect(function(i,p)
			if p then return end

			if i.KeyCode == Key then
				pressed = not pressed
				open(pressed)
			end
		end)
	end)()
	
	local hovering = false
	local pressing = false
	local mouse = game.Players.LocalPlayer:GetMouse()
	coroutine.wrap(function()
		mouse.Button1Down:Connect(function()
			pressing = true
			while hovering and pressing do
				Main.Position = UDim2.fromScale(mouse.X / 100,mouse.Y/100)
				task.wait()
			end
		end)
		
		Label.MouseEnter:Connect(function()
			hovering = true
		end)
		
		Label.MouseLeave:Connect(function()
			hovering = false
		end)
	end)()

	function win:CreatePanel(button_name : string,image_id : string)
		local Panel = Instance.new("ScrollingFrame")

		Panel.Name = button_name
		Panel.Parent = Container
		Panel.Active = true
		Panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Panel.BackgroundTransparency = 1.000
		Panel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Panel.BorderSizePixel = 0
		Panel.Position = UDim2.new(0.0480000004, 0, 0.369230777, 0)
		Panel.Size = UDim2.new(0, 450, 0, 190)
		Panel.Visible = false
		Panel.CanvasSize = UDim2.new(0, 0, 999, 0)
		Panel.ScrollBarThickness = 0

		local Button = Instance.new("ImageButton")

		Button.Name = button_name
		Button.Parent = Buttons
		Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Button.BackgroundTransparency = 0.500
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0, 100, 0, 100)
		Button.Image = "rbxassetid://" .. image_id
		Button.MouseButton1Up:Connect(function()
			for _,panel in pairs(Container:GetChildren()) do
				panel.Visible = false
			end
			Panel.Visible = true
		end)

		local UIGridLayout_2 = Instance.new("UIGridLayout")
		UIGridLayout_2.Parent = Panel
		UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout_2.CellPadding = UDim2.new(0, 0, 0, 0)
		UIGridLayout_2.CellSize = UDim2.new(0, 450, 0, 50)

		return Panel
	end

	function win:CreateElement(element,panel,...)
		if element == 1 then 
			local Button = Instance.new("Frame")
			local Prompt = Instance.new("TextLabel")
			local Button_2 = Instance.new("ImageButton")

			Button.Name = "Button"
			Button.Parent = panel
			Button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.00222222228, 0, 0, 0)
			Button.Size = UDim2.new(0, 450, 0, 47)

			Prompt.Name = "Prompt"
			Prompt.Parent = Button
			Prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.BackgroundTransparency = 1.000
			Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Prompt.BorderSizePixel = 0
			Prompt.Position = UDim2.new(0.0377777778, 0, 0, 0)
			Prompt.Size = UDim2.new(0, 203, 0, 50)
			Prompt.Font = Enum.Font.SourceSans
			Prompt.Text = ...
			Prompt.TextColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.TextSize = 20.000
			Prompt.TextXAlignment = Enum.TextXAlignment.Left

			Button_2.Name = "Button"
			Button_2.Parent = Button
			Button_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Button_2.BackgroundTransparency = 0.500
			Button_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button_2.BorderSizePixel = 0
			Button_2.Position = UDim2.new(0.884444535, 0, 0.140000001, 0)
			Button_2.Size = UDim2.new(0, 35, 0, 35)
			Button_2.Image = "rbxassetid://6031091008"

			return Button_2
		elseif element == 2 then
			local Toggle = Instance.new("Frame")
			local Prompt = Instance.new("TextLabel")
			local Button = Instance.new("ImageButton")

			Toggle.Name = "Toggle"
			Toggle.Parent = panel
			Toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0.00222222228, 0, 0, 0)
			Toggle.Size = UDim2.new(0, 450, 0, 47)

			Prompt.Name = "Prompt"
			Prompt.Parent = Toggle
			Prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.BackgroundTransparency = 1.000
			Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Prompt.BorderSizePixel = 0
			Prompt.Position = UDim2.new(0.0377777778, 0, 0, 0)
			Prompt.Size = UDim2.new(0, 203, 0, 50)
			Prompt.Font = Enum.Font.SourceSans
			Prompt.Text = ...
			Prompt.TextColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.TextSize = 20.000
			Prompt.TextXAlignment = Enum.TextXAlignment.Left

			Button.Name = "Button"
			Button.Parent = Toggle
			Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.884444535, 0, 0.140000001, 0)
			Button.Size = UDim2.new(0, 35, 0, 35)
			Button.Image = "http://www.roblox.com/asset/?id=6031094678"
			
			local state = false
			coroutine.wrap(function()
				Button.MouseButton1Up:Connect(function()
					state = not state
					if state then
						Button.BackgroundColor3 = Color3.fromRGB(0,255,0)
						Button.Image = "rbxassetid://6023426926"
					else
						Button.BackgroundColor3 = Color3.fromRGB(255,0,0)
						Button.Image = "http://www.roblox.com/asset/?id=6031094678"
					end
				end)
			end)()
			return Button
		elseif element == 3 then
			local LetterBox = Instance.new("Frame")
			local Prompt = Instance.new("TextLabel")
			local Box = Instance.new("TextBox")

			LetterBox.Name = "LetterBox"
			LetterBox.Parent = panel
			LetterBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			LetterBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LetterBox.BorderSizePixel = 0
			LetterBox.Position = UDim2.new(0.00222222228, 0, 0, 0)
			LetterBox.Size = UDim2.new(0, 450, 0, 47)

			Prompt.Name = "Prompt"
			Prompt.Parent = LetterBox
			Prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.BackgroundTransparency = 1.000
			Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Prompt.BorderSizePixel = 0
			Prompt.Position = UDim2.new(0.0377777778, 0, 0, 0)
			Prompt.Size = UDim2.new(0, 203, 0, 50)
			Prompt.Font = Enum.Font.SourceSans
			Prompt.Text = ...
			Prompt.TextColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.TextSize = 20.000
			Prompt.TextXAlignment = Enum.TextXAlignment.Left

			Box.Name = "Box"
			Box.Parent = LetterBox
			Box.AnchorPoint = Vector2.new(0.5, 0.5)
			Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Box.BackgroundTransparency = 0.500
			Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Box.BorderSizePixel = 0
			Box.Position = UDim2.new(0.740000069, 0, 0.5, 0)
			Box.Size = UDim2.new(0, 200, 0, 35)
			Box.Font = Enum.Font.SourceSans
			Box.Text = ""
			Box.TextColor3 = Color3.fromRGB(0, 0, 0)
			Box.TextSize = 14.000

			return Box
		elseif element == 4 then
			local tb = ...

			local Slider = Instance.new("Frame")
			local Prompt = Instance.new("TextLabel")
			local Back = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local Back_2 = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")
			local Values = Instance.new("Folder")
			local Min = Instance.new("NumberValue")
			local Max = Instance.new("NumberValue")
			local Cur = Instance.new("NumberValue")

			Slider.Name = "Slider"
			Slider.Parent = panel
			Slider.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.00222222228, 0, 0, 0)
			Slider.Size = UDim2.new(0, 450, 0, 47)

			Prompt.Name = "Prompt"
			Prompt.Parent = Slider
			Prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.BackgroundTransparency = 1.000
			Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Prompt.BorderSizePixel = 0
			Prompt.Position = UDim2.new(0.0377777778, 0, 0, 0)
			Prompt.Size = UDim2.new(0, 203, 0, 50)
			Prompt.Font = Enum.Font.SourceSans
			Prompt.Text = "Example Slider"
			Prompt.TextColor3 = Color3.fromRGB(255, 255, 255)
			Prompt.TextSize = 20.000
			Prompt.TextXAlignment = Enum.TextXAlignment.Left

			Back.Name = "Back"
			Back.Parent = Slider
			Back.AnchorPoint = Vector2.new(0.5, 0.5)
			Back.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Back.BorderSizePixel = 0
			Back.Position = UDim2.new(0.740000069, 0, 0.5, 0)
			Back.Size = UDim2.new(0, 200, 0, 15)

			Button.Name = "Button"
			Button.Parent = Back
			Button.AnchorPoint = Vector2.new(0, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.824999988, 0, 0.485714734, 0)
			Button.Size = UDim2.new(0, 35, 0, 35)
			Button.Font = Enum.Font.SourceSans
			Button.Text = "0"
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 20.000
			
			UIStroke.Color = Color3.fromRGB(0,0,0)
			UIStroke.Thickness = 1
			UIStroke.Parent = Button

			Back_2.Name = "Back_2"
			Back_2.Parent = Back
			Back_2.AnchorPoint = Vector2.new(0, 0.5)
			Back_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Back_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Back_2.BorderSizePixel = 0
			Back_2.Position = UDim2.new(0, 0, 0.5, 0)
			Back_2.Size = UDim2.new(0, 200, 0, 15)
			Back_2.ZIndex = 0

			Values.Name = "Values"
			Values.Parent = Slider
			
			Min.Name = "Min"
			Min.Value = tb.Min
			Min.Parent = Values
			
			Max.Name = "Max"
			Max.Value = tb.Max
			Max.Parent = Values
			
			Cur.Name = "Cur"
			Cur.Parent = Values
			
			local pressed = false
			local mouse = game.Players.LocalPlayer:GetMouse()
			local pmin = Min.Value / 100
			local pmax = Max.Value / 100
			Button.Text = tostring(math.round(pmax * 100))
			coroutine.wrap(function()
				Button.MouseButton1Down:Connect(function()
					pressed = true
					while pressed do
						local size = math.clamp((mouse.X - Back.AbsolutePosition.X) / Back.AbsoluteSize.X,0,1)
						local val = pmin + (size*(pmax - pmin))
						
						Back_2.Size = UDim2.fromScale(size,1)
						Button.Position = UDim2.fromScale(size,0.5)
						Button.Text = tostring(math.round(val * 100))
						Cur.Value = math.round(val * 100)
						task.wait()
					end
				end)
				
				game:GetService("UserInputService").InputEnded:Connect(function(i,p)
					if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
						pressed = false
					end
				end)
			end)()
			return Cur
		end
	end
	return win
end

return Lib
