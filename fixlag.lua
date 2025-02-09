-- Hub Fix Lag for Roblox (Arceus X) - Redesigned UI

local fixLagEnabled = false
local graphicsReduced = false

-- Create UI Elements
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local ToggleSwitch1 = Instance.new("TextButton", Frame)
local ToggleCircle1 = Instance.new("Frame", ToggleSwitch1)
local ToggleSwitch2 = Instance.new("TextButton", Frame)
local ToggleCircle2 = Instance.new("Frame", ToggleSwitch2)
local CloseButton = Instance.new("TextButton", Frame)
local Label1 = Instance.new("TextLabel", Frame)
local Label2 = Instance.new("TextLabel", Frame)

-- Frame Properties
Frame.Size = UDim2.new(0, 150, 0, 150)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderSizePixel = 0

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0.1, 0)
local FrameStroke = Instance.new("UIStroke", Frame)
FrameStroke.Thickness = 2
FrameStroke.Color = Color3.fromRGB(0, 0, 0)
FrameStroke.Transparency = 0.5

-- Label1 Properties
Label1.Size = UDim2.new(0, 100, 0, 20)
Label1.Position = UDim2.new(0.1, 0, 0.2, 0)
Label1.Text = "Fix Lag"
Label1.Font = Enum.Font.SourceSansBold
Label1.TextSize = 16
Label1.TextColor3 = Color3.fromRGB(255, 255, 255)
Label1.BackgroundTransparency = 1

-- Label2 Properties
Label2.Size = UDim2.new(0, 100, 0, 20)
Label2.Position = UDim2.new(0.1, 0, 0.5, 0)
Label2.Text = "Graphics"
Label2.Font = Enum.Font.SourceSansBold
Label2.TextSize = 16
Label2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label2.BackgroundTransparency = 1

-- Toggle Switch 1 Properties
ToggleSwitch1.Size = UDim2.new(0, 40, 0, 20)
ToggleSwitch1.Position = UDim2.new(0.7, 0, 0.2, 0)
ToggleSwitch1.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleSwitch1.BorderSizePixel = 0
ToggleSwitch1.Text = ""

Instance.new("UICorner", ToggleSwitch1).CornerRadius = UDim.new(1, 0)

-- Toggle Circle 1 Properties
ToggleCircle1.Size = UDim2.new(0, 18, 0, 18)
ToggleCircle1.Position = UDim2.new(0, 1, 0, 1)
ToggleCircle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle1.BorderSizePixel = 0

Instance.new("UICorner", ToggleCircle1).CornerRadius = UDim.new(1, 0)
ToggleCircle1.Parent = ToggleSwitch1

-- Toggle Switch 2 Properties
ToggleSwitch2.Size = UDim2.new(0, 40, 0, 20)
ToggleSwitch2.Position = UDim2.new(0.7, 0, 0.5, 0)
ToggleSwitch2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleSwitch2.BorderSizePixel = 0
ToggleSwitch2.Text = ""

Instance.new("UICorner", ToggleSwitch2).CornerRadius = UDim.new(1, 0)

-- Toggle Circle 2 Properties
ToggleCircle2.Size = UDim2.new(0, 18, 0, 18)
ToggleCircle2.Position = UDim2.new(0, 1, 0, 1)
ToggleCircle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleCircle2.BorderSizePixel = 0

Instance.new("UICorner", ToggleCircle2).CornerRadius = UDim.new(1, 0)
ToggleCircle2.Parent = ToggleSwitch2

-- Close Button Properties
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -10, 0, -10)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 14
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200) -- Màu xám cho chữ "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Nền đen
CloseButton.BorderSizePixel = 0

Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(1, 0)

-- Update Toggle Switch Appearance
local function updateToggleSwitch1()
    if fixLagEnabled then
        ToggleCircle1.Position = UDim2.new(0.5, 1, 0, 1)
        ToggleSwitch1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        ToggleCircle1.Position = UDim2.new(0, 1, 0, 1)
        ToggleSwitch1.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end
end

local function updateToggleSwitch2()
    if graphicsReduced then
        ToggleCircle2.Position = UDim2.new(0.5, 1, 0, 1)
        ToggleSwitch2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        ToggleCircle2.Position = UDim2.new(0, 1, 0, 1)
        ToggleSwitch2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end
end

-- Fix Lag Functionality
local function fixLag()
    local lighting = game.Lighting
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 2
    lighting.TimeOfDay = "14:00:00"

    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Sound") then v.Volume = 0 end
    end

    local character = game.Players.LocalPlayer.Character
    if character then
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("Accessory") or v:IsA("Hat") then v:Destroy() end
        end
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        setfpscap(60)
    end)

    print("Fix Lag đã BẬT!")
