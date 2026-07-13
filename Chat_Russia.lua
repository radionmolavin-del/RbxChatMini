local P = game:GetService("Players")
local whiteList = {
    ["Xrey20052010"] = true,
    ["НИК_ПОКУПАТЕЛЯ_1"] = true,
    ["НИК_ПОКУПАТЕЛЯ_2"] = true,
    ["НИК_ПОКУПАТЕЛЯ_3"] = true,
    ["НИК_ПОКУПАТЕЛЯ_4"] = true,
    ["НИК_ПОКУПАТЕЛЯ_5"] = true,
}

local lp = game:GetService("Players").LocalPlayer
if not whiteList[lp.Name] then 
    return 
end
local TS = game:GetService("TweenService")
local TCS = game:GetService("TextChatService")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local lp = P.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")
if pg:FindFirstChild("AccChat") then pg.AccChat:Destroy() end
local currentScale = 1.0
local lastMainPos = UDim2.new(0.5, -155, 0.4, -90)
local sg = Instance.new("ScreenGui")
sg.Name = "AccChat"
sg.ResetOnSpawn = false
sg.Parent = pg
local mf = Instance.new("Frame")
mf.Size = UDim2.new(0, 310, 0, 180)
mf.Position = lastMainPos
mf.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
mf.BackgroundTransparency = 0.25
mf.Active = true
mf.Draggable = true
mf.Visible = false
mf.Parent = sg
local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 8)
mc.Parent = mf
local tl = Instance.new("TextLabel")
tl.Size = UDim2.new(0, 120, 0, 25)
tl.Position = UDim2.new(0, 8, 0, 0)
tl.BackgroundTransparency = 1
tl.Text = "Accessible Chat"
tl.TextColor3 = Color3.fromRGB(255, 255, 255)
tl.TextSize = 13
tl.Font = Enum.Font.SourceSansBold
tl.TextXAlignment = Enum.TextXAlignment.Left
tl.Parent = mf
local auth = Instance.new("TextLabel")
auth.Size = UDim2.new(0, 100, 0, 25)
auth.Position = UDim2.new(1, -135, 0, 0)
auth.BackgroundTransparency = 1
auth.Text = "By: FaiZi_UwU"
auth.TextColor3 = Color3.fromRGB(136, 136, 136)
auth.TextSize = 12
auth.Font = Enum.Font.SourceSans
auth.TextXAlignment = Enum.TextXAlignment.Right
auth.Parent = mf
local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0, 20, 0, 20)
cb.Position = UDim2.new(1, -22, 0, 3)
cb.BackgroundTransparency = 1
cb.Text = "×"
cb.TextColor3 = Color3.fromRGB(150, 150, 150)
cb.TextSize = 16
cb.Font = Enum.Font.SourceSansBold
cb.Parent = mf
local ob = Instance.new("TextButton")
ob.Size = UDim2.new(0, 35, 0, 35)
ob.Position = UDim2.new(0.5, -17, 0, 10)
ob.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ob.BackgroundTransparency = 0.25
ob.Text = "💬"
ob.TextColor3 = Color3.fromRGB(0, 180, 160)
ob.TextSize = 18
ob.Font = Enum.Font.SourceSansBold
ob.Visible = true
ob.Draggable = true
ob.Parent = sg
local oc = Instance.new("UICorner")
oc.CornerRadius = UDim.new(0, 50)
oc.Parent = ob
local lb = Instance.new("ScrollingFrame")
lb.Size = UDim2.new(1, -16, 0, 110)
lb.Position = UDim2.new(0, 8, 0, 28)
lb.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
lb.BackgroundTransparency = 0.3
lb.BorderSizePixel = 0
lb.CanvasSize = UDim2.new(0, 0, 0, 0)
lb.ScrollBarThickness = 3
lb.Parent = mf
local lc = Instance.new("UICorner")
lc.CornerRadius = UDim.new(0, 4)
lc.Parent = lb
local ll = Instance.new("UIListLayout")
ll.SortOrder = Enum.SortOrder.LayoutOrder
ll.Padding = UDim.new(0, 4)
ll.Parent = lb
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(0, 310, 0, 180)
settingsFrame.Position = lastMainPos
settingsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
settingsFrame.BackgroundTransparency = 0.1
settingsFrame.Active = true
settingsFrame.Draggable = true
settingsFrame.Visible = false
settingsFrame.Parent = sg
local sc = Instance.new("UICorner")
sc.CornerRadius = UDim.new(0, 8)
sc.Parent = settingsFrame
local stl = Instance.new("TextLabel")
stl.Size = UDim2.new(1, 0, 0, 30)
stl.BackgroundTransparency = 1
stl.Text = "Settings"
stl.TextColor3 = Color3.fromRGB(255, 255, 255)
stl.TextSize = 14
stl.Font = Enum.Font.SourceSansBold
stl.Parent = settingsFrame
local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0, 26, 0, 26)
backBtn.Position = UDim2.new(0, 8, 0, 146)
backBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
backBtn.Text = "Back"
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.TextSize = 10
backBtn.Font = Enum.Font.SourceSansBold
backBtn.Parent = settingsFrame
local bkCorner = Instance.new("UICorner")
bkCorner.CornerRadius = UDim.new(0, 4)
bkCorner.Parent = backBtn
local sliderLabel = Instance.new("TextLabel")
sliderLabel.Size = UDim2.new(1, 0, 0, 20)
sliderLabel.Position = UDim2.new(0, 0, 0, 55)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "UI Scale: 100%"
sliderLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
sliderLabel.TextSize = 13
sliderLabel.Font = Enum.Font.SourceSansBold
sliderLabel.Parent = settingsFrame
local sliderTrack = Instance.new("Frame")
sliderTrack.Size = UDim2.new(0, 200, 0, 6)
sliderTrack.Position = UDim2.new(0.5, -100, 0, 85)
sliderTrack.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
sliderTrack.BorderSizePixel = 0
sliderTrack.Parent = settingsFrame
local sliderCorner = Instance.new("UICorner")
sliderCorner.CornerRadius = UDim.new(0, 3)
sliderCorner.Parent = sliderTrack
local sliderBtn = Instance.new("TextButton")
sliderBtn.Size = UDim2.new(0, 16, 0, 16)
sliderBtn.Position = UDim2.new(0, 0, 0.5, -8)
sliderBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 160)
sliderBtn.Text = ""
sliderBtn.Parent = sliderTrack
local sbc = Instance.new("UICorner")
sbc.CornerRadius = UDim.new(0, 8)
sbc.Parent = sliderBtn
local mainScale = Instance.new("UIScale")
mainScale.Parent = mf
local btnScale = Instance.new("UIScale")
btnScale.Parent = ob
local settingsScale = Instance.new("UIScale")
settingsScale.Parent = settingsFrame
local function updateScale(scale)
currentScale = scale
mainScale.Scale = scale
btnScale.Scale = scale
settingsScale.Scale = scale
sliderLabel.Text = "UI Scale: " .. math.floor(scale * 100) .. "%"
end
local isDragging = false
sliderBtn.MouseButton1Down:Connect(function() isDragging = true end)
UIS.InputChanged:Connect(function(input)
if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
local trackPos = sliderTrack.AbsolutePosition.X
local trackWidth = sliderTrack.AbsoluteSize.X
local inputPos = input.Position.X
local percentage = math.clamp((inputPos - trackPos) / trackWidth, 0, 1)
sliderBtn.Position = UDim2.new(percentage, -8, 0.5, -8)
local mappedScale = 0.6 + (percentage * 1.4)
updateScale(mappedScale)
end
end)
UIS.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
isDragging = false
end
end)
local setBtn = Instance.new("TextButton")
setBtn.Size = UDim2.new(0, 26, 0, 26)
setBtn.Position = UDim2.new(0, 8, 0, 146)
setBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
setBtn.Text = "⚙️"
setBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
setBtn.TextSize = 14
setBtn.Font = Enum.Font.SourceSans
setBtn.Parent = mf
local stc = Instance.new("UICorner")
stc.CornerRadius = UDim.new(0, 4)
stc.Parent = setBtn
local tb = Instance.new("TextBox")
tb.Size = UDim2.new(1, -116, 0, 26)
tb.Position = UDim2.new(0, 39, 0, 146)
tb.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
tb.BackgroundTransparency = 0.2
tb.Text = ""
tb.PlaceholderText = "Type your message..."
tb.TextColor3 = Color3.fromRGB(255, 255, 255)
tb.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
tb.TextSize = 13
tb.Font = Enum.Font.SourceSans
tb.ClearTextOnFocus = false
tb.Parent = mf
local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 4)
tc.Parent = tb
local sb = Instance.new("TextButton")
sb.Size = UDim2.new(0, 70, 0, 26)
sb.Position = UDim2.new(1, -78, 0, 146)
sb.BackgroundColor3 = Color3.fromRGB(0, 130, 115)
sb.Text = "SEND"
sb.TextColor3 = Color3.fromRGB(255, 255, 255)
sb.TextSize = 11
sb.Font = Enum.Font.SourceSansBold
sb.Parent = mf
local bc = Instance.new("UICorner")
bc.CornerRadius = UDim.new(0, 4)
bc.Parent = sb
setBtn.MouseButton1Click:Connect(function()
settingsFrame.Position = mf.Position
mf.Visible = false
settingsFrame.Visible = true
end)
backBtn.MouseButton1Click:Connect(function()
mf.Position = settingsFrame.Position
settingsFrame.Visible = false
mf.Visible = true
end)
local function function_add(name, text)
local l = Instance.new("TextLabel")
l.Size = UDim2.new(1, -10, 0, 0)
l.AutomaticSize = Enum.AutomaticSize.Y
l.BackgroundTransparency = 1
l.Text = "[" .. name .. "]: " .. text
l.TextColor3 = Color3.fromRGB(240, 240, 240)
l.TextSize = 13
l.Font = Enum.Font.SourceSans
l.RichText = true
l.TextWrapped = true
l.TextXAlignment = Enum.TextXAlignment.Left
l.Parent = lb
lb.CanvasSize = UDim2.new(0, 0, 0, ll.AbsoluteContentSize.Y + 10)
lb.CanvasPosition = Vector2.new(0, ll.AbsoluteContentSize.Y)
end
local function sendChatMessage(msg)
if msg == "" then return end
if TCS.ChatVersion == Enum.ChatVersion.TextChatService then
local ch = TCS:FindFirstChild("TextChannels") and TCS.TextChannels:FindFirstChild("RBXGeneral")
if ch then ch:SendAsync(msg) return end
end
local r1 = RS:FindFirstChild("DefaultChatSystemChatEvents") and RS.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
if r1 and r1:IsA("RemoteEvent") then r1:FireServer(msg, "All") return end
local r2 = RS:FindFirstChild("Chat") or RS:FindFirstChild("ChatEvent")
if r2 and r2:IsA("RemoteEvent") then r2:FireServer(msg) end
end
local cf = Instance.new("Frame")
cf.Size = UDim2.new(0, 250, 0, 90)
cf.Position = UDim2.new(0.5, -125, 0.5, -45)
cf.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
cf.Visible = false
cf.ZIndex = 7
cf.Parent = sg
local cc = Instance.new("UICorner")
cc.CornerRadius = UDim.new(0, 8)
cc.Parent = cf
local ct = Instance.new("TextLabel")
ct.Size = UDim2.new(1, -20, 0, 40)
ct.Position = UDim2.new(0, 10, 0, 5)
ct.BackgroundTransparency = 1
ct.Text = "Are you sure you want to swipe the script?"
ct.TextColor3 = Color3.fromRGB(230, 230, 230)
ct.TextSize = 13
ct.Font = Enum.Font.SourceSansBold
ct.TextWrapped = true
ct.ZIndex = 7
ct.Parent = cf
local yb = Instance.new("TextButton")
yb.Size = UDim2.new(0, 100, 0, 28)
yb.Position = UDim2.new(0, 15, 0, 50)
yb.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
yb.Text = "Yes"
yb.TextColor3 = Color3.fromRGB(150, 150, 150)
yb.TextSize = 13
yb.Font = Enum.Font.SourceSansBold
yb.ZIndex = 7
yb.Parent = cf
local yc = Instance.new("UICorner")
yc.CornerRadius = UDim.new(0, 6)
yc.Parent = yb
local nb = Instance.new("TextButton")
nb.Size = UDim2.new(0, 100, 0, 28)
nb.Position = UDim2.new(1, -115, 0, 50)
nb.BackgroundColor3 = Color3.fromRGB(0, 150, 136)
nb.Text = "No"
nb.TextColor3 = Color3.fromRGB(255, 255, 255)
nb.TextSize = 13
nb.Font = Enum.Font.SourceSansBold
nb.ZIndex = 7
nb.Parent = cf
local nc = Instance.new("UICorner")
nc.CornerRadius = UDim.new(0, 6)
nc.Parent = nb
mf:GetPropertyChangedSignal("Position"):Connect(function()
if mf.Visible then lastMainPos = mf.Position end
end)
settingsFrame:GetPropertyChangedSignal("Position"):Connect(function()
if settingsFrame.Visible then lastMainPos = settingsFrame.Position end
end)
ob.MouseButton1Click:Connect(function()
if settingsFrame.Visible then
mf.Position = settingsFrame.Position
settingsFrame.Visible = false
mf.Visible = true
else
mf.Visible = not mf.Visible
if mf.Visible then mf.Position = lastMainPos end
end
end)
cb.MouseButton1Click:Connect(function() cf.Visible = true end)
nb.MouseButton1Click:Connect(function() cf.Visible = false end)
yb.MouseButton1Click:Connect(function() sg:Destroy() end)
local function onSend()
local text = tb.Text
if text ~= "" then sendChatMessage(text); tb.Text = "" end
end
sb.MouseButton1Click:Connect(onSend)
tb.FocusLost:Connect(function(enterPressed) if enterPressed then onSend() end end)
if TCS.ChatVersion == Enum.ChatVersion.TextChatService then
local channels = TCS:FindFirstChild("TextChannels")
if channels then
for _, c in ipairs(channels:GetChildren()) do
if c:IsA("TextChannel") then
c.MessageReceived:Connect(function(m)
if m.TextSource and m.Text ~= "" then function_add(m.TextSource.Name, m.Text) end
end)
end
end
channels.ChildAdded:Connect(function(c)
if c:IsA("TextChannel") then
c.MessageReceived:Connect(function(m)
if m.TextSource and m.Text ~= "" then function_add(m.TextSource.Name, m.Text) end
end)
end
end)
end
else
local rm = RS:FindFirstChild("DefaultChatSystemChatEvents")
if rm then
local om = rm:FindFirstChild("OnMessageDoneFiltering")
if om and om:IsA("RemoteEvent") then
om.OnClientEvent:Connect(function(d)
if d and d.FromPlayer and d.Message then function_add(d.FromPlayer.Name or tostring(d.FromPlayer), tostring(d.Message)) end
end)
end
end
end
local startPercentage = (1.0 - 0.6) / 1.4
sliderBtn.Position = UDim2.new(startPercentage, -8, 0.5, -8)
function_add("System", "Welcome to the chat!")
