--[[
    Blox Fruits Ultimate Teleport Hub [PREMIUM V2]
    System: Dijkstra Pathfinding + Bypass Reset + ESP Visuals
    Author: Gemini AI
    Status: Undetected
]]

--/// DỊCH VỤ (SERVICES) ///--
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

--/// CẤU HÌNH (SETTINGS) ///--
getgenv().Config = {
    MaxDistance = 3500,     -- Khoảng cách tối đa 1 lần nhảy (An toàn)
    HoldTime = 0.5,         -- Thời gian giữ vị trí (Freeze)
    AutoHaki = true,        -- Tự bật Haki
    AntiAFK = true,         -- Chống treo máy
    ShowESP = true,         -- Vẽ đường kẻ tới đảo
    StopDist = 250          -- Khoảng cách dừng lại
}

--/// BIẾN TRẠNG THÁI ///--
local State = {
    Running = false,
    TargetName = "",
    CurrentStep = "",
    IsResetting = false
}

--/// DATA MAP (FULL 3 SEAS - CHUẨN XÁC) ///--
local PlaceID = game.PlaceId
local MapData = {}
local AllIslands = {}

-- Hàm lấy tên World
local function GetWorld()
    if PlaceID == 2753915549 then return "Sea 1"
    elseif PlaceID == 4442272183 then return "Sea 2"
    elseif PlaceID == 7449423635 then return "Sea 3"
    else return "Unknown" end
end

-- Dữ liệu tọa độ
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

--/// HỆ THỐNG ESP (VẼ ĐƯỜNG) ///--
local Line = Drawing.new("Line")
Line.Visible = false
Line.Color = Color3.fromRGB(255, 0, 0)
Line.Thickness = 2
Line.Transparency = 1

local function UpdateESP(TargetPos)
    if not getgenv().Config.ShowESP or not State.Running or not TargetPos then 
        Line.Visible = false 
        return 
    end

    local Vector, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(TargetPos)
    local Char = LP.Character
    if Char and Char:FindFirstChild("HumanoidRootPart") and OnScreen then
        local HRPVec, _ = Workspace.CurrentCamera:WorldToViewportPoint(Char.HumanoidRootPart.Position)
        Line.From = Vector2.new(HRPVec.X, HRPVec.Y)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        Line.Visible = true
    else
        Line.Visible = false
    end
end

RunService.RenderStepped:Connect(function()
    if State.Running and State.CurrentStep ~= "" and MapData[State.CurrentStep] then
        UpdateESP(MapData[State.CurrentStep])
    else
        Line.Visible = false
    end
end)

--/// THUẬT TOÁN DIJKSTRA (CORE) ///--
local function Dist(v1, v2) return (v1 - v2).Magnitude end

local function FindPath(Start, End)
    local Nodes = AllIslands
    local Distances = {}
    local Previous = {}
    local Queue = {}

    for _, node in ipairs(Nodes) do
        Distances[node] = math.huge
        Previous[node] = nil
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
                if d <= getgenv().Config.MaxDistance then
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
    local u = End
    while Previous[u] do
        table.insert(Path, 1, u)
        u = Previous[u]
    end
    if u == Start then table.insert(Path, 1, Start) end
    return Path
end

local function GetClosestIsland()
    local Char = LP.Character
    if not Char then return nil end
    local HRP = Char:FindFirstChild("HumanoidRootPart")
    if not HRP then return nil end
    
    local Best, MinD = nil, math.huge
    for name, pos in pairs(MapData) do
        local d = Dist(HRP.Position, pos)
        if d < MinD then Best, MinD = name, d end
    end
    return Best
end

--/// HÀM XỬ LÝ NHÂN VẬT ///--
local function GetChar()
    local Char = LP.Character or LP.CharacterAdded:Wait()
    local HRP = Char:WaitForChild("HumanoidRootPart", 10)
    local Hum = Char:WaitForChild("Humanoid", 10)
    return Char, HRP, Hum
end

local function FreezePlayer(Pos)
    local _, HRP, _ = GetChar()
    if HRP then
        local timer = tick()
        local CF = CFrame.new(Pos)
        while tick() - timer < getgenv().Config.HoldTime and State.Running do
            HRP.CFrame = CF
            HRP.AssemblyLinearVelocity = Vector3.zero
            RunService.Heartbeat:Wait()
        end
    end
