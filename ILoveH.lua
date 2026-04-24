-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- Frame chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 180)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Bo góc
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Đổ bóng giả (UIStroke nhẹ)
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Transparency = 0.7
UIStroke.Parent = MainFrame

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "NatAov Hub Đã Nâng Cấp"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Nội dung
local Content = Instance.new("TextLabel")
Content.Size = UDim2.new(1, -20, 0, 60)
Content.Position = UDim2.new(0, 10, 0, 45)
Content.BackgroundTransparency = 1
Content.Text = "VUI LÒNG VÀO DISCORD ĐỂ LẤY SCRIPT MỚI NHẤT !!"
Content.TextWrapped = true
Content.TextColor3 = Color3.fromRGB(255,255,255)
Content.TextScaled = true
Content.Font = Enum.Font.Gotham
Content.Parent = MainFrame

-- Nút copy
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.8, 0, 0, 35)
Button.Position = UDim2.new(0.1, 0, 1, -45)
Button.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
Button.Text = "COPY DISCORD LINK"
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold
Button.Parent = MainFrame

-- Bo góc nút
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = Button

-- Copy link (setclipboard)
Button.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/h3jnnm7W")
        Button.Text = "SAO CHÉP!"
    else
        Button.Text = "KHÔNG HỖ TRỢ!"
    end
end)

-- Animation mở (Tween)
local TweenService = game:GetService("TweenService")

MainFrame.Position = UDim2.new(0.5, -175, 1, 0)

local tween = TweenService:Create(
    MainFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Position = UDim2.new(0.5, -175, 0.5, -90)}
)

tween:Play()