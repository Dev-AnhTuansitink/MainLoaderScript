--[[ 
    -------------------------------------------------------
    NIGHT MYSTIC HUB - SMART BYPASS & FAST HOP
    -------------------------------------------------------
]]

--/// CẤU HÌNH MẶC ĐỊNH ///--
getgenv().Settings = {
    MaxStep = 3500,        -- Khoảng cách tối đa để nhảy điểm
    HoldTime = 3.5,        -- Thời gian chờ server lưu vị trí (Cho Bypass)
    TweenSpeed = 300,      -- Tốc độ bay (Studs/s) cho chế độ Smart
    SmartMode = true,      -- Tự động chọn Tween hoặc Bypass
    SafeDistance = 3000,   -- Khoảng cách ranh giới: Dưới mức này sẽ Tween, trên mức này sẽ Reset
    StopDistance = 350,    -- Khoảng cách để xác nhận đã đến nơi
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

--/// DATA ĐẢO (ISLANDS) ///--
local IslandCF = {
    -- Sea 1
    ["WindMill"] = CFrame.new(979.799, 16.516, 1429.047),
    ["Marine"] = CFrame.new(-2566.43, 6.856, 2045.256),
    ["Middle Town"] = CFrame.new(-690.331, 15.094, 1582.238),
    ["Jungle"] = CFrame.new(-1612.796, 36.852, 149.128),
    ["Pirate Village"] = CFrame.new(-1181.309, 4.751, 3803.546),
    ["Desert"] = CFrame.new(944.158, 20.92, 4373.3),
    ["Snow Island"] = CFrame.new(1347.807, 104.668, -1319.737),
    ["MarineFord"] = CFrame.new(-4914.821, 50.964, 4281.028),
    ["Colosseum"] = CFrame.new(-1427.62, 7.288, -2792.772),
    ["Sky Island 1"] = CFrame.new(-4869.103, 733.461, -2667.018),
    ["Sky Island 2"] = CFrame.new(-11.311, 29.277, 2771.522),
    ["Sky Island 3"] = CFrame.new(-483.734, 332.038, 595.327),
    ["Prison"] = CFrame.new(4875.33, 5.652, 734.85),
    ["Magma Village"] = CFrame.new(-5247.716, 12.884, 8504.969),
    ["Under Water Island"] = CFrame.new(61163.852, 11.68, 1819.784),
    ["Fountain City"] = CFrame.new(5127.128, 59.501, 4105.446),
    -- Sea 2
    ["The Cafe"] = CFrame.new(-380.479, 77.22, 255.826),
    ["Frist Spot"] = CFrame.new(-9515.372, 164.006, 5786.061),
    ["Dark Area"] = CFrame.new(3780.03, 22.652, -3498.586),
    ["Flamingo Mansion"] = CFrame.new(-3032.764, 317.897, -10075.373),
    ["Flamingo Room"] = CFrame.new(2284.414, 15.152, 875.725),
    ["Green Zone"] = CFrame.new(-2448.53, 73.016, -3210.631),
    ["Factory"] = CFrame.new(424.127, 211.162, -427.54),
    ["Colossuim"] = CFrame.new(-1503.622, 219.796, 1369.31),
    ["Zombie Island"] = CFrame.new(-5622.033, 492.196, -781.786),
    ["Two Snow Mountain"] = CFrame.new(753.143, 408.236, -5274.615),
    ["Punk Hazard"] = CFrame.new(-6127.654, 15.952, -5040.286),
    ["Cursed Ship"] = CFrame.new(923.402, 125.057, 32885.875),
    ["Ice Castle"] = CFrame.new(6148.412, 294.387, -6741.117),
    ["Forgotten Island"] = CFrame.new(2681.274, 1682.809, -7190.985),
    -- Sea 3
    ["Sea castle"] = CFrame.new(-5496.452, 313.809, -2857.703),
    ["Mini Sky Island"] = CFrame.new(-288.741, 49326.316, -35248.594),
    ["Great Tree"] = CFrame.new(2681.274, 1682.809, -7190.985),
    ["Port Town"] = CFrame.new(-226.751, 20.603, 5538.34),
    ["Hydra Island"] = CFrame.new(5291.249, 1005.443, 393.762),
    ["Mansion"] = CFrame.new(-12633.672, 459.521, -7425.463),
    ["Haunted Castle"] = CFrame.new(-9366.803, 141.366, 5443.941),
    ["Ice Cream Island"] = CFrame.new(-902.568, 79.932, -10988.848),
    ["Peanut Island"] = CFrame.new(-2062.748, 50.474, -10232.568),
    ["Cake Island"] = CFrame.new(-1884.775, 19.328, -11666.897),
    ["Cocoa Island"] = CFrame.new(87.943, 73.555, -12319.465),
    ["Candy Island"] = CFrame.new(-1014.424, 149.111, -14555.963),
    ["Tiki Outpost"] = CFrame.new(-16218.683, 9.086, 445.618),
    ["Dragon Dojo"] = CFrame.new(5743.319, 1206.91, 936.011),
}

local Alias = {
    ["MiniSky"] = "Mini Sky Island",
    ["Colosseum"] = "Colosseum",
    ["Colossuim"] = "Colossuim",
}

local WorldIslands = {
    World1 = {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City"},
    World2 = {"The Cafe","Frist Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colossuim","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island"},
    World3 = {"Sea castle","Mini Sky Island","Great Tree","Port Town","Hydra Island","Mansion","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost","Dragon Dojo"},
}

--/// HÀM HỖ TRỢ (UTILITIES) ///--
local function getWorldKey()
    local pid = game.PlaceId
    if pid == 2753915549 then return "World1" end
    if pid == 4442272183 then return "World2" end
    if pid == 7449423635 then return "World3" end
    return "World1"
end

local function normName(name)
    if type(name) ~= "string" then return nil end
    name = name:gsub("^%s+", ""):gsub("%s+$", "")
    if Alias[name] then name = Alias[name] end
    return name
end

local function GetChar()
    local c = LP.Character or LP.CharacterAdded:Wait()
    local hrp = c:WaitForChild("HumanoidRootPart", 10)
    local hum = c:FindFirstChildOfClass("Humanoid")
    return c, hrp, hum
end

local function ActivateNoclip()
    local c = LP.Character
    if c then
        for _, v in pairs(c:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
    end
end

--/// LOGIC DI CHUYỂN (MOVEMENT ENGINE) ///--

local _STOP, _RUN = false, false
local NoclipLoop

-- 1. Phương pháp Tween (Bay mượt)
local function TweenMove(targetCF)
    local c, hrp, hum = GetChar()
    if not hrp then return false end

    local dist = (hrp.Position - targetCF.Position).Magnitude
    local info = TweenInfo.new(dist / getgenv().Settings.TweenSpeed, Enum.EasingStyle.Linear)
    
    -- Bật Noclip
    if NoclipLoop then NoclipLoop:Disconnect() end
    NoclipLoop = RunService.Stepped:Connect(ActivateNoclip)

    local tween = TweenService:Create(hrp, info, {CFrame = targetCF})
    tween:Play()

    -- Chờ Tween xong hoặc bị hủy
    local completed = false
    tween.Completed:Connect(function() completed = true end)
    
    while not completed do
        if _STOP then 
            tween:Cancel()
            if NoclipLoop then NoclipLoop:Disconnect() end
            return false
        end
        if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then
            if NoclipLoop then NoclipLoop:Disconnect() end
            return false
        end
        -- Giữ vận tốc bằng 0 để tránh bị game kick
        hrp.AssemblyLinearVelocity = Vector3.zero
        task.wait()
    end
    
    if NoclipLoop then NoclipLoop:Disconnect() end
    return true
end

-- 2. Phương pháp Bypass (Reset)
local function BypassMove(targetPos)
    local c, hrp, hum = GetChar()
    if not c then return false end
    local cf = CFrame.new(targetPos)

    -- Đóng băng nhân vật tại đích
    local t0 = os.clock()
    while os.clock() - t0 < getgenv().Settings.HoldTime do
        if _STOP then return false end
        if not (hrp and hrp.Parent and hum and hum.Parent and hum.Health > 0) then break end
        pcall(function()
            hrp.CFrame = cf
            hrp.AssemblyLinearVelocity = Vector3.zero
        end)
        task.wait(0.03)
    end

    if _STOP then return false end
    -- Reset nhân vật để server load vị trí mới
    pcall(function() hum.Health = 0 end)
    
    -- Chờ hồi sinh
    local tRespawn = os.clock()
    while os.clock() - tRespawn < 10 do
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") and 
           LP.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
            return true
        end
        task.wait(0.5)
    end
    return false
end

--/// LOGIC TÌM ĐƯỜNG (PATHFINDING) ///--
local function buildNodes()
    local wk = getWorldKey()
    local list = WorldIslands[wk] or {}
    local nodes = {}
    for _, n in ipairs(list) do
        if IslandCF[n] then nodes[#nodes+1] = n end
    end
    return nodes
end

local function nearestIsland(pos, nodes)
    local best, bestD
    for _, n in ipairs(nodes) do
        local d = (pos - IslandCF[n].Position).Magnitude
        if not bestD or d < bestD then bestD, best = d, n end
    end
    return best, bestD or math.huge
end

local function dijkstra(nodes, startName, goalName, maxStep)
    local adj = {}
    for _, a in ipairs(nodes) do adj[a] = {} end

    for i=1,#nodes do
        local ai = nodes[i]
        local ap = IslandCF[ai].Position
        for j=i+1,#nodes do
            local bj = nodes[j]
            local bp = IslandCF[bj].Position
            local d = (ap - bp).Magnitude
            if d <= maxStep then
                adj[ai][bj] = d
                adj[bj][ai] = d
            end
        end
    end

    local distMap, prev, used = {}, {}, {}
    for _, n in ipairs(nodes) do distMap[n] = math.huge end
    distMap[startName] = 0

    while true do
        local u, best = nil, math.huge
        for _, n in ipairs(nodes) do
            if not used[n] and distMap[n] < best then best, u = distMap[n], n end
        end
        if not u or u == goalName then break end
        used[u] = true
        for v, w in pairs(adj[u]) do
            if not used[v] then
                local nd = distMap[u] + w
                if nd < distMap[v] then distMap[v], prev[v] = nd, u end
            end
        end
    end

    if distMap[goalName] == math.huge then return nil end
    local path, cur = {}, goalName
    while cur do
        table.insert(path, 1, cur)
        cur = prev[cur]
    end
    return path
end

--/// HÀM CHÍNH (MAIN FUNCTION) ///--
function PMT_FastHopTo(targetName)
    targetName = normName(targetName)
    if not (targetName and IslandCF[targetName]) then return false end

    -- Check xem đã đến nơi chưa trước khi làm bất cứ thứ gì
    local c, hrp = GetChar()
    if hrp and (hrp.Position - IslandCF[targetName].Position).Magnitude < getgenv().Settings.StopDistance then
        return true -- Đã ở đích
    end

    local nodes = buildNodes()
    local startIsland = nearestIsland(hrp.Position, nodes)
    
    -- Nếu đảo hiện tại là đích thì return luôn
    if startIsland == targetName and (hrp.Position - IslandCF[targetName].Position).Magnitude < getgenv().Settings.StopDistance then
        return true
    end

    local path = dijkstra(nodes, startIsland, targetName, getgenv().Settings.MaxStep)
    if not path then return false end -- Không tìm thấy đường

    _RUN, _STOP = true, false

    for i, name in ipairs(path) do
        if _STOP then break end
        
        -- Refresh Character
        local ch = LP.Character or LP.CharacterAdded:Wait()
        local myHrp = ch:WaitForChild("HumanoidRootPart", 10)
        local destPos = IslandCF[name].Position
        local distToDest = (myHrp.Position - destPos).Magnitude
        
        -- Logic Smart Bypass
        if distToDest < getgenv().Settings.StopDistance then
            -- Đã ở điểm này, bỏ qua
            task.wait(0.1)
        else
            -- QUYẾT ĐỊNH: TWEEN HAY RESET?
            if getgenv().Settings.SmartMode and distToDest <= getgenv().Settings.SafeDistance then
                -- Cách đích gần -> Bay (Tween)
                TweenMove(CFrame.new(destPos))
            else
                -- Cách đích xa -> Reset (Bypass)
                BypassMove(destPos)
            end
        end
        
        -- Sau khi thực hiện 1 bước, chờ 1 chút
        task.wait(0.5)
    end

    _RUN = false
    return not _STOP
end

function PMT_StopFastHop()
    _STOP = true
    if NoclipLoop then NoclipLoop:Disconnect() end
    -- Hủy Tween nếu đang bay
    local c = LP.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        local hrp = c.HumanoidRootPart
        -- Hủy quán tính
        hrp.AssemblyLinearVelocity = Vector3.zero
    end
end

-- Vòng lặp giám sát (Daemon)
task.spawn(function()
    while task.wait(0.5) do
        if _G.Tpfast then
            local target = _G.Islandtp
            local cf = IslandCF[target]
            
            if cf and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (LP.Character.HumanoidRootPart.Position - cf.Position).Magnitude
                
                if dist < getgenv().Settings.StopDistance then
                    -- ĐẾN NƠI -> DỪNG
                    