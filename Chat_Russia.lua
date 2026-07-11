local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("MiniChatSender") then
	PlayerGui.MiniChatSender:Destroy()
end

local function sendChatMessage(message)
	if message == "" then return end
	
	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local rbxGeneral = TextChatService:FindFirstChild("TextChannels") and TextChatService.TextChannels:FindFirstChild("RBXGeneral")
		if rbxGeneral then rbxGeneral:SendAsync(message) return end
	end
	
	local legacyRemote = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
	if legacyRemote and legacyRemote:IsA("RemoteEvent") then
		legacyRemote:FireServer(message, "All")
		return
	end
	
	local chatEvent = ReplicatedStorage:FindFirstChild("Chat")
	if chatEvent and chatEvent:IsA("RemoteEvent") then
		chatEvent:FireServer(message)
		return
	end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiniChatSender"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 75)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, -37)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 22)
Title.BackgroundTransparency = 1
Title.Text = "  Chat Mini"
Title.TextColor3 = Color3.fromRGB(180, 180, 180)
Title.TextSize = 12
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -22, 0, 2)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(150, 150, 150)
MinimizeButton.TextSize = 14
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.Parent = MainFrame

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 25, 0, 25)
OpenButton.Position = UDim2.new(0.5, -12, 0.4, -12)
OpenButton.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
OpenButton.BorderSizePixel = 0
OpenButton.Text = "C"
OpenButton.TextColor3 = Color3.fromRGB(0, 180, 160)
OpenButton.TextSize = 14
OpenButton.Font = Enum.Font.SourceSansBold
OpenButton.Visible = false
OpenButton.Draggable = true
OpenButton.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 6)
OpenCorner.Parent = OpenButton

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -16, 0, 22)
TextBox.Position = UDim2.new(0, 8, 0, 22)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "Текст..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = MainFrame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 4)
TextBoxCorner.Parent = TextBox

local SendButton = Instance.new("TextButton")
SendButton.Size = UDim2.new(1, -16, 0, 20)
SendButton.Position = UDim2.new(0, 8, 0, 48)
SendButton.BackgroundColor3 = Color3.fromRGB(0, 130, 115)
SendButton.BorderSizePixel = 0
SendButton.Text = "ОТПРАВИТЬ"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 12
SendButton.Font = Enum.Font.SourceSansBold
SendButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 4)
ButtonCorner.Parent = SendButton

SendButton.MouseEnter:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 160, 140)}):Play()
end)
SendButton.MouseLeave:Connect(function()
	TweenService:Create(SendButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 130, 115)}):Play()
end)

MinimizeButton.MouseEnter:Connect(function() MinimizeButton.TextColor3 = Color3.fromRGB(255, 100, 100) end)
MinimizeButton.MouseLeave:Connect(function() MinimizeButton.TextColor3 = Color3.fromRGB(150, 150, 150) end)

MinimizeButton.MouseButton1Click:Connect(function()
	OpenButton.Position = MainFrame.Position
	MainFrame.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Position = OpenButton.Position
	OpenButton.Visible = false
	MainFrame.Visible = true
end)

SendButton.MouseButton1Click:Connect(function()
	local text = TextBox.Text
	if text ~= "" then
		sendChatMessage(text)
		TextBox.Text = ""
	end
end)

TextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local text = TextBox.Text
		if text ~= "" then
			sendChatMessage(text)
			TextBox.Text = ""
		end
	end
end)
