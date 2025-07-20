-- Xeno Injector UI with Head Hitbox Customization
-- Press K to toggle visibility, drag with mouse to move

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Main GUI setup
local XenoUI = Instance.new("ScreenGui")
XenoUI.Name = "XenoInjectorUI"
XenoUI.ResetOnSpawn = false
XenoUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame with rounded corners and blur
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = XenoUI

-- Add blur effect
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 8
BlurEffect.Parent = MainFrame

-- Round corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(1, -10, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Xeno Injector v1.2"
TitleText.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.Parent = TitleBar

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.white
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseButton

-- Content frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Head hitbox section
local HitboxSection = Instance.new("Frame")
HitboxSection.Name = "HitboxSection"
HitboxSection.Size = UDim2.new(1, 0, 0, 100)
HitboxSection.BackgroundTransparency = 1
HitboxSection.Parent = ContentFrame

local HitboxTitle = Instance.new("TextLabel")
HitboxTitle.Name = "HitboxTitle"
HitboxTitle.Size = UDim2.new(1, 0, 0, 20)
HitboxTitle.BackgroundTransparency = 1
HitboxTitle.Text = "Head Hitbox Settings"
HitboxTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
HitboxTitle.Font = Enum.Font.GothamSemibold
HitboxTitle.TextSize = 14
HitboxTitle.TextXAlignment = Enum.TextXAlignment.Left
HitboxTitle.Parent = HitboxSection

local HitboxSlider = Instance.new("Frame")
HitboxSlider.Name = "HitboxSlider"
HitboxSlider.Size = UDim2.new(1, 0, 0, 50)
HitboxSlider.Position = UDim2.new(0, 0, 0, 25)
HitboxSlider.BackgroundTransparency = 1
HitboxSlider.Parent = HitboxSection

local SliderBG = Instance.new("Frame")
SliderBG.Name = "SliderBG"
SliderBG.Size = UDim2.new(1, 0, 0, 5)
SliderBG.Position = UDim2.new(0, 0, 0, 20)
SliderBG.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
SliderBG.BorderSizePixel = 0
SliderBG.Parent = HitboxSlider

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(1, 0)
SliderCorner.Parent = SliderBG

local SliderFill = Instance.new("Frame")
SliderFill.Name = "SliderFill"
SliderFill.Size = UDim2.new(0.5, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
SliderFill.BorderSizePixel = 0
SliderFill.Parent = SliderBG

local SliderFillCorner = Instance.new("UICorner")
SliderFillCorner.CornerRadius = UDim.new(1, 0)
SliderFillCorner.Parent = SliderFill

local SliderButton = Instance.new("TextButton")
SliderButton.Name = "SliderButton"
SliderButton.Size = UDim2.new(0, 20, 0, 20)
SliderButton.Position = UDim2.new(0.5, -10, 0, 10)
SliderButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
SliderButton.Text = ""
SliderButton.Parent = HitboxSlider

local SliderButtonCorner = Instance.new("UICorner")
SliderButtonCorner.CornerRadius = UDim.new(1, 0)
SliderButtonCorner.Parent = SliderButton

local ValueBox = Instance.new("TextBox")
ValueBox.Name = "ValueBox"
ValueBox.Size = UDim2.new(0, 60, 0, 25)
ValueBox.Position = UDim2.new(0.5, -30, 0, 40)
ValueBox.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
ValueBox.TextColor3 = Color3.fromRGB(220, 220, 220)
ValueBox.Text = "5.0"
ValueBox.Font = Enum.Font.Gotham
ValueBox.TextSize = 14
ValueBox.Text = "5.0"
ValueBox.Parent = HitboxSlider

local ValueBoxCorner = Instance.new("UICorner")
ValueBoxCorner.CornerRadius = UDim.new(0, 6)
ValueBoxCorner.Parent = ValueBox

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Name = "ValueLabel"
ValueLabel.Size = UDim2.new(1, 0, 0, 15)
ValueLabel.Position = UDim2.new(0, 0, 0, 0)
ValueLabel.BackgroundTransparency = 1
ValueLabel.Text = "Hitbox Size:"
ValueLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
ValueLabel.Font = Enum.Font.Gotham
ValueLabel.TextSize = 12
ValueLabel.TextXAlignment = Enum.TextXAlignment.Left
ValueLabel.Parent = HitboxSlider

-- Status section
local StatusSection = Instance.new("Frame")
StatusSection.Name = "StatusSection"
StatusSection.Size = UDim2.new(1, 0, 0, 50)
StatusSection.Position = UDim2.new(0, 0, 0, 110)
StatusSection.BackgroundTransparency = 1
StatusSection.Parent = ContentFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = StatusSection

local InjectButton = Instance.new("TextButton")
InjectButton.Name = "InjectButton"
InjectButton.Size = UDim2.new(1, 0, 0, 30)
InjectButton.Position = UDim2.new(0, 0, 0, 25)
InjectButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
InjectButton.Text = "INJECT"
InjectButton.TextColor3 = Color3.white
InjectButton.Font = Enum.Font.GothamBold
InjectButton.TextSize = 14
InjectButton.Parent = StatusSection

local InjectCorner = Instance.new("UICorner")
InjectCorner.CornerRadius = UDim.new(0, 6)
InjectCorner.Parent = InjectButton

-- Variables
local dragging = false
local dragInput, dragStart, startPos
local headHitboxSize = 5.0
local uiVisible = true

-- Functions
local function updateHitboxSize(value)
    headHitboxSize = math.clamp(tonumber(value) or 5.0, 1.0, 20.0)
    ValueBox.Text = string.format("%.1f", headHitboxSize)
    SliderFill.Size = UDim2.new((headHitboxSize - 1) / 19, 0, 1, 0)
    SliderButton.Position = UDim2.new((headHitboxSize - 1) / 19, -10, 0, 10)
end

local function toggleUI()
    uiVisible = not uiVisible
    MainFrame.Visible = uiVisible
end

-- Slider logic
local function sliderInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

local function sliderInputChanged(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local sliderPercent = (input.Position.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X
        sliderPercent = math.clamp(sliderPercent, 0, 1)
        local newValue = 1 + sliderPercent * 19
        updateHitboxSize(newValue)
    end
end

-- Input validation for text box
ValueBox.FocusLost:Connect(function()
    local text = ValueBox.Text
    if string.match(text, "^[%d%.]+$") then
        updateHitboxSize(tonumber(text))
    else
        ValueBox.Text = string.format("%.1f", headHitboxSize)
    end
end)

-- Only allow numbers and decimal point in the text box
ValueBox:GetPropertyChangedSignal("Text"):Connect(function()
    local text = ValueBox.Text
    if not string.match(text, "^[%d%.]*$") then
        ValueBox.Text = string.gsub(text, "[^%d%.]", "")
    end
end)

-- Slider events
SliderButton.InputBegan:Connect(sliderInputBegan)
SliderBG.InputBegan:Connect(sliderInputBegan)

SliderButton.InputChanged:Connect(sliderInputChanged)
SliderBG.InputChanged:Connect(sliderInputChanged)

-- Toggle UI with K key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.K then
        toggleUI()
    end
end)

-- Close button
CloseButton.MouseButton1Click:Connect(toggleUI)

-- Inject button functionality
InjectButton.MouseButton1Click:Connect(function()
    StatusLabel.Text = "Status: Injected"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    -- Here you would add your actual injection logic
    -- For example, modifying the head hitbox of players
    warn("Xeno injected with head hitbox size:", headHitboxSize)
end)

-- Initial setup
updateHitboxSize(5.0)
XenoUI.Parent = game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
