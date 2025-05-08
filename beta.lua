local Lib = {}
local Win = {}
local Panel = {}

local Player = game.Players.LocalPlayer

function Lib:Create()
	local tips = {
		[1] = "You just need to play a little. Maybe you should go outside while i'm working for you. Also, If you can't find the button, scroll up",
		[2] = "This UI is ugly!",
		[3] = "Why don't you play something else?",
		[4] = "Blox Fruits slicks",
		[5] = "Buy premium!"
	}
	
	local atts = {
		["HideGui"] = {
			["Enabled"] = false,
			["KeyCode"] = nil
		},
		["Color"] = {
			["Background"] = Color3.fromRGB(54, 108, 162),
			["BaseColor"] = Color3.fromRGB(85, 170, 255)
		}
	}
	
	local Gui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Bar = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local Brand = Instance.new("TextLabel")
	local Buttons = Instance.new("ScrollingFrame")
	local Panels = Instance.new("Folder",Main)

	Gui.Name = "Gui"
	Gui.ResetOnSpawn = true
	Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") or game.CoreGui
	Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Gui
	Main.Active = true
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 325)

	Bar.Name = "Bar"
	Bar.Parent = Main
	Bar.Active = true
	Bar.AnchorPoint = Vector2.new(0.5, 0.5)
	Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0.0299999993, 0, 0.5, 0)
	Bar.Size = UDim2.new(0, 30, 0, 325)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 108, 162)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 255))}
	UIGradient.Rotation = 90
	UIGradient.Parent = Bar

	Brand.Name = "Brand"
	Brand.Parent = Main
	Brand.AnchorPoint = Vector2.new(0.5, 0.5)
	Brand.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Brand.BackgroundTransparency = 1.000
	Brand.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Brand.BorderSizePixel = 0
	Brand.Position = UDim2.new(0.0299999993, 0, 0.730769217, 0)
	Brand.Rotation = -90.000
	Brand.Size = UDim2.new(0, 165, 0, 30)
	Brand.ZIndex = 2
	Brand.FontFace = Font.new("rbxassetid://12187365559",Enum.FontWeight.Bold,Enum.FontStyle.Italic)
	Brand.Text = "Waitun"
	Brand.TextColor3 = Color3.fromRGB(255, 255, 255)
	Brand.TextSize = 20.000
	Brand.TextXAlignment = Enum.TextXAlignment.Left

	Buttons.Name = "Buttons"
	Buttons.Parent = Main
	Buttons.Active = true
	Buttons.BackgroundColor3 = Color3.fromRGB(35,35,35)
	Buttons.BackgroundTransparency = 0
	Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.0599999987, 0, 0, 0)
	Buttons.Size = UDim2.new(0, 50, 0, 325)
	Buttons.CanvasSize = UDim2.new(0, 0, 5, 0)
	Buttons.ScrollBarThickness = 0
	
	local UIListLayout = Instance.new("UIListLayout")
	
	UIListLayout.Parent = Buttons
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	local Close = Instance.new("Frame")
	local UIGradient_Btn = Instance.new("UIGradient")
	local ImageButton = Instance.new("ImageButton")

	Close.Name = "Close"
	Close.Parent = Buttons
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Size = UDim2.new(0, 50, 0, 50)

	UIGradient_Btn.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(153, 0, 0))}
	UIGradient_Btn.Parent = Close

	ImageButton.Parent = Close
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Size = UDim2.new(0, 50, 0, 50)
	ImageButton.Image = "http://www.roblox.com/asset/?id=6031094678"

	local function VEHMDZ_fake_script() -- ImageButton.LocalScript 
		local script = Instance.new('LocalScript', ImageButton)

		local btn = ImageButton

		btn.MouseButton1Up:Connect(function()
			Gui:Destroy()
		end)
	end
	coroutine.wrap(VEHMDZ_fake_script)()
	
	local Tips = Instance.new("TextLabel")
	local Display = Instance.new("TextLabel")
	local Welcome = Instance.new("TextLabel")

	Tips.Name = "Tips"
	Tips.Parent = Main
	Tips.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tips.BackgroundTransparency = 1.000
	Tips.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tips.BorderSizePixel = 0
	Tips.Position = UDim2.new(0.291641116, 0, 0.353846163, 0)
	Tips.Size = UDim2.new(0, 270, 0, 85)
	Tips.Font = Enum.Font.SourceSansBold
	
	Tips.Text = tips[math.random(1,5)]
	
	coroutine.wrap(function()
		while task.wait(50) do
			local rand = math.random(1,5)
			game:GetService("TweenService"):Create(Tips,TweenInfo.new(1),{TextTransparency = 1}):Play()
			task.wait(1)
			Tips.Text = tips[rand]
			game:GetService("TweenService"):Create(Tips,TweenInfo.new(1),{TextTransparency = 0}):Play()
		end
	end)()
	
	Tips.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tips.TextSize = 14.000
	Tips.TextWrapped = true

	Display.Name = "Display"
	Display.Parent = Main
	Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Display.BackgroundTransparency = 1.000
	Display.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Display.BorderSizePixel = 0
	Display.Position = UDim2.new(0.291641116, 0, 0.683076918, 0)
	Display.Size = UDim2.new(0, 270, 0, 45)
	Display.Font = Enum.Font.SourceSansBold
	Display.Text = "Currently playing: " .. game.Name 
	Display.TextColor3 = Color3.fromRGB(255, 255, 255)
	Display.TextSize = 14.000
	Display.TextWrapped = true

	Welcome.Name = "Welcome"
	Welcome.Parent = Main
	Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Welcome.BackgroundTransparency = 1.000
	Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Welcome.BorderSizePixel = 0
	Welcome.Position = UDim2.new(0.360227525, 0, 0.15384616, 0)
	Welcome.Size = UDim2.new(0, 200, 0, 50)
	Welcome.Font = Enum.Font.SourceSansBold
	Welcome.Text = "Welcome!"
	Welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
	Welcome.TextScaled = true
	Welcome.TextSize = 14.000
	Welcome.TextWrapped = true

	local function VHXAQG_fake_script()
		local script = Instance.new('LocalScript', UIGradient)

		local UIGradient = script.Parent
		local speed = 5
		local waveSize = 0.3

		local time = 0

		local function updateGradient()
			time = time + (task.wait() * speed)

			local offsetX = math.sin(time * 1.5) * waveSize
			local offsetY = math.cos(time) * waveSize * 0.7

			UIGradient.Offset = Vector2.new(offsetX, offsetY)
		end

		while true do
			updateGradient()
			task.wait()
		end
	end
	coroutine.wrap(VHXAQG_fake_script)()
	local function ZNUBQRD_fake_script()
		local script = Instance.new('LocalScript', Bar)

		local frame = script.Parent.Parent
		frame.Draggable = true
	end
	coroutine.wrap(ZNUBQRD_fake_script)()
	
	coroutine.wrap(function()
		game.UserInputService.InputBegan:Connect(function(i,p)
			if p then return end
			
			if atts.HideGui.Enabled and i.KeyCode == atts.HideGui.KeyCode then
				Gui.Enabled = not Gui.Enabled
			end
		end)	
	end)()
	
	function Win:ChangeAttribute(att,...)
		if att == "HideGui" then
			local conf = ...
			atts.HideGui.Enabled = conf[1]
			atts.HideGui.KeyCode = conf[2]
		elseif att == "Color" then
			local conf = ...
			atts.Color.BaseColor = conf[1]
			atts.Color.Background = conf[2]
			
			for _,item in pairs(Gui:GetDescendants()) do
				if item:IsA("UIGradient") then
					item.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, conf[2]), ColorSequenceKeypoint.new(1.00, conf[1])}
				end
			end
		end
	end
	
	function Win:Destroy()
		Gui.Parent = nil
		script.Parent = nil
	end
	
	function Win:AddPanel(PanelName,ImageId)
		local Button = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local ImageButton = Instance.new("ImageButton")
		
		Button.Name = "Button"
		Button.Parent = Buttons
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0, 50, 0, 50)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 108, 162)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 255))}
		UIGradient.Parent = Button

		ImageButton.Parent = Button
		ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageButton.BackgroundTransparency = 1.000
		ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageButton.BorderSizePixel = 0
		ImageButton.Size = UDim2.new(0, 50, 0, 50)
		ImageButton.Image = "rbxassetid://" .. ImageId
		
		local PanelFrame = Instance.new("Frame")
		local Bar = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local Text = Instance.new("TextLabel")
		local Close = Instance.new("ImageButton")

		PanelFrame.Name = "PanelFrame"
		PanelFrame.Parent = Panels
		PanelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		PanelFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
		PanelFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PanelFrame.BorderSizePixel = 0
		PanelFrame.Position = UDim2.new(0.529999971, 0, 0.5, 0)
		PanelFrame.Size = UDim2.new(0, 470, 0, 325)
		PanelFrame.ZIndex = 2
		PanelFrame.Visible = false

		Bar.Name = "Bar"
		Bar.Parent = PanelFrame
		Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Bar.BorderSizePixel = 0
		Bar.Size = UDim2.new(0, 470, 0, 50)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 108, 162)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 170, 255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = Bar

		Text.Name = "Text"
		Text.Parent = PanelFrame
		Text.AnchorPoint = Vector2.new(0.5, 0.5)
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Text.BorderSizePixel = 0
		Text.Position = UDim2.new(0.236170217, 0, 0.0769230798, 0)
		Text.Size = UDim2.new(0, 178, 0, 50)
		Text.Font = Enum.Font.SourceSansBold
		Text.Text = PanelName
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.TextSize = 20.000
		Text.TextXAlignment = Enum.TextXAlignment.Left

		Close.Name = "Close"
		Close.Parent = PanelFrame
		Close.AnchorPoint = Vector2.new(0.5, 0.5)
		Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close.BackgroundTransparency = 1.000
		Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close.BorderSizePixel = 0
		Close.Position = UDim2.new(0.946808517, 0, 0.0769230798, 0)
		Close.Size = UDim2.new(0, 50, 0, 50)
		Close.Image = "http://www.roblox.com/asset/?id=6031094678"

		local Frame = Instance.new("ScrollingFrame")

		Frame.Name = "Frame"
		Frame.Parent = PanelFrame
		Frame.Active = true
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 0, 0.15384616, 0)
		Frame.Size = UDim2.new(0, 469, 0, 275)
		Frame.ScrollBarThickness = 0

		local UIListLayout = Instance.new("UIListLayout",Frame)
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		-- Scripts:

		local function AVYO_fake_script() -- UIGradient.Wave 
			local script = Instance.new('LocalScript', UIGradient)

			local UIGradient = script.Parent
			local speed = 5
			local waveSize = 0.3

			local time = 0

			local function updateGradient()
				time = time + (task.wait() * speed)

				-- Different frequencies for X and Y create more interesting patterns
				local offsetX = math.sin(time * 1.5) * waveSize
				local offsetY = math.cos(time) * waveSize * 0.7

				UIGradient.Offset = Vector2.new(offsetX, offsetY)
			end

			while true do
				updateGradient()
				task.wait()
			end
		end
		coroutine.wrap(AVYO_fake_script)()
		local function TUMJOH_fake_script() -- Close.Handler 
			local script = Instance.new('LocalScript', Close)

			local panel = script.Parent.Parent
			local close = script.Parent

			close.MouseEnter:Connect(function()
				close.ImageColor3 = Color3.fromRGB(255,0,0)
			end)

			close.MouseLeave:Connect(function()
				close.ImageColor3 = Color3.fromRGB(255,255,255)
			end)

			close.MouseButton1Up:Connect(function()
				panel.Visible = false
			end)
		end
		coroutine.wrap(TUMJOH_fake_script)()
		
		coroutine.wrap(function()
			ImageButton.MouseButton1Up:Connect(function()
				PanelFrame.Visible = true
			end)
		end)()
		
		function Panel:CreateElement(element,...)
			if element == 1 then 
				local Button = Instance.new("Frame")
				local Prompt = Instance.new("TextLabel")
				local Button_2 = Instance.new("ImageButton")

				Button.Name = "Button"
				Button.Parent = Frame
				Button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0.00222222228, 0, 0, 0)
				Button.Size = UDim2.new(0, 480, 0, 50)

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
				Toggle.Parent = Frame
				Toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.00222222228, 0, 0, 0)
				Toggle.Size = UDim2.new(0, 480, 0, 50)

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

				LetterBox.Name = "TextBox"
				LetterBox.Parent = Frame
				LetterBox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				LetterBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LetterBox.BorderSizePixel = 0
				LetterBox.Position = UDim2.new(0.00222222228, 0, 0, 0)
				LetterBox.Size = UDim2.new(0, 480, 0, 50)

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
				Slider.Parent = Frame
				Slider.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0.00222222228, 0, 0, 0)
				Slider.Size = UDim2.new(0, 480, 0, 50)

				Prompt.Name = "Prompt"
				Prompt.Parent = Slider
				Prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Prompt.BackgroundTransparency = 1.000
				Prompt.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Prompt.BorderSizePixel = 0
				Prompt.Position = UDim2.new(0.0377777778, 0, 0, 0)
				Prompt.Size = UDim2.new(0, 203, 0, 50)
				Prompt.Font = Enum.Font.SourceSans
				Prompt.Text = tb.Text
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
			end
		end
		
		function Panel:Button1Up(button,func)
			coroutine.wrap(function()
				button.MouseButton1Up:Connect(func)
			end)()
		end
		
		return Panel
	end
	
	return Win
end

return Lib
