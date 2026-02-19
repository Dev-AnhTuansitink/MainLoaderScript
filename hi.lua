--Chờ game load
if not game:IsLoaded() then
	game.Loaded:Wait()
end
--chọn team hải quân
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
task.wait(1
)
-- // Cấu hình màu sắc (BLUE THEME) \\ --
local THEME_BLUE = Color3.fromRGB(0, 150, 255)      -- Xanh dương chính
local THEME_BLUE_LIGHT = Color3.fromRGB(100, 210, 255) -- Xanh dương nhạt
local TEXT_COLOR = Color3.fromRGB(80, 180, 233)     -- Màu chữ xanh nhạt

-- // UI Top (Gọn nhẹ) \\ --
local Status = Instance.new("ScreenGui")
Status.Name = "Status"
Status.Parent = game:GetService("CoreGui")
Status.ResetOnSpawn = false
Status.DisplayOrder = 10

local DropShadow2Holder2_1 = Instance.new("Frame")
DropShadow2Holder2_1.Name = "DropShadow2Holder2"
DropShadow2Holder2_1.Parent = Status
DropShadow2Holder2_1.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow2Holder2_1.BackgroundColor3 = Color3.fromRGB(163,163,163)
DropShadow2Holder2_1.BackgroundTransparency = 1
DropShadow2Holder2_1.BorderSizePixel = 0
DropShadow2Holder2_1.Position = UDim2.new(0.5, 0, 0.05, 0)
DropShadow2Holder2_1.Size = UDim2.new(0, 320, 0, 68)
DropShadow2Holder2_1.ZIndex = 0

local DropShadow2_1 = Instance.new("ImageLabel")
DropShadow2_1.Name = "DropShadow2"
DropShadow2_1.Parent = DropShadow2Holder2_1
DropShadow2_1.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow2_1.BackgroundColor3 = Color3.fromRGB(163,162,165)
DropShadow2_1.BackgroundTransparency = 1
DropShadow2_1.BorderSizePixel = 0
DropShadow2_1.Position = UDim2.new(0.5, 0, 0.35, 0)
DropShadow2_1.Size = UDim2.new(1, 47, 1, 47)
DropShadow2_1.ZIndex = 0
DropShadow2_1.Image = "rbxassetid://6015897843"
DropShadow2_1.ImageColor3 = Color3.fromRGB(0,0,0)
DropShadow2_1.ImageTransparency = 0.5
DropShadow2_1.ScaleType = Enum.ScaleType.Slice
DropShadow2_1.SliceCenter = Rect.new(49, 49, 450, 450)

local Main_1 = Instance.new("Frame")
Main_1.Name = "Main"
Main_1.Parent = DropShadow2_1
Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
Main_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main_1.BackgroundTransparency = 0.5
Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
Main_1.BorderSizePixel = 0
Main_1.Position = UDim2.new(0.5, 0, 0.5, 0)
Main_1.Size = UDim2.new(1, -50, 1, -55)

local UIStroke_1 = Instance.new("UIStroke")
UIStroke_1.Parent = Main_1
UIStroke_1.Color = THEME_BLUE -- Viền xanh dương
UIStroke_1.Thickness = 2.5

-- [DÒNG TRÊN: HIỂN THỊ TRẠNG THÁI]
local Top2_1 = Instance.new("TextLabel")
Top2_1.Name = "Top2"
Top2_1.Parent = Main_1
Top2_1.AnchorPoint = Vector2.new(0.5, 0)
Top2_1.BackgroundColor3 = Color3.fromRGB(163,162,165)
Top2_1.BackgroundTransparency = 1
Top2_1.Position = UDim2.new(0.5, 0, 0, 10)
Top2_1.Size = UDim2.new(0, 300, 0, 18)
Top2_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Top2_1.Text = "Status: SẴN SÀNG... 💤" 
Top2_1.TextColor3 = TEXT_COLOR
Top2_1.TextSize = 16
Top2_1.TextWrapped = true

-- [DÒNG DƯỚI: HIỂN THỊ SỐ RƯƠNG]
local Under_1 = Instance.new("TextLabel")
Under_1.Name = "Under"
Under_1.Parent = Main_1
Under_1.AnchorPoint = Vector2.new(0.5, 0)
Under_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Under_1.BackgroundTransparency = 1
Under_1.Position = UDim2.new(0.5, 0, 0, 30)
Under_1.Size = UDim2.new(0, 450, 0, 18)
Under_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Under_1.Text = "Rương đã nhặt: 0"
Under_1.TextColor3 = TEXT_COLOR
Under_1.TextSize = 14

local TextLabel_1 = Instance.new("TextLabel")
TextLabel_1.Parent = Status
TextLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_1.BackgroundColor3 = Color3.fromRGB(163,162,165)
TextLabel_1.BackgroundTransparency = 1
TextLabel_1.Position = UDim2.new(0.5, 0, -0.025, 0)
TextLabel_1.Size = UDim2.new(0, 210, 0, 50)
TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
TextLabel_1.Text = "https://discord.gg/FNns5gAb2b"
TextLabel_1.TextColor3 = TEXT_COLOR
TextLabel_1.TextSize = 16

local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Parent = TextLabel_1
UIStroke_2.Thickness = 1
UIStroke_2.Color = THEME_BLUE

-- ================= SERVICES =================
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