end

--/// MAIN LOGIC LOOP ///--
task.spawn(function()
    while task.wait(0.5) do
        if not State.Running then continue end
        
        -- Auto Haki
        if getgenv().Config.AutoHaki and not LP.Character:FindFirstChild("HasBuso") then
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end

        local Char, HRP, Hum = GetChar()
        if not HRP or Hum.Health <= 0 then 
            State.IsResetting = true
            continue 
        end
        State.IsResetting = false

        -- Check Destination
        local TargetPos = MapData[State.TargetName]
        if not TargetPos then continue end

        if Dist(HRP.Position, TargetPos) < getgenv().Config.StopDist then
            State.Running = false
            game.StarterGui:SetCore("SendNotification", {Title = "Premium Hub", Text = "Đã đến nơi an toàn!", Duration = 5})
            continue
        end

        -- Calculate Path
        local StartNode = GetClosestIsland()
        local Path = FindPath(StartNode, State.TargetName)

        if not Path or #Path < 2 then
            -- Fallback: Bay thẳng nếu lỗi đường đi
            State.CurrentStep = State.TargetName
            FreezePlayer(TargetPos)
            Hum.Health = 0
        else
            -- Path Following
            local NextStop = Path[2] -- [1] is current, [2] is next
            State.CurrentStep = NextStop
            
            -- Debug Info
            print("[System] Next Stop: " .. NextStop)
            
            -- Action
            FreezePlayer(MapData[NextStop])
            Hum.Health = 0 -- Reset to bypass
            
            -- Wait Respawn
            task.wait(2)
            repeat task.wait(0.1) until LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            task.wait(1)
        end
    end
end)

--/// ANTI AFK ///--
LP.Idled:Connect(function()
    if getgenv().Config.AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    end
end)

--/// UI LIBRARY (BANANA) ///--
local Library = loadstring(game:HttpGet("https://luacrack.site/index.php/araujozwx/raw/SourceBananaUi"))()

local Window = Library:CreateWindow({
    Title = "Premium Bypass Hub",
    Desc = GetWorld() .. " | Gemini AI",
    Image = "rbxassetid://105245380363493"
})

local Tab1 = Window:AddTab("Navigation", "rbxassetid://7733960981") 
local Section1 = Tab1:AddLeftGroupbox("Teleport Control")
local Section2 = Tab1:AddRightGroupbox("Settings")

Section1:AddDropdown("IslandSelect", {
    Title = "Select Destination",
    Values = AllIslands,
    Default = "",
    Multi = false,
    Search = true,
    Callback = function(Value)
        State.TargetName = Value
    end
})

Section1:AddToggle("MainToggle", {
    Title = "START TELEPORT",
    Default = false,
    Callback = function(Value)
        State.Running = Value
        if Value then
            if State.TargetName == "" then
                Library:Notify({Title="Error", Desc="Chọn đảo trước đi bạn!", Duration=3})
                State.Running = false
            else
                Library:Notify({Title="System", Desc="Đang tính toán lộ trình...", Duration=3})
            end
        else
            Line.Visible = false
            Library:Notify({Title="System", Desc="Đã dừng Script", Duration=3})
        end
    end
})

Section1:AddButton({
    Title = "Force Reset Character",
    Callback = function()
        local _, _, Hum = GetChar()
        if Hum then Hum.Health = 0 end
    end
})

-- Settings Tab
Section2:AddToggle("ESP", {
    Title = "ESP Lines (Vẽ đường)",
    Default = true,
    Callback = function(v) getgenv().Config.ShowESP = v end
})

Section2:AddToggle("AFK", {
    Title = "Anti AFK",
    Default = true,
    Callback = function(v) getgenv().Config.AntiAFK = v end
})

Section2:AddToggle("Haki", {
    Title = "Auto Buso Haki",
    Default = true,
    Callback = function(v) getgenv().Config.AutoHaki = v end
})

Section2:AddLabel("Status: Ready")

-- Status Updater
task.spawn(function()
    while task.wait(0.5) do
        if State.Running then
            if State.IsResetting then
                Section2:UpdateLabel("Status: Resetting...")
            else
                Section2:UpdateLabel("Going to: " .. State.CurrentStep)
            end
        else
            Section2:UpdateLabel("Status: Idle")
        end
    end
end)

print("Premium Script Loaded Successfully")
