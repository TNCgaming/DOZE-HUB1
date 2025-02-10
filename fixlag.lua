-- DOZE-Hub Fix Lag Script
-- Menu tối ưu hóa CPU, giảm ping, tăng FPS cho giả lập Momo Player khi chơi Roblox Blox Fruits

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local ToggleMenuButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local enabled = false
local menuVisible = true

-- Cài đặt GUI
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 200, 0, 120)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -60)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
UICorner:Clone().Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 0, 0)

-- Nút ẩn/hiện menu
ToggleMenuButton.Parent = ScreenGui
ToggleMenuButton.Size = UDim2.new(0, 60, 0, 60)
ToggleMenuButton.Position = UDim2.new(0, 50, 0.2, -25)
ToggleMenuButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleMenuButton.Text = "DOZE"
ToggleMenuButton.Font = Enum.Font.SourceSansBold
ToggleMenuButton.TextSize = 24
ToggleMenuButton.TextColor3 = Color3.fromRGB(255, 0, 0)
UICorner:Clone().Parent = ToggleMenuButton
UIStroke:Clone().Parent = ToggleMenuButton

ToggleMenuButton.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    MainFrame.Visible = menuVisible
end)

-- Nút đóng (dấu X)
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, -15)
CloseButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = CloseButton
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    -- Tắt tối ưu hóa khi đóng menu
    setfpscap(60) -- Khôi phục FPS
    game:GetService("NetworkClient"):SetOutgoingKBPSLimit(999999) -- Khôi phục mạng
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
        task.wait(0.1) -- Tăng hiệu suất bằng cách giảm tải xử lý không cần thiết
        collectgarbage()
end)

-- Nút bật/tắt Fix Lag
ToggleButton.Parent = MainFrame
ToggleButton.Size = UDim2.new(0, 180, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 40)
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.Text = "Fix Lag: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        ToggleButton.Text = "Fix Lag: ON"
        setfpscap(240) -- Tăng FPS
        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(30000) -- Giảm ping
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            end
        end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level1 -- Giảm đồ họa để tăng FPS
    else
        ToggleButton.Text = "Fix Lag: OFF"
        setfpscap(60) -- Khôi phục FPS
        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(999999) -- Khôi phục mạng
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level10
    end
end)

-- Đảm bảo nút ToggleMenuButton có thể click được
ToggleMenuButton.Active = true
ToggleMenuButton.Selectable = true
ToggleMenuButton.AutoButtonColor = true

