local noti = {}

function noti:Send(ntype,message,duration)
	local Gui = Instance.new("ScreenGui")
	local Background = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Main = Instance.new("Frame")

	Gui.Parent = game:GetService("CoreGui")
	Gui.IgnoreGuiInset = true
	Gui.ResetOnSpawn = false

	Background.Name = "Background"
	Background.Parent = Gui
	Background.AnchorPoint = Vector2.new(0.5, 0.5)
	
	if ntype == "Error" then
		Background.BackgroundColor3 = Color3.fromRGB(255, 35, 35)
	elseif ntype == "Success" then
		Background.BackgroundColor3 = Color3.fromRGB(35, 255, 35)
	elseif ntype == "Standard" then
		Background.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	end
	
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0.850371718, 0, 1.0835073069, 0)
	Background.Size = UDim2.new(0, 300, 0, 50)

	UICorner.Parent = Background

	Main.Name = "Main"
	Main.Parent = Background
	Main.AnchorPoint = Vector2.new(1, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(1.00000024, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 0, 0, 50)
	
	local TextLabel = Instance.new("TextLabel")

	TextLabel.Parent = Main
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.27241379, 0, 0.159999996, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 33)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 25.000
	TextLabel.TextTransparency = 1
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Right
	
	local tw = game:GetService("TweenService")
	local track = tw:Create(Main,TweenInfo.new(1,Enum.EasingStyle.Quint),{Size = UDim2.new(0,290,0,50)})
	local track2 = tw:Create(Background,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency = 1})
	local track4 = tw:Create(Main,TweenInfo.new(1,Enum.EasingStyle.Quint),{BackgroundTransparency = 1})
	local track3 = tw:Create(Background,TweenInfo.new(.5,Enum.EasingStyle.Quint),{Position = Background.Position - UDim2.new(0,0,1,0)})
	local track5 = tw:Create(TextLabel,TweenInfo.new(1),{TextTransparency = 1})
	local track6 = tw:Create(TextLabel,TweenInfo.new(1),{TextTransparency = 0})
	
	track3:Play()
	track3.Completed:Wait()
	track:Play()
	track6:Play()
	TextLabel.Text = message
	wait(duration)
	track5:Play()
	track2:Play()
	track4:Play()
	wait(4)
	Gui:Destroy()
end

return noti
