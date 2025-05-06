local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local function playSound(id)
    local s = Instance.new("Sound", char)
    s.SoundId = "rbxassetid://" .. id
    s.Volume, s.PlaybackSpeed = 1, 1
    s:Play()
    s.Ended:Connect(function() s:Destroy() end)
end

-- Project Baza Local Executor

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "CherickBaza"

-- Toggle Button
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 40, 0, 40)
Toggle.Position = UDim2.new(0, 50, 0.5, -100)
Toggle.Text = "B"
Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Font = Enum.Font.SourceSansBold
Toggle.TextSize = 24
Toggle.Active = true
Toggle.Draggable = true

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 400, 0, 250)
Main.Position = UDim2.new(0, 100, 0.5, -125)
Main.BackgroundColor3 = Color3.fromRGB(86, 20, 201)
Main.Visible = false
Main.Active = true
Main.Draggable = true

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Text = "CherickBaza"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24

-- Script Box
local ScriptBox = Instance.new("TextBox", Main)
ScriptBox.Size = UDim2.new(0, 250, 0, 150)
ScriptBox.Position = UDim2.new(0, 10, 0, 40)
ScriptBox.PlaceholderText = "->scripts->"
ScriptBox.ClearTextOnFocus = false
ScriptBox.Text = "" -- чтобы не было "TextBox"
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.TextWrapped = true
ScriptBox.MultiLine = true
ScriptBox.TextSize = 16
ScriptBox.BackgroundColor3 = Color3.fromRGB(100, 150, 200)
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.Font = Enum.Font.SourceSans

-- Execute Button
local Execute = Instance.new("TextButton", Main)
Execute.Size = UDim2.new(0, 120, 0, 40)
Execute.Position = UDim2.new(0, 270, 0, 40)
Execute.Text = "Execute"
Execute.Font = Enum.Font.SourceSansBold
Execute.TextSize = 18
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.BackgroundColor3 = Color3.fromRGB(90, 90, 90)

-- Clear Button
local Clear = Instance.new("TextButton", Main)
Clear.Size = UDim2.new(0, 120, 0, 40)
Clear.Position = UDim2.new(0, 270, 0, 90)
Clear.Text = "Clear"
Clear.Font = Enum.Font.SourceSansBold
Clear.TextSize = 18
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.BackgroundColor3 = Color3.fromRGB(90, 90, 90)

-- Fe Scripts Button
local FeScripts = Instance.new("TextButton", Main)
FeScripts.Size = UDim2.new(0, 120, 0, 40)
FeScripts.Position = UDim2.new(0, 270, 0, 140)
FeScripts.Text = "Fe Scripts"
FeScripts.Font = Enum.Font.SourceSansBold
FeScripts.TextSize = 18
FeScripts.TextColor3 = Color3.fromRGB(255, 255, 255)
FeScripts.BackgroundColor3 = Color3.fromRGB(90, 90, 90)

-- Credits
local Credits = Instance.new("TextLabel", Main)
Credits.Text = "CherickBaza"
Credits.Size = UDim2.new(1, 0, 0, 30)
Credits.Position = UDim2.new(0, 0, 1, -30)
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1
Credits.Font = Enum.Font.SourceSans
Credits.TextSize = 16

-- Functionality
Toggle.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

Execute.MouseButton1Click:Connect(function()
	local code = ScriptBox.Text
	if code ~= "" then
		local func = loadstring(code)
		if func then
			pcall(func)
		end
	end
end)

Clear.MouseButton1Click:Connect(function()
	ScriptBox.Text = ""
end)

FeScripts.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastebin.com/raw/yL3ZmWXc"))()
end)
