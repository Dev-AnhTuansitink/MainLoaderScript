--Chờ game load
if not game:IsLoaded() then
	game.Loaded:Wait()
end
--chọn team hải quân
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
task.wait(1)

-- // Cấu hình màu sắc (BLUE THEME) \\ --
local THEME_BLUE = Color3.fromRGB(0, 140, 255)       -- Xanh dương đậm
local THEME_BLUE_TEXT = Color3.fromRGB(80, 200, 233) -- Xanh dương sáng (cho chữ)

-- // UI Top (Thanh trạng thái phía trên) \\ --
local Status = Instance.new("ScreenGui")
Status.Name = "Status_UI_Blue"
Status.Parent = game:GetService("CoreGui")
Status.ResetOnSpawn = false
Status.DisplayOrder = 10

local DropShadow2Holder2_1 = Instance.new("Frame")
DropShadow2Holder2_1.Name = "Holder"
DropShadow2Holder2_1.Parent = Status
DropShadow2Holder2_1.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow2Holder2_1.BackgroundTransparency = 1
DropShadow2Holder2_1.Position = UDim2.new(0.5, 0, 0.05, 0)
DropShadow2Holder2_1.Size = UDim2.new(0, 320, 0, 68)

local DropShadow2_1 = Instance.new("ImageLabel")
DropShadow2_1.Name = "Shadow"
DropShadow2_1.Parent = DropShadow2Holder2_1
DropShadow2_1.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow2_1.BackgroundTransparency = 1
DropShadow2_1.Position = UDim2.new(0.5, 0, 0.35, 0)
DropShadow2_1.Size = UDim2.new(1, 47, 1, 47)
DropShadow2_1.Image = "rbxassetid://6015897843"
DropShadow2_1.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow2_1.ImageTransparency = 0.5
DropShadow2_1.ScaleType = Enum.ScaleType.Slice
DropShadow2_1.SliceCenter = Rect.new(49, 49, 450, 450)

local Main_1 = Instance.new("Frame")
Main_1.Name = "MainBoard"
Main_1.Parent = DropShadow2_1
Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
Main_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main_1.BackgroundTransparency = 0.5
Main_1.Position = UDim2.new(0.5, 0, 0.5, 0)
Main_1.Size = UDim2.new(1, -50, 1, -55)

local UIStroke_1 = Instance.new("UIStroke")
UIStroke_1.Parent = Main_1
UIStroke_1.Color = THEME_BLUE -- Viền xanh dương
UIStroke_1.Thickness = 2.5

local Top2_1 = Instance.new("TextLabel")
Top2_1.Name = "Title"
Top2_1.Parent = Main_1
Top2_1.AnchorPoint = Vector2.new(0.5, 0)
Top2_1.BackgroundTransparency = 1
Top2_1.Position = UDim2.new(0.5, 0, 0, 10)
Top2_1.Size = UDim2.new(0, 300, 0, 18)
Top2_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Top2_1.Text = "NatAov Hub Farm Chest Vip"
Top2_1.TextColor3 = THEME_BLUE_TEXT
Top2_1.TextSize = 16

local Under_1 = Instance.new("TextLabel")
Under_1.Name = "Subtitle"
Under_1.Parent = Main_1
Under_1.AnchorPoint = Vector2.new(0.5, 0)
Under_1.BackgroundTransparency = 1
Under_1.Position = UDim2.new(0.5, 0, 0, 30)
Under_1.Size = UDim2.new(0, 450, 0, 18)
Under_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Under_1.Text = "Status: [ Farming ]"
Under_1.TextColor3 = THEME_BLUE_TEXT
Under_1.TextSize = 16

-- // LOGIC FARM & SERVICES \\ --

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser") -- Service dùng cho Anti Kick

local Farming = false
local UncheckedChests = {}
local FirstRun = true

-- ================= ANTI KICK / ANTI AFK =================
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    warn("Anti-Kick: Đã kích hoạt giả lập thao tác để không bị disconnect.")
end)

-- ================= CHARACTER =================
local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    return LocalPlayer.Character
end

-- ================= SORT CHEST =================
local function DistanceFromPlrSort(list)
    local hrp = getCharacter():FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    table.sort(list, function(a, b)
        return (hrp.Position - a.Position).Magnitude < (hrp.Position - b.Position).Magnitude
    end)
end