end

-- Restore Default Settings
local function restoreDefaults()
    local lighting = game.Lighting
    lighting.GlobalShadows = true
    lighting.FogEnd = 10000
    lighting.Brightness = 1
    lighting.TimeOfDay = "12:00:00"

    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Sound") then v.Volume = 1 end
    end

    print("Fix Lag đã TẮT!")
end

-- Reduce Graphics Functionality
local function reduceGraphics()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.SmoothPlastic
            part.Reflectance = 0
            part.CastShadow = false
        end
    end
    print("Graphics đã được giảm!")
end

-- Restore Graphics
local function restoreGraphics()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.Plastic
            part.Reflectance = 0.2
            part.CastShadow = true
        end
    end
    print("Graphics đã trở lại bình thường!")
end

-- Toggle Fix Lag
ToggleSwitch1.MouseButton1Click:Connect(function()
    fixLagEnabled = not fixLagEnabled
    updateToggleSwitch1()
    if fixLagEnabled then
        fixLag()
    else
        restoreDefaults()
    end
end)

-- Toggle Graphics
ToggleSwitch2.MouseButton1Click:Connect(function()
    graphicsReduced = not graphicsReduced
    updateToggleSwitch2()
    if graphicsReduced then
        reduceGraphics()
    else
        restoreGraphics()
    end
end)

-- Close UI and Restore Defaults
CloseButton.MouseButton1Click:Connect(function()
    fixLagEnabled = false
    graphicsReduced = false
    restoreDefaults()
    restoreGraphics()
    ScreenGui:Destroy()
    print("Giao diện đã đóng và trạng thái mặc định được khôi phục.")
end)

print("Hub Fix Lag đã được tải thành công với giao diện mới!") 
-- Label3 Properties (DOZE HUB)
local Label3 = Instance.new("TextLabel", Frame)
Label3.Size = UDim2.new(0, 150, 0, 20) -- Kích thước khung chữ
Label3.Position = UDim2.new(0, 0, 0.6, 0) -- Vị trí của chữ DOZE HUB
Label3.Text = "DOZE HUB" -- Nội dung chữ
Label3.Font = Enum.Font.SourceSansBold -- Font chữ
Label3.TextSize = 18 -- Kích thước chữ
Label3.TextColor3 = Color3.fromRGB(255, 0, 0) -- Màu đỏ
Label3.BackgroundTransparency = 1 -- Nền trong suốt
Label3.TextScaled = true -- Tự động điều chỉnh kích thước chữ theo khung

-- Label4 Properties (TNCgaming Fix Lag)
local Label4 = Instance.new("TextLabel", Frame)
Label4.Size = UDim2.new(0, 150, 0, 15) -- Kích thước khung chữ nhỏ hơn
Label4.Position = UDim2.new(0, 0, 0.7, 0) -- Vị trí nằm dưới DOZE HUB
Label4.Text = "TNCgaming Fix Lag" -- Nội dung chữ
Label4.Font = Enum.Font.SourceSans -- Font chữ
Label4.TextSize = 14 -- Kích thước chữ nhỏ hơn
Label4.TextColor3 = Color3.fromRGB(255, 255, 255) -- Màu trắng
Label4.BackgroundTransparency = 1 -- Nền trong suốt
Label4.TextScaled = false -- Không tự động điều chỉnh kích thước chữ
-- Label5 Properties (FPS Display)
local Label5 = Instance.new("TextLabel", Frame)
Label5.Size = UDim2.new(0, 150, 0, 20) -- Kích thước khung chữ
Label5.Position = UDim2.new(0, 0, 0.8, 0) -- Vị trí dưới TNCgaming Fix Lag
Label5.Text = "FPS: 0.00" -- Nội dung ban đầu
Label5.Font = Enum.Font.SourceSans -- Font chữ
Label5.TextSize = 16 -- Kích thước chữ
Label5.TextColor3 = Color3.fromRGB(0, 0, 0) -- Màu đen
Label5.BackgroundTransparency = 1 -- Nền trong suốt
Label5.TextScaled = false -- Không tự động điều chỉnh kích thước chữ

-- Function to update FPS
local lastTime = os.clock()
local frameCount = 0

game:GetService("RunService").RenderStepped:Connect(function()
    frameCount += 1
    local currentTime = os.clock()
    if currentTime - lastTime >= 1 then
        local fps = frameCount / (currentTime - lastTime)
        Label5.Text = string.format("FPS: %.2f", fps)
        frameCount = 0
        lastTime = currentTime
    end
end)