-- ================= BIẾN & LOGIC MỚI =================
local Farming = false
local UncheckedChests, FirstRun = {}, true
local ChestCount = 0

-- [BIẾN CỦA BẠN]
local CountedChests = {} 
local CurrentTarget = nil

-- Hàm kiểm tra rương biến mất (Logic của bạn)
local function IsChestGone(chest)
    return not chest 
        or not chest.Parent 
        or not chest:IsDescendantOf(workspace)
end

-- Hàm cập nhật text lên Status UI
local function UpdateStatus(mode)
    -- Cập nhật số rương (luôn giống nhau ở mọi trạng thái)
    Under_1.Text = "Rương đã nhặt: " .. ChestCount

    -- Cập nhật trạng thái (ở dòng trên)
    if mode == "Run" then
        Top2_1.Text = "Status: ĐANG CHẠY 🟢"
    elseif mode == "Stop" then
        Top2_1.Text = "Status: ĐÃ DỪNG 🔴"
    elseif mode == "Hop" then
        Top2_1.Text = "Status: ĐỔI SERVER 🔄"
    end
end

-- ================= CHARACTER =================
local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    return LocalPlayer.Character
end

-- ================= SORT CHEST =================
local function DistanceFromPlrSort(list)
    local hrp = getCharacter().HumanoidRootPart
    table.sort(list, function(a, b)
        return (hrp.Position - a.Position).Magnitude <
               (hrp.Position - b.Position).Magnitude
    end)
end

local function getChestsSorted()
    if FirstRun then
        FirstRun = false
        for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("Part") and obj.Name:find("Chest") then
                table.insert(UncheckedChests, obj)
            end
        end
    end

    local Chests = {}
    for _, chest in pairs(UncheckedChests) do
        -- Lọc những rương còn TouchInterest và chưa bị đếm (hoặc chưa mất)
        if chest:FindFirstChild("TouchInterest") then
            table.insert(Chests, chest)
        end
    end

    DistanceFromPlrSort(Chests)
    return Chests
end

-- ================= NOCLIP + TP =================
local function toggleNoclip(on)
    for _, v in pairs(getCharacter():GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = not on
        end
    end
end

local function Teleport(cf)
    local hrp = getCharacter().HumanoidRootPart
    toggleNoclip(true)
    hrp.CFrame = cf + Vector3.new(0, 3, 0)
    toggleNoclip(false)
end

-- ================= SERVER HOP =================
local function ServerHop()
    UpdateStatus("Hop")
    
    local servers = HttpService:JSONDecode(
        game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    )

    local available = {}
    for _, s in pairs(servers.data) do
        if s.playing < s.maxPlayers then
            table.insert(available, s.id)
        end
    end

    if #available > 0 then
        TeleportService:TeleportToPlaceInstance(
            PlaceId,
            available[math.random(1, #available)],
            LocalPlayer
        )
    end
end

-- ================= FARM (LOGIC MỚI CỦA BẠN) =================
local function StartFarm()
    if Farming then return end
    Farming = true
    CurrentTarget = nil
    CountedChests = {} -- Reset danh sách đếm mỗi lần bật lại
    UpdateStatus("Run")

    task.spawn(function()
        while Farming do
            task.wait(0.2)

            local Chests = getChestsSorted()

            -- Nếu đang có target cũ → kiểm tra nó đã biến mất chưa
            if CurrentTarget then
                if IsChestGone(CurrentTarget) then
                    if not CountedChests[CurrentTarget] then
                        CountedChests[CurrentTarget] = true
                        ChestCount = ChestCount + 1 -- Luau support += but explicit is safe
                        UpdateStatus("Run")
                    end
                    CurrentTarget = nil
                end
            end

            if #Chests > 0 then
                local newTarget = Chests[1]

                -- Nếu đổi target → chỉ đổi khi target cũ đã biến mất hoặc chưa có target
                if not CurrentTarget then
                    CurrentTarget = newTarget
                end

                if CurrentTarget then
                    Teleport(CurrentTarget.CFrame)
                end
            else
                -- Không còn rương
                if not CurrentTarget then
                    warn("HẾT RƯƠNG → AUTO HOP SERVER")
                    task.wait(1)
                    ServerHop()
                    return
                end
            end
        end
    end)
end

local function StopFarm()
    Farming = false
    UpdateStatus("Stop")
end

-- ================= GUI CONTROL =================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ChestFarmGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 170)
frame.Position = UDim2.new(0, 20, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true

local function makeBtn(text, y, color)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1, -20, 0, 40)
    b.Position = UDim2.new(0, 10, 0, y)
    b.Text = text
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1)
    return b
end

local startBtn = makeBtn("▶ START FARM", 10, Color3.fromRGB(0,170,0))
local stopBtn  = makeBtn("⛔ STOP FARM", 60, Color3.fromRGB(170,0,0))
local hopBtn   = makeBtn("🔁 HOP SERVER", 110, Color3.fromRGB(0,120,170))

startBtn.MouseButton1Click:Connect(StartFarm)
stopBtn.MouseButton1Click:Connect(StopFarm)
hopBtn.MouseButton1Click:Connect(function()
    warn("HOP SERVER THỦ CÔNG")
    ServerHop()
end)

-- ================= RESPAWN SAFE =================
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Farming then
        StartFarm()
    end
end)
