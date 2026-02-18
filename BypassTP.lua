--[[
    BLOX FRUITS ULTIMATE BYPASS V4 (NO TWEEN)
    Upgrade: Smart Anchor + Auto Unsit + Fast Respawn
    Support: Sea 1, 2, 3
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local LP = Players.LocalPlayer

--/// CẤU HÌNH TỐI ƯU ///--
getgenv().Config = {
    MaxStep = 2000,       -- Khoảng cách tối đa (Giữ thấp để bắt buộc đi qua đảo trung gian)
    AnchorTime = 0.6,     -- Thời gian ghim vị trí (Tăng lên 0.8 nếu mạng lag)
    StopDist = 200,       -- Khoảng cách dừng khi đến đích
}

local State = {
    Running = false,
    TargetIsland = "",
    Status = "Chờ lệnh..."
}

--/// DATA MAP (CHUẨN HÓA 3 SEA) ///--
local PlaceID = game.PlaceId
local MapData = {}
local AllIslands = {}

-- Hàm lấy tên Sea để hiển thị
local function GetSeaName()
    if PlaceID == 2753915549 then return "Sea 1"
    elseif PlaceID == 4442272183 then return "Sea 2"
    elseif PlaceID == 7449423635 then return "Sea 3"
    else return "Unknown" end
end

-- Data Tọa độ
if PlaceID == 2753915549 then -- Sea 1
    MapData = {
        ["Starter Marine"] = Vector3.new(-2566, 6, 2045),
        ["Starter Pirate"] = Vector3.new(1048, 16, 1422),
        ["Jungle"] = Vector3.new(-1432, 13, 337),
        ["Middletown"] = Vector3.new(-690, 14, 1583),
        ["Frozen Village"] = Vector3.new(1159, 14, -1326),
        ["Marine Fortress"] = Vector3.new(-4996, 21, 4296),
        ["Skylands"] = Vector3.new(-4854, 717, -2609),
        ["Prison"] = Vector3.new(4854, 5, 755),
        ["Colosseum"] = Vector3.new(-1480, 7, -2888),
        ["Magma Village"] = Vector3.new(-5315, 12, 8515),
        ["Underwater City"] = Vector3.new(61163, 11, 1819),
        ["Fountain City"] = Vector3.new(5259, 4, 4105),
    }
elseif PlaceID == 4442272183 then -- Sea 2
    MapData = {
        ["Cafe"] = Vector3.new(-367, 74, 296),
        ["Green Zone"] = Vector3.new(-2552, 73, -3172),
        ["Graveyard"] = Vector3.new(-5410, 8, -754),
        ["Snow Mountain"] = Vector3.new(579, 401, -5427),
        ["Hot and Cold"] = Vector3.new(-5657, 9, 8731),
        ["Cursed Ship"] = Vector3.new(923, 126, 32742),
        ["Ice Castle"] = Vector3.new(5566, 29, -6226),
        ["Forgotten Island"] = Vector3.new(-3054, 237, -10148),
        ["Dark Arena"] = Vector3.new(3809, 7, -3028),
        ["Usoap Island"] = Vector3.new(4816, 8, 2863),
        ["Mansion"] = Vector3.new(-288, 300, -10075)
    }
elseif PlaceID == 7449423635 then -- Sea 3
    MapData = {
        ["Port Town"] = Vector3.new(-266, 7, 5323),
        ["Hydra Island"] = Vector3.new(5453, 602, 597),
        ["Great Tree"] = Vector3.new(2453, 56, -7257),
        ["Floating Turtle"] = Vector3.new(-11632, 332, -8913),
        ["Castle on the Sea"] = Vector3.new(-5036, 315, -2977),
        ["Haunted Castle"] = Vector3.new(-9537, 143, 5683),
        ["Sea of Treats"] = Vector3.new(-2055, 39, -13735),
        ["Mansion"] = Vector3.new(-12429, 332, -8756),
        ["Tiki Outpost"] = Vector3.new(-16218, 9, 445)
    }
end

for k,v in pairs(MapData) do table.insert(AllIslands, k) end
table.sort(AllIslands)

--/// SYSTEM FUNCTIONS ///--
local function Notify(Title, Text, Time)
    StarterGui:SetCore("SendNotification", {Title = Title, Text = Text, Duration = Time or 3})
end

local function GetChar()
    local Char = LP.Character
    if not Char then return nil, nil, nil end
    return Char, Char:FindFirstChild("HumanoidRootPart"), Char:FindFirstChild("Humanoid")
end

local function Dist(v1, v2) return (v1 - v2).Magnitude end

--/// LOGIC TÌM ĐƯỜNG (DIJKSTRA) ///--
local function FindPath(Start, End)
    local Nodes = AllIslands
    local Distances = {}
    local Previous = {}
    local Queue = {}

    for _, node in ipairs(Nodes) do
        Distances[node] = math.huge
        table.insert(Queue, node)
    end
    Distances[Start] = 0

    while #Queue > 0 do
        table.sort(Queue, function(a, b) return Distances[a] < Distances[b] end)
        local u = table.remove(Queue, 1)
        if u == End then break end
        if Distances[u] == math.huge then break end 

        for _, v in ipairs(Nodes) do
            if MapData[u] and MapData[v] then
                local d = Dist(MapData[u], MapData[v])
                if d <= getgenv().Config.MaxStep then
                    local alt = Distances[u] + d
                    if alt < Distances[v] then
                        Distances[v] = alt
                        Previous[v] = u
                    end
                end
            end
        end
    end

    local Path = {}
    local curr = End
    if Distances[End] == math.huge then return nil end

    while Previous[curr] do
        table.insert(Path, 1, curr)
        curr = Previous[curr]
    end
    if curr == Start then table.insert(Path, 1, Start) end
    return Path
end

local function GetClosestIsland()
    local _, HRP, _ = GetChar()
    if not HRP then return nil end
    local Best, MinD = nil, math.huge
    for name, pos in pairs(MapData) do
        local d = Dist(HRP.Position, pos)
        if d < MinD then Best, MinD = name, d end
    end
    return Best
end

--/// BYPASS CORE ACTION (UPGRADED) ///--
local function PerformBypass(TargetPos)
    local _, HRP, Hum = GetChar()
    if not HRP or not Hum then return end

    -- 1. Auto Unsit (Nhảy khỏi ghế)
    if Hum.Sit then Hum.Sit = false task.wait(0.1) end

    -- 2. Smart Anchor (Ghim vị trí chặt hơn)
    local Timer = tick()
    local TargetCF = CFrame.new(TargetPos)
    
    -- Vòng lặp này vừa TP vừa khóa vận tốc liên tục
    local AnchorConnection
    AnchorConnection = RunService.Heartbeat:Connect(function()
        if HRP and State.Running then
            HRP.CFrame = TargetCF
            HRP.AssemblyLinearVelocity = Vector3.zero 
            HRP.AssemblyAngularVelocity = Vector3.zero
        end
    end)

    -- Giữ trong thời gian quy định
    repeat task.wait() until tick() - Timer > getgenv().Config.AnchorTime or not State.Running
    
    if AnchorConnection then AnchorConnection:Disconnect() end

    -- 3. Reset (Kill)
    if State.Running and Hum then
        Hum.Health = 0
    end
end

--/// MAIN THREAD ///--
task.spawn(function()
    while task.wait(0.5) do
        if State.Running and State.TargetIsland ~= "" then
            pcall(function()
                local _, HRP, Hum = GetChar()
                
                -- Check Dead
                if not HRP or not Hum or Hum.Health <= 0 then
                    State.Status = "Đang hồi sinh..."
                    task.wait(0.5)
                    return 
                end

                -- Check Arrival
                local FinalDest = MapData[State.TargetIsland]
                if Dist(HRP.Position, FinalDest) < getgenv().Config.StopDist then
                    State.Running = false
                    State.Status = "ĐÃ ĐẾN NƠI!"
                    Notify("Thành Công", "Chào mừng tới " .. State.TargetIsland, 5)
                    return
                end

                -- Pathfinding
                local StartNode = GetClosestIsland()
                local Path = FindPath(StartNode, State.TargetIsland)

                if Path and #Path >= 2 then
                    local NextStop = Path[2]
                    
                    -- Preview Route log
                    if State.Status ~= "Đi tới: " .. NextStop then
                        print("Next Stop: " .. NextStop)
                    end
                    
                    State.Status = "Đi tới: " .. NextStop
                    Notify("Bypass V4", "Trạm kế: " .. NextStop, 1.5)
                    
                    -- Execute
                    PerformBypass(MapData[NextStop])
                    
                    -- Smart Wait Respawn
                    local WaitTimer = 0
                    repeat 
                        task.wait(0.2) -- Check nhanh hơn
                        WaitTimer = WaitTimer + 0.2
                    until (LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.Humanoid.Health > 0) or WaitTimer > 15
                    
                    task.wait(1.2) -- Đợi load map ổn định
                else
                    State.Status = "Lỗi đường đi (Quá xa)"
                    Notify("Lỗi", "Không có đường nối đến đảo này!", 3)
                    State.Running = false
                end
            end)
        else
            if not State.Running then State.Status = "Đang tắt" end
        end
    end
end)

--/// UI INTERFACE (Banana Style) ///--
local Library = loadstring(game:HttpGet("https://luacrack.site/index.php/araujozwx/raw/SourceBananaUi"))()

local Window = Library:CreateWindow({
    Title = "Bypass V4 Pro",
    Desc = GetSeaName() .. " | No Tween",
    Image = "rbxassetid://105245380363493"
})

local Tab1 = Window:AddTab("Dashboard", "rbxassetid://7733960981") 
local Section1 = Tab1:AddLeftGroupbox("Điều Khiển")
local Section2 = Tab1:AddRightGroupbox("Thông Tin")

Section1:AddDropdown("IslandSelect", {
    Title = "Chọn Đảo Đích (Destination)",
    Values = AllIslands,
    Default = "",
    Multi = false,
    Search = true,
    Callback = function(Value)
        State.TargetIsland = Value
        -- Preview Lộ trình ngay khi chọn
        local Start = GetClosestIsland()
        local Path = FindPath(Start, Value)
        if Path then
            local str = ""
            for i,v in pairs(Path) do str = str .. v .. " > " end
            print("Lộ trình dự kiến: " .. str)
            Notify("Lộ trình", "Check F9 để xem đường đi", 2)
        end
    end
})

Section1:AddToggle("ToggleTP", {
    Title = "BẮT ĐẦU (START)",
    Default = false,
    Callback = function(Value)
        State.Running = Value
        if Value then Notify("System", "Bắt đầu hành trình...", 2) end
    end
})

Section1:AddSlider("DelaySlider", {
    Title = "Thời gian Ghim (Anchor Time)",
    Default = 6, -- Chia 10 = 0.6s
    Min = 4,
    Max = 15,
    Rounding = 0,
    Callback = function(Value)
        getgenv().Config.AnchorTime = Value / 10
    end
})

Section1:AddButton({
    Title = "Force Reset (Sửa kẹt)",
    Callback = function()
        local _, _, Hum = GetChar()
        if Hum then Hum.Health = 0 end
    end
})

-- Realtime Status
Section2:AddLabel("Trạng thái: ...")
Section2:AddLabel("Đảo hiện tại: ...")

task.spawn(function()
    while task.wait(0.5) do
        Section2:UpdateLabel("Trạng thái: " .. State.Status)
        local cur = GetClosestIsland() or "Unknown"
        Section2:UpdateLabel("Đảo hiện tại: " .. cur)
    end
end)