local function getChestsSorted()
    -- Lấy danh sách rương (chỉ quét map 1 lần đầu để tối ưu)
    if FirstRun then
        FirstRun = false
         for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("Part") and (obj.Name:find("Chest") or obj.Name == "Chest1" or obj.Name == "Chest2" or obj.Name == "Chest3") then
                table.insert(UncheckedChests, obj)
            end
        end
    end

    local Chests = {}
    for _, chest in pairs(UncheckedChests) do
        -- Kiểm tra rương còn tồn tại và chưa bị nhặt
        if chest and chest.Parent and chest:FindFirstChild("TouchInterest") then
             table.insert(Chests, chest)
        end
    end

    DistanceFromPlrSort(Chests)
    return Chests
end

-- ================= NOCLIP + TP =================
local function toggleNoclip(on)
    local char = getCharacter()
    if char then
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = not on
            end
        end
    end
end

local function Teleport(cf)
    local char = getCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") then
        toggleNoclip(true)
        char.HumanoidRootPart.CFrame = cf
        toggleNoclip(false)
    end
end

-- ================= SERVER HOP =================
local function ServerHop()
    warn("Đang tìm server mới...")
    local servers = HttpService:JSONDecode(
        game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    )

    local available = {}
    for _, s in pairs(servers.data) do
        if s.playing < s.maxPlayers and s.id ~= game.JobId then
            table.insert(available, s.id)
        end
    end

    if #available > 0 then
        TeleportService:TeleportToPlaceInstance(
            PlaceId,
            available[math.random(1, #available)],
            LocalPlayer
        )
    else
        warn("Không tìm thấy server, thử lại sau...")
    end
end

-- ================= LOGIC LOOP =================
local function StartFarm()
    if Farming then return end
    Farming = true
    
    -- Vòng lặp Farm
    task.spawn(function()
        while Farming do
            task.wait() -- Tốc độ nhanh nhất có thể
            
            local Chests = getChestsSorted()
            if #Chests > 0 then
                local targetChest = Chests[1]
                -- TP tới rương
                Teleport(targetChest.CFrame)
                
                -- Đợi 1 chút để game nhận diện đã nhặt (tuỳ mạng)
                if (getCharacter().HumanoidRootPart.Position - targetChest.Position).Magnitude < 5 then
                    firetouchinterest(getCharacter().HumanoidRootPart, targetChest, 0)
                    firetouchinterest(getCharacter().HumanoidRootPart, targetChest, 1)
                end
            else
                warn("HẾT RƯƠNG → AUTO HOP SERVER")
                task.wait(1.5)
                ServerHop()
                return
            end
        end
    end)
    
    -- Giữ Noclip liên tục khi farm để không bị kẹt
    task.spawn(function()
        while Farming do
            toggleNoclip(true)
            task.wait(0.1)
        end
        toggleNoclip(false)
    end)
end

local function StopFarm()
    Farming = false
    toggleNoclip(false)
end

-- ================= CONTROL GUI (Bảng điều khiển nhỏ) =================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ChestFarmControl"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 130) -- Thu nhỏ lại cho gọn
frame.Position = UDim2.new(0, 20, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Viền xanh cho bảng điều khiển
local stroke = Instance.new("UIStroke", frame)
stroke.Color = THEME_BLUE
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundTransparency = 1
title.Text = "MENU FARM"
title.TextColor3 = THEME_BLUE_TEXT
title.Font = Enum.Font.GothamBold
title.TextSize = 14

local function makeBtn(text, y, color)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1, -20, 0, 30)
    b.Position = UDim2.new(0, 10, 0, y)
    b.Text = text
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    
    local corner = Instance.new("UICorner", b)
    corner.CornerRadius = UDim.new(0, 6)
    return b
end

local startBtn = makeBtn("▶ START FARM", 35, Color3.fromRGB(0, 140, 255)) -- Nút xanh dương
local stopBtn  = makeBtn("⛔ STOP FARM", 70, Color3.fromRGB(200, 50, 50))
local hopBtn   = makeBtn("🔁 HOP SERVER", 105, Color3.fromRGB(80, 80, 80)) -- Nút xám

startBtn.MouseButton1Click:Connect(function()
    startBtn.Text = "Farming..."
    StartFarm()
end)

stopBtn.MouseButton1Click:Connect(function()
    startBtn.Text = "▶ START FARM"
    StopFarm()
end)

hopBtn.MouseButton1Click:Connect(function()
    ServerHop()
end)

-- ================= RESPAWN FIX =================
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Farming then
        StartFarm()
    end
end)
