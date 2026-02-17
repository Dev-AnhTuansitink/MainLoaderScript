--// This file was created by XHider https://discord.com/invite/E2N7w35zkt

repeat
	wait();
until game:IsLoaded();
repeat
	wait();
until (game:GetService("Players")).LocalPlayer;
repeat
	task.wait();
	pcall(function()
		for i, v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui["Main (minimal)"].ChooseTeam.Container[(getgenv()).Team or "Pirates"].Frame.TextButton.Activated)) do
			v.Function();
		end;
	end);
until (game:GetService("Players")).LocalPlayer.Team ~= nil;
repeat
	wait();
until (game:GetService("Players")).LocalPlayer.Character and (game:GetService("Players")).LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
repeat
	wait();
until workspace:FindFirstChild("Map");
(require((game:GetService("ReplicatedStorage")).Reparent)).Unparent = function()
		return nil;
	end;
local FakeId = "";
(coroutine.wrap(function()
	FakeId = (tostring(game.Players.LocalPlayer.UserId)):sub(2, 4) .. (tostring(coroutine.running())):sub(11, 15);
end))();
local start_time = tick();
local TweenTick = tick();
local BlacklistedTarget = {};
local LoadedHub;
local ChestCount = 0;
local Cache = {};
local Modules = {
		Players = game.Players,
		Quests = game.ReplicatedStorage:WaitForChild("Quests"),
		GuideModule = game.ReplicatedStorage:WaitForChild("GuideModule"),
		Level = game.Players.LocalPlayer.Data.Level,
		CommF_ = game.ReplicatedStorage.Remotes:WaitForChild("CommF_"),
		AllFruits = {
			["Rocket Fruit"] = { Name = "Rocket-Rocket", Rarity = "Common", Cost = 5000 },
			["Spin Fruit"] = { Name = "Spin-Spin", Rarity = "Common", Cost = 7500 },
			["Blade Fruit"] = { Name = "Blade-Blade", Rarity = "Common", Cost = 30000 },
			["Spring Fruit"] = { Name = "Spring-Spring", Rarity = "Common", Cost = 60000 },
			["Bomb Fruit"] = { Name = "Bomb-Bomb", Rarity = "Common", Cost = 80000 },
			["Smoke Fruit"] = { Name = "Smoke-Smoke", Rarity = "Common", Cost = 100000 },
			["Spike Fruit"] = { Name = "Spike-Spike", Rarity = "Common", Cost = 180000 },
			["Flame Fruit"] = { Name = "Flame-Flame", Rarity = "Uncommon", Cost = 250000 },
			["Ice Fruit"] = { Name = "Ice-Ice", Rarity = "Uncommon", Cost = 350000 },
			["Sand Fruit"] = { Name = "Sand-Sand", Rarity = "Uncommon", Cost = 420000 },
			["Dark Fruit"] = { Name = "Dark-Dark", Rarity = "Uncommon", Cost = 500000 },
			["Eagle Fruit"] = { Name = "Eagle-Eagle", Rarity = "Uncommon", Cost = 550000 },
			["Diamond Fruit"] = { Name = "Diamond-Diamond", Rarity = "Uncommon", Cost = 600000 },
			["Light Fruit"] = { Name = "Light-Light", Rarity = "Rare", Cost = 650000 },
			["Rubber Fruit"] = { Name = "Rubber-Rubber", Rarity = "Rare", Cost = 750000 },
			["Ghost Fruit"] = { Name = "Ghost-Ghost", Rarity = "Rare", Cost = 940000 },
			["Magma Fruit"] = { Name = "Magma-Magma", Rarity = "Rare", Cost = 960000 },
			["Quake Fruit"] = { Name = "Quake-Quake", Rarity = "Legendary", Cost = 1000000 },
			["Buddha Fruit"] = { Name = "Buddha-Buddha", Rarity = "Legendary", Cost = 1200000 },
			["Love Fruit"] = { Name = "Love-Love", Rarity = "Legendary", Cost = 1300000 },
			["Creation Fruit"] = { Name = "Creation-Creation", Rarity = "Legendary", Cost = 1400000 },
			["Spider Fruit"] = { Name = "Spider-Spider", Rarity = "Legendary", Cost = 1500000 },
			["Sound Fruit"] = { Name = "Sound-Sound", Rarity = "Legendary", Cost = 1700000 },
			["Phoenix Fruit"] = { Name = "Phoenix-Phoenix", Rarity = "Legendary", Cost = 1800000 },
			["Portal Fruit"] = { Name = "Portal-Portal", Rarity = "Legendary", Cost = 1900000 },
			["Lightning Fruit"] = { Name = "Lightning-Lightning", Rarity = "Legendary", Cost = 2100000 },
			["Pain Fruit"] = { Name = "Pain-Pain", Rarity = "Legendary", Cost = 2300000 },
			["Blizzard Fruit"] = { Name = "Blizzard-Blizzard", Rarity = "Legendary", Cost = 2400000 },
			["Gravity Fruit"] = { Name = "Gravity-Gravity", Rarity = "Mythical", Cost = 2500000 },
			["Mammoth Fruit"] = { Name = "Mammoth-Mammoth", Rarity = "Mythical", Cost = 2700000 },
			["T-Rex Fruit"] = { Name = "TRex-TRex", Rarity = "Mythical", Cost = 2700000 },
			["Dough Fruit"] = { Name = "Dough-Dough", Rarity = "Mythical", Cost = 2800000 },
			["Shadow Fruit"] = { Name = "Shadow-Shadow", Rarity = "Mythical", Cost = 2900000 },
			["Venom Fruit"] = { Name = "Venom-Venom", Rarity = "Mythical", Cost = 3000000 },
			["Control Fruit"] = { Name = "Control-Control", Rarity = "Mythical", Cost = 3200000 },
			["Gas Fruit"] = { Name = "Gas-Gas", Rarity = "Mythical", Cost = 3200000 },
			["Spirit Fruit"] = { Name = "Spirit-Spirit", Rarity = "Mythical", Cost = 3400000 },
			["Leopard Fruit"] = { Name = "Leopard-Leopard", Rarity = "Mythical", Cost = 5000000 },
			["Yeti Fruit"] = { Name = "Yeti-Yeti", Rarity = "Mythical", Cost = 5000000 },
			["Kitsune Fruit"] = { Name = "Kitsune-Kitsune", Rarity = "Mythical", Cost = 8000000 },
			["Dragon Fruit"] = { Name = "Dragon-Dragon", Rarity = "Mythical", Cost = 15000000 },
		},
		AllTablet = {
			"Segment1",
			"Segment3",
			"Segment4",
			"Segment7",
			"Segment10",
		},
		AllTrophies = {
			"Trophy1",
			"Trophy2",
			"Trophy3",
			"Trophy4",
			"Trophy5",
		},
		Pipes = {
			Part1 = "Really black",
			Part2 = "Really black",
			Part3 = "Dusty Rose",
			Part4 = "Storm blue",
			Part5 = "Really black",
			Part6 = "Parsley green",
			Part7 = "Really black",
			Part8 = "Dusty Rose",
			Part9 = "Really black",
			Part10 = "Storm blue",
		},
		MeleeRemotes = {
			["Black Leg"] = { "BuyBlackLeg" },
			Electro = { "BuyElectro" },
			["Fishman Karate"] = { "BuyFishmanKarate" },
			["Dragon Claw"] = { { "BlackbeardReward", "DragonClaw", "1" }, { "BlackbeardReward", "DragonClaw", "2" } },
			Superhuman = { "BuySuperhuman" },
			["Death Step"] = { "BuyDeathStep" },
			["Electric Claw"] = { "BuyElectricClaw" },
			["Sharkman Karate"] = { "BuySharkmanKarate" },
			["Dragon Talon"] = { "BuyDragonTalon" },
			Godhuman = { "BuyGodhuman" },
			["Sanguine Art"] = { { "BuySanguineArt", true }, { "BuySanguineArt" } },
		},
		Materials = { ["Conjured Cocoa"] = { "Cocoa Warrior", "Chocolate Bar Battler" }, Ectoplasm = { "Ship Deckhand", "Ship Engineer", "Ship Steward" } },
		MeleeList = {
			"Black Leg",
			"Electro",
			"Fishman Karate",
			"Dragon Claw",
			"Superhuman",
			"Death Step",
			"Sharkman Karate",
			"Electric Claw",
			"Dragon Talon",
			"Godhuman",
			"Sanguine Art",
		},
	};
local EncodeMap = {
		a = "!",
		b = "@",
		c = "P",
		d = "$",
		e = "M",
		f = "V",
		g = "&",
		h = "*",
		i = "(",
		j = ")",
		k = "-",
		l = "_",
		m = "L",
		n = "+",
		o = "{",
		p = "}",
		q = "[",
		r = "]",
		s = ";",
		t = ":",
		u = "\'",
		v = "\"",
		w = "<",
		x = ">",
		y = "?",
		z = "~",
		["0"] = "A",
		["1"] = "B",
		["2"] = "C",
		["3"] = "D",
		["4"] = "E",
		["5"] = "F",
		["6"] = "G",
		["7"] = "H",
		["8"] = "I",
		["9"] = "J",
		["-"] = "S",
		["="] = "",
	};
local rz_MAP = workspace:GetAttribute("MAP");
local World = rz_MAP == "Sea1" and 1 or (rz_MAP == "Sea2" or rz_MAP == "Dungeons") and 2 or rz_MAP == "Sea3" and 3 or Modules.Players.LocalPlayer:Kick("YOU GOT KICKED\nREASON: Invaild World");
local rz_MeleeListIndex = World == 1 and { 1, 3 } or World == 2 and { 1, 7 } or World == 3 and { 4, #Modules.MeleeList };
Modules.RealMeleeList = {};
for i = rz_MeleeListIndex[1], rz_MeleeListIndex[2], 1 do
	Modules.RealMeleeList[i] = Modules.MeleeList[i];
end;
Modules.HighValueFruits = {};
for i, v in next, Modules.AllFruits do
	if v.Cost >= 1000000 then
		table.insert(Modules.HighValueFruits, i);
	end;
end;
local DecodeMap = {};
for i, v in next, EncodeMap do
	DecodeMap[v] = i;
end;
Modules.Locations = {};
for i, v in next, workspace._WorldOrigin.Locations:GetChildren() do
	if v:IsA("Part") and (not (v.Name:lower()):find("trial") and v.Name ~= "Sea") then
		table.insert(Modules.Locations, v.Name);
	end;
end;
Modules.Dungeon = {};
for i, v in next, require((game:GetService("ReplicatedStorage")).Raids) do
	for i1, v1 in next, v do
		table.insert(Modules.Dungeon, v1);
	end;
end;
function Modules.Decode(self, x)
	x = (x:gsub("^NightHub%-U3R1cGlkTmlnZ2Vy", "")):gsub("=+$", "");
	local total = {};
	for str in x:gmatch(".") do
		total[#total + 1] = DecodeMap[str] or str;
	end;
	return table.concat(total);
end;
for _, v in pairs({
	"Workspace",
	"Lighting",
	"ReplicatedStorage",
	"HttpService",
	"RunService",
	"Players",
	"TeleportService",
	"CollectionService",
}) do
	Modules[v] = game:GetService(v);
end;
for _, v in next, getconnections(game.Players.LocalPlayer.Idled) do
	print("[Anti AFK Enabled]");
	v:Disable();
end;
Modules.HomePointNPC = {};
Modules.NPCs = {};
for _, p in next, { workspace.NPCs, game.ReplicatedStorage.NPCs } do
	for i, v in next, p:GetChildren() do
		if v.Name == "Set Home Point" then
			table.insert(Modules.HomePointNPC, v.HumanoidRootPart);
		end;
		local NPCPart = Instance.new("Part");
		NPCPart.Parent = workspace;
		NPCPart.Name = v.Name;
		NPCPart.Anchored = true;
		NPCPart.CanCollide = false;
		NPCPart.CFrame = v.HumanoidRootPart.CFrame;
		NPCPart.Size = Vector3.new(1, 1, 1);
		NPCPart.Transparency = 1;
		Modules.NPCs[v.Name] = NPCPart;
	end;
end;
local Hits_Function;
local PlayerScripts = Modules.Players.LocalPlayer:WaitForChild("PlayerScripts");
if PlayerScripts then
	local LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript");
	while not LocalScript do
		PlayerScripts.ChildAdded:Wait();
		LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript");
	end;
	if getsenv then
		local boolean, env = pcall(getsenv, LocalScript);
		if boolean and env then
			Hits_Function = env._G.SendHitsToServer;
		end;
	end;
end;
repeat
	wait();
until Hits_Function;
print("Get Hit Function");
local Settings = {
		["Attack No Animation"] = true,
		["Tween Pause"] = true,
		["Attack Mobs"] = true,
		["Tween Speed"] = 180,
		["Bring Mobs Speed"] = 250,
		["Auto Buso"] = true,
		["Bypass Teleport"] = true,
		["Bring Mob Methods"] = "Slow",
	};
local CDKProcess;
local CountHealthLow = 0;
local TeleportTick = tick();
local CanTeleport = false;
local TweenEnable = false;
local TweenPause = false;
local TweenIndex = 0;
local LastTweenIndex = 0;
if World == 1 then
	Sea1 = true;
elseif World == 2 then
	Sea2 = true;
elseif World == 3 then
	Sea3 = true;
end;
print("World:", rz_MAP);
local Functions = {};
local Functions_2 = {};
local CombatUtil = require((game:GetService("ReplicatedStorage")).Modules.CombatUtil);
local Flag_FastAttack = false;
local success, COMBAT_REMOTE_THREAD = pcall(function()
		return (require(Modules.ReplicatedStorage.Modules:WaitForChild("Flags"))).COMBAT_REMOTE_THREAD;
	end);
if success then
	Flag_FastAttack = COMBAT_REMOTE_THREAD or false;
end;
print("Fast Attack Flagged:", Flag_FastAttack);
function Modules.Save(self)
	if not isfolder("Night Hub") then
		makefolder("Night Hub");
		makefolder("Night Hub/Blox Fruits");
	end;
	writefile("Night Hub/Blox Fruits/" .. (Modules.Players.LocalPlayer.Name .. "-BloxFruits.json"), (game:GetService("HttpService")):JSONEncode(Settings));
end;
function Modules.Load(self)
	local _1, _2 = pcall(function()
			if not isfolder("Night Hub") then
				self:Save();
			end;
			return (game:GetService("HttpService")):JSONDecode(readfile("Night Hub/Blox Fruits/" .. (Modules.Players.LocalPlayer.Name .. "-BloxFruits.json")));
		end);
	if _1 then
		return _2;
	else
		self:Save();
		return self:Load();
	end;
end;
Settings = Modules:Load();
function Modules.AddFunction(self, NAME, REAL_FUNC, SEA, NOCLIP)
	if not Functions[NAME] then
		Functions[NAME] = { ["Real Function"] = function()
					(coroutine.wrap(function()
						while Settings[NAME] and task.wait() do
							if not Settings[NAME] then
								break;
							end;
							local a, b = pcall(REAL_FUNC);
							if not a then
								print(b);
							end;
						end;
					end))();
				end, Enable = SEA };
	end;
end;
function Modules.Convert_CFrame(self, x)
	if not x then
		return;
	end;
	return typeof(x) == "Vector3" and CFrame.new(x) or typeof(x) == "CFrame" and x or typeof(x) == "Model" and x:GetPivot() or x.CFrame;
end;
function Modules.GetDistance(self, POS_1, POS_2, NO_Y)
	if POS_1 == nil then
		return;
	end;
	if not self.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or self.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
		return 9000000000.0;
	end;
	if POS_2 == nil then
		POS_2 = Modules.Players.LocalPlayer.Character.HumanoidRootPart;
	end;
	return (Vector3.new((self:Convert_CFrame(POS_1)).X, NO_Y and 0 or (self:Convert_CFrame(POS_1)).Y, (self:Convert_CFrame(POS_1)).Z) - Vector3.new((self:Convert_CFrame(POS_2)).X, NO_Y and 0 or (self:Convert_CFrame(POS_2)).Y, (self:Convert_CFrame(POS_2)).Z)).Magnitude;
end;
function Modules.CheckInventory(self, Name)
	for i, v in next, Modules.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
		if v.Name == Name then
			return v;
		end;
	end;
end;
function Modules.CreateGameNotification(self, text)
	((require((game:GetService("ReplicatedStorage")).Notification)).new(text)):Display();
end;
function Modules.GetFruitInventory(self, under1m)
	local max = math.huge;
	local select;
	for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
		if v.Type == "Blox Fruit" then
			if under1m then
				if v.Value < 1000000 and v.Value <= max then
					max = v.Value;
					select = v.Name;
				end;
			else
				if v.Value >= 1000000 and v.Value <= max then
					max = v.Value;
					select = v.Name;
				end;
			end;
		end;
	end;
	return select;
end;
function Modules.CheckFruit(self, Skid)
	for i, v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") and (string.find(v.Name, "Fruit") and (not v:GetAttribute("WeaponType") and (not Skid or table.find(self.HighValueFruits, v.Name)))) then
			return v;
		end;
	end;
	for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
		if v:IsA("Tool") and (string.find(v.Name, "Fruit") and (not v:GetAttribute("WeaponType") and (not Skid or table.find(self.HighValueFruits, v.Name)))) then
			return v;
		end;
	end;
end;
function Modules.GetPortalTeleport(self, ni)
	local Portal, Select, Max, Name = { {
				["Sky Arena 1"] = Vector3.new(-4654, 872, -1759),
				["Sky Arena 2"] = Vector3.new(-7894, 5547, -380),
				["UnderWater City 1"] = Vector3.new(3876, 35, -1939),
				["UnderWater City 2"] = Vector3.new(61163, 11, 1819),
			}, {
				Mansion = Vector3.new(-288, 305, 613),
				["Swan Room"] = Vector3.new(2284, 15, 897),
				["Out Ship"] = Vector3.new(-6518, 83, -145),
				["In Ship"] = Vector3.new(923, 125, 32883),
			}, {
				Mansion = Vector3.new(-12550, 337, -7476),
				["Castle On The Sea"] = Vector3.new(-5073, 314, -3152),
				["Hydra Island"] = Vector3.new(5681, 1013, -313),
				["Temple Of Time"] = Vector3.new(28294, 14896, 103),
			} }, Vector3.new(0, 0, 0), math.huge, "";
	for _, v in next, Portal[World] do
		if v ~= Select and (v - ni.Position).Magnitude <= Max then
			Max = (v - ni.Position).Magnitude;
			Select = v;
			Name = _;
		end;
	end;
	if self:InArea(ni) == self:InArea(Modules.Players.LocalPlayer.Character.PrimaryPart.Position) then
		return false;
	end;
	if Sea3 and not CanTeleport then
		return false;
	end;
	if self.Players.LocalPlayer.Character.PrimaryPart.CFrame.Y <= -500 or self.Players.LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
		return false;
	end;
	if (Select - ni.Position).Magnitude + 250 <= (Modules.Players.LocalPlayer.Character.PrimaryPart.Position - ni.Position).Magnitude then
		return Select, Name;
	end;
	return false;
end;
function Modules.InArea(self, POS)
	for i, v in next, workspace._WorldOrigin.Locations:GetChildren() do
		if ((self:Convert_CFrame(POS)).Position - v.Position).Magnitude <= v.Mesh.Scale.X then
			return v;
		end;
	end;
	return { Name = "" };
end;
if workspace:FindFirstChild("n_TweenPart") then
	workspace.n_TweenPart:Destroy();
end;
local n_TweenPart = Instance.new("Part");
n_TweenPart.Name = "n_TweenPart";
n_TweenPart.Size = Vector3.new(1, 1, 1);
n_TweenPart.Transparency = 1;
n_TweenPart.CanCollide = false;
n_TweenPart.Anchored = true;
n_TweenPart.Parent = workspace;
spawn(function()
	repeat
		wait();
	until game.Players.LocalPlayer.Character.PrimaryPart;
	n_TweenPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame;
	while task.wait() do
		pcall(function()
			if game.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
				if Modules:GetDistance(n_TweenPart.Position, nil, true) <= 200 then
					game.Players.LocalPlayer.Character.PrimaryPart.CFrame = n_TweenPart.CFrame;
				else
					n_TweenPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame;
				end;
			end;
		end);
	end;
end);
function Modules.MiniTween(self, x, smartmode)
	if self.Players.LocalPlayer and (self.Players.LocalPlayer.Character and (self.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (self.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and self.Players.LocalPlayer.Character.Humanoid.Health > 0))) then
		if smartmode then
			local RealPortal, Name = self:GetPortalTeleport(x);
			if (not requestEntrance_tick or tick() - requestEntrance_tick >= 1) and RealPortal then
				if not requestEntrance_tick then
					requestEntrance_tick = tick();
				end;
				print("Request Entrance to:", Name);
				if tween then
					tween:Cancel();
				end;
				self.CommF_:InvokeServer("requestEntrance", RealPortal);
				task.wait();
				requestEntrance_tick = tick();
				return;
			end;
			if (not requestEntrance_tick or tick() - requestEntrance_tick >= 8) and (self:GetBypassCFrame(x) and (self:InArea(x) ~= self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame) and (self:CanBypassTeleport(x) and self.Players.LocalPlayer.Character.Humanoid.Health > 0))) then
				print("Bypass Teleport to:", (self:InArea(x)).Name);
				self:BypassTP(x);
				return;
			end;
			self.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(5, false);
		end;
		n_TweenPart.CFrame = CFrame.new(Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, x.Y, Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z);
		tween = (game:GetService("TweenService")):Create(n_TweenPart, TweenInfo.new(self:GetDistance(x) / Settings["Tween Speed"], Enum.EasingStyle.Linear), { CFrame = x });
		tween:Play();
	end;
end;
function Modules.CheckItem(self, ITEM_NAME)
	for i, v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") and (tostring(v) == ITEM_NAME or v.Name == ITEM_NAME or string.find(v.Name, ITEM_NAME)) then
			return v;
		end;
	end;
	for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
		if v:IsA("Tool") and (tostring(v) == ITEM_NAME or v.Name == ITEM_NAME or string.find(v.Name, ITEM_NAME)) then
			return v;
		end;
	end;
end;
function Modules.CheckLegendaryItems(self)
	if self:CheckItem("God\'s Chalice") or self:CheckItem("Fist of Darkness") or self:CheckItem("Sweet Chalice") or self:CheckItem("Hallow Essence") or self:CheckItem("Flower1") then
		return true;
	end;
	return false;
end;
function Modules.GetSpawnPoint(self, x)
	for i, v in next, workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren() do
		if (v.Part.Position - x.Position).Magnitude <= 2500 then
			return v;
		end;
	end;
end;
function Modules.GetBypassCFrame(self, x)
	local Max = math.huge;
	local Pos;
	for i, v in next, workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren() do
		if (x.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 3000 and (self:GetSpawnPoint(v.Part) ~= self:GetSpawnPoint(game.Players.LocalPlayer.Character.HumanoidRootPart) and ((v.Part.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10000 and (v.Part.Position - x.Position).Magnitude <= Max)) then
			Max = (v.Part.Position - x.Position).Magnitude;
			Pos = v;
		end;
	end;
	return Pos;
end;
function Modules.GetGift(self)
	for i, v in next, workspace._WorldOrigin:GetChildren() do
		if v.Name == "Present" and (v:FindFirstChild("Box") and (v.Box:FindFirstChild("ProximityPrompt") and v:FindFirstChild("Highlight"))) then
			return v;
		end;
	end;
end;
function Modules.GetBigPresent(self)
	for i, v in next, workspace:GetChildren() do
		if v.Name == "PresentPad" and (v:FindFirstChild("Box") and v.Box:FindFirstChild("ProximityPrompt")) then
			return v;
		end;
	end;
end;
function Modules.CanBypassTeleport(self, x)
	local AreaName = (self:InArea(x)).Name;
	if AreaName == "" then
		return false;
	end;
	if not Settings["Bypass Teleport"] or AreaName:find("Dimension") or AreaName:find("Submerged") or AreaName == "Sealed Cavern" or (AreaName:lower()):find("under") or self:CheckLegendaryItems() or (game:GetService("Players")).LocalPlayer.Data.LastSpawnPoint.Value == "SubmergedIsland" then
		return false;
	end;
	if self:GetDistance(x.Position) <= 3500 then
		return false;
	end;
	return true;
end;
function Modules.BypassTP(self, Target)
	local LocalPlayer = self.Players.LocalPlayer;
	local Max = math.huge;
	local TargetTP;
	if LocalPlayer and LocalPlayer.Character.Humanoid.Health > 0 then
		if self:CanBypassTeleport(Target) and self:GetBypassCFrame(Target) then
			TargetTP = self:GetBypassCFrame(Target);
			LocalPlayer.Character.LastSpawnPoint.Disabled = true;
			self.CommF_:InvokeServer("SetLastSpawnPoint", TargetTP.Name);
			self.CommF_:InvokeServer("SetSpawnPoint");
			LocalPlayer.Character:PivotTo(TargetTP.Part.CFrame);
			LocalPlayer.Character.Humanoid:ChangeState(15);
			repeat
				wait();
			until LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0;
		end;
	end;
end;
function Modules.HopServers(self, counts)
	DontHop = false;
	(game:GetService("Players")).LocalPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore";
	self:CreateGameNotification("<Color=White>Hop Servers In 5 Seconds<Color=/>");
	wait(5);
	self:CreateGameNotification("<Color=Red>Hop Servers!<Color=/>");
	local servers = {};
	local req = game:HttpGet("https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"));
	local body = self.HttpService:JSONDecode(req);
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and (tonumber(v.playing) and (tonumber(v.maxPlayers) and (v.playing < v.maxPlayers and (v.id ~= game.JobId and v.playing >= (counts or 10))))) then
				table.insert(servers, 1, v.id);
			end;
		end;
	end;
	if #servers > 0 then
		if DontHop then
			return;
		end;
		for i = 1, 36, 1 do
			self.TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], self.Players.LocalPlayer);
			task.wait(.1);
		end;
	end;
end;
function Modules.HopServersWithApi(self, Api, Age)
	if not Settings["Last Server Job Id"] then
		Settings["Last Server Job Id"] = {};
		self:Save();
	end;
	local a, b = pcall(function()
			return http_request({ Url = tostring(Api), Method = "GET" });
		end);
	if not a then
		print(b.StatusCode, b);
		self:HopServers();
		return;
	end;
	table.insert(Settings["Last Server Job Id"], game.JobId);
	self:Save();
	local MinNumber = math.huge;
	local TableJobId = {};
	local Response = (game:GetService("HttpService")):JSONDecode(b.Body);
	for i, v in pairs(Response.data) do
		if Response.count > 0 then
			if self:Decode(v.JobId) ~= game.JobId and (v.age <= (Age or 120) and not table.find(Settings["Last Server Job Id"], self:Decode(v.JobId))) then
				if v.age < MinNumber then
					MinNumber = v.age;
					table.insert(TableJobId, self:Decode(v.JobId));
				end;
			end;
		else
			self:HopServers();
		end;
	end;
	if #TableJobId > 0 then
		for i, v in next, TableJobId do
			(game:GetService("ReplicatedStorage")).__ServerBrowser:InvokeServer("teleport", tostring(v));
			task.wait(.1);
		end;
	end;
	task.wait(1);
end;
function Modules.CheckCakePrinceSkill(self)
	for i, v in next, workspace._WorldOrigin:GetChildren() do
		if v.Name == "Ring" or v.Name == "Fist" then
			if self:GetDistance(v.Position) <= 400 then
				return true;
			end;
		end;
	end;
	return false;
end;
function Modules.Tweento(self, TARGET_CFRAME)
	if self.Players.LocalPlayer and (self.Players.LocalPlayer.Character and (self.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (self.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and self.Players.LocalPlayer.Character.Humanoid.Health > 0))) then
		if self:GetDistance(TARGET_CFRAME) >= 3000 and ((self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame)).Name == "Submerged Island" and (self:InArea(TARGET_CFRAME)).Name ~= "Submerged Island") then
			if self:GetDistance(CFrame.new(11427, -2155, 9730)) <= 15 then
				wait(1);
				local args = { "InitiateTeleport", "Tiki Outpost" };
				(game:GetService("ReplicatedStorage")).Modules.Net["RF/SubmarineTransportation"]:InvokeServer(unpack(args));
			else
				self:MiniTween(CFrame.new(11427, -2155, 9730));
			end;
			return;
		end;
		if (self:InArea(TARGET_CFRAME)).Name == "Submerged Island" and (self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame)).Name ~= "Submerged Island" or (self:InArea(TARGET_CFRAME)).Name == "Sealed Cavern" and (self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame)).Name ~= "Sealed Cavern" then
			if self:GetDistance((CFrame.new(-16270, 25, 1379)).Position) <= 30 then
				wait(1);
				local args = { "TravelToSubmergedIsland" };
				self.ReplicatedStorage.Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer(unpack(args));
			else
				self:MiniTween(CFrame.new(-16270, 25, 1379), true);
			end;
			return;
		end;
		if not self.Players.LocalPlayer.Character:FindFirstChild("Nigger") then
			local Highlight = Instance.new("Highlight");
			Highlight.Name = "Nigger";
			Highlight.Parent = game.Players.LocalPlayer.Character;
			Highlight.FillColor = Color3.fromRGB(255, 0, 0);
			Highlight.FillTransparency = .7;
		end;
		local RealPortal, Name = self:GetPortalTeleport(TARGET_CFRAME);
		if self:InArea(TARGET_CFRAME) ~= self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame) and RealPortal then
			if not last_tele then
				last_tele = tick();
			end;
			print("Request Entrance to:", Name);
			if tween then
				tween:Cancel();
			end;
			self.Players.LocalPlayer.Character.LastSpawnPoint.Disabled = true;
			if self:GetSpawnPoint(TARGET_CFRAME) then
				self.CommF_:InvokeServer("SetLastSpawnPoint", (self:GetSpawnPoint(TARGET_CFRAME)).Name);
			end;
			Modules.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", RealPortal);
			last_tele = tick();
			task.wait();
			return;
		end;
		if (not last_tele or tick() - last_tele >= 8) and (self:GetBypassCFrame(TARGET_CFRAME) and (self:InArea(TARGET_CFRAME) ~= self:InArea(self.Players.LocalPlayer.Character.PrimaryPart.CFrame) and (self:CanBypassTeleport(TARGET_CFRAME) and self.Players.LocalPlayer.Character.Humanoid.Health > 0))) then
			wait(.5);
			print("Bypass Teleport to:", (self:InArea(TARGET_CFRAME)).Name);
			if tween then
				tween:Cancel();
			end;
			self:BypassTP(TARGET_CFRAME);
			return;
		end;
		if Settings["Up Y When Low Health"] then
			local LamTron = (game.Players.LocalPlayer.Character.Humanoid.Health * 100) / game.Players.LocalPlayer.Character.Humanoid.MaxHealth;
			if LamTron <= 30 then
				LamTron = (game.Players.LocalPlayer.Character.Humanoid.Health * 100) / game.Players.LocalPlayer.Character.Humanoid.MaxHealth;
				if tween then
					tween:Cancel();
				end;
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, TARGET_CFRAME.Y + 250, Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z);
				return;
			end;
		end;
		TweenTick = tick();
		self.Players.LocalPlayer.Character.LastSpawnPoint.Enabled = true;
		self.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(5, false);
		game.Players.LocalPlayer.Character.Busy.Value = false;
		game.Players.LocalPlayer.Character.Stun.Value = 0;
		if self:GetDistance(TARGET_CFRAME, nil, true) <= 50 then
			if tween then
				tween:Cancel();
			end;
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = TARGET_CFRAME;
			n_TweenPart.CFrame = TARGET_CFRAME;
			return;
		else
			if Settings["Same Y"] then
				local SameY = CFrame.new(Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, TARGET_CFRAME.Y, Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z);
				n_TweenPart.CFrame = SameY;
				Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SameY;
			end;
			if Settings["Up Y"] then
				if self:GetDistance(TARGET_CFRAME, nil, true) >= 100 then
					local UpY = CFrame.new(Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, TARGET_CFRAME.Y + 120, Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z);
					n_TweenPart.CFrame = UpY;
					Modules.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = UpY;
				end;
			end;
			local TweenTarget = CFrame.new(TARGET_CFRAME.X, Settings["Up Y"] and TARGET_CFRAME.Y + 120 or TARGET_CFRAME.Y, TARGET_CFRAME.Z);
			tween = (game:GetService("TweenService")):Create(n_TweenPart, self:GetDistance(TweenTarget, nil, true) <= 400 and TweenInfo.new((self:GetDistance(TweenTarget, nil, true) / Settings["Tween Speed"]) / 1.5, Enum.EasingStyle.Linear) or TweenInfo.new(self:GetDistance(TweenTarget, nil, true) / Settings["Tween Speed"], Enum.EasingStyle.Linear), { CFrame = TweenTarget });
			tween:Play();
		end;
	end;
end;
spawn(function()
	while task.wait() do
		pcall(function()
			if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
				Modules:EnableNoClip(true);
			elseif tween and tick() - TweenTick >= 2 then
				Modules:EnableNoClip(false);
			end;
		end);
	end;
end);
function Modules.EnableNoClip(self, boolean)
	if boolean then
		for i, v in next, Modules.Players.LocalPlayer.Character:GetDescendants() do
			if v:IsA("BasePart") or v:IsA("Part") then
				v.CanCollide = false;
			end;
		end;
		if not Modules.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
			local BodyVelocity = Instance.new("BodyVelocity");
			BodyVelocity.Parent = Modules.Players.LocalPlayer.Character.Head;
			BodyVelocity.Velocity = Vector3.new(0, 0, 0);
			BodyVelocity.P = 1500;
			BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000);
		end;
	else
		Modules.Players.LocalPlayer.Character.Humanoid:ChangeState();
		Modules.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(5, true);
		if self.Players.LocalPlayer.Character:FindFirstChild("Nigger") then
			self.Players.LocalPlayer.Character.Nigger:Destroy();
		end;
		if Modules.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity") then
			(Modules.Players.LocalPlayer.Character.Head:FindFirstChild("BodyVelocity")):Destroy();
		end;
	end;
end;
function Modules.CheckRace(self)
	local v1 = self.CommF_:InvokeServer("Wenlocktoad", "1");
	local v2 = self.CommF_:InvokeServer("Alchemist", "1");
	if self.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
		return "V4";
	end;
	return v1 == -2 and "V3" or v2 == -2 and "V2" or "V1";
end;
function Modules.GetWeaponName(self, TYPE)
	for i, v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") and v.ToolTip == TYPE then
			return v.Name;
		end;
	end;
	for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
		if v:IsA("Tool") and v.ToolTip == TYPE then
			return v.Name;
		end;
	end;
end;
function Modules.EquipTool(self, NAME)
	pcall(function()
		local MMB = Modules.Players.LocalPlayer.Backpack:FindFirstChild(NAME);
		if MMB then
			(Modules.Players.LocalPlayer.Character:WaitForChild("Humanoid")):EquipTool(MMB);
		end;
	end);
end;
function Modules.EquipWeapon(self)
	pcall(function()
		local MMB = Modules.Players.LocalPlayer.Backpack:FindFirstChild(self:GetWeaponName(Settings["Select Tool"] or "Melee"));
		if MMB then
			(Modules.Players.LocalPlayer.Character:WaitForChild("Humanoid")):EquipTool(MMB);
		end;
	end);
end;
function Modules.GetFruit(self)
	for _, v in next, workspace:GetChildren() do
		if (v:IsA("Model") or v:IsA("Tool")) and (string.find(v.Name, "Fruit") and (v.Parent and v:FindFirstChild("Handle"))) then
			return v;
		end;
	end;
end;
function Modules.SendKey(self, Key, Hold)
	(game:GetService("VirtualInputManager")):SendKeyEvent(true, Key, false, game);
	wait(Hold or .1);
	(game:GetService("VirtualInputManager")):SendKeyEvent(false, Key, false, game);
end;
function Modules.SpamAllSkill(self)
	for i, v in next, game.Players.LocalPlayer.PlayerGui.Main.Skills:GetChildren() do
		if v:IsA("Frame") and v.Name ~= "Container" then
			for i1, v1 in next, v:GetChildren() do
				if v1:IsA("Frame") and (v1.Name ~= "Template" and (v1.Cooldown.AbsoluteSize.X <= 5 and v1.Title.TextColor3 == Color3.fromRGB(255, 255, 255))) then
					self:EquipTool(v.Name);
					task.wait();
					self:SendKey(v1.Name);
				end;
			end;
		end;
	end;
end;
function Modules.IsAlive(self, v)
	return v and (v.Parent and (not v:FindFirstChild("VehicleSeat") and (v:FindFirstChild("Humanoid") and (v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart")))));
end;
function Modules.GetBladeHits(self, RANGE)
	local BLADE_HITS = {};
	if Settings["Attack Mobs"] then
		for i, v in next, workspace.Enemies:GetChildren() do
			if v:IsA("Model") and (self:IsAlive(v) and self:GetDistance(v.HumanoidRootPart.Position) <= (RANGE or 67)) then
				BLADE_HITS[#BLADE_HITS + 1] = v;
			end;
		end;
	end;
	if Settings["Attack Players"] then
		for i, v in next, workspace.Characters:GetChildren() do
			if v.Name ~= game.Players.LocalPlayer.Name and (v:IsA("Model") and (self:IsAlive(v) and self:GetDistance(v.HumanoidRootPart.Position) <= (RANGE or 67))) then
				BLADE_HITS[#BLADE_HITS + 1] = v;
			end;
		end;
	end;
	return BLADE_HITS;
end;
function Modules.GetWeaponType(self, ToolTip)
	for _, O in next, { game.Players.LocalPlayer.Backpack, game.Players.LocalPlayer.Character } do
		for i, v in next, O:GetChildren() do
			if v:IsA("Tool") and v.ToolTip == (ToolTip or "Melee") then
				return v;
			end;
		end;
	end;
end;
function Modules.SingleAttack(self, mob)
	if (getgenv()).SingleAttack then
		local BladeHits = self:GetBladeHits();
		local HitboxLimbs = {
				"RightLowerArm",
				"RightUpperArm",
				"LeftLowerArm",
				"LeftUpperArm",
				"RightHand",
				"LeftHand",
				"Head",
				"HumanoidRootPart",
			};
		local EnemyList = {};
		local CurrentTool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
		if not CurrentTool then
			return;
		end;
		if CurrentTool.ToolTip == "Blox Fruit" then
			local left = CurrentTool:FindFirstChild("LeftClickRemote");
			if left and left:IsA("RemoteEvent") then
				left:FireServer(Vector3.new(0, -500, 0), 1, true);
				task.wait(.03);
				left:FireServer(false);
			end;
		else
			table.insert(EnemyList, { mob, mob.Head });
			local EnemyHit = EnemyList[1][2];
			(Modules.ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack")):FireServer(0);
			if Flag_FastAttack then
				Hits_Function(EnemyHit, EnemyList, nil, FakeId);
			else
				(Modules.ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterHit")):FireServer(EnemyHit, EnemyList, nil, FakeId);
			end;
		end;
	end;
end;
function Modules.StartAttack(self)
	if (getgenv()).SingleAttack then
		return;
	end;
	local BladeHits = self:GetBladeHits();
	local HitboxLimbs = {
			"RightLowerArm",
			"RightUpperArm",
			"LeftLowerArm",
			"LeftUpperArm",
			"RightHand",
			"LeftHand",
			"Head",
			"HumanoidRootPart",
		};
	local EnemyList = {};
	if #BladeHits > 0 then
		local CurrentTool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool");
		if not CurrentTool then
			return;
		end;
		if CurrentTool.ToolTip == "Blox Fruit" then
			local left = CurrentTool:FindFirstChild("LeftClickRemote");
			if left and left:IsA("RemoteEvent") then
				left:FireServer(Vector3.new(0, -500, 0), math.random(1, 3), true);
				task.wait(.01);
				left:FireServer(false);
			end;
		else
			for i, mob in next, BladeHits do
				if mob and (self:IsAlive(mob) and mob:FindFirstChild("Head")) then
					table.insert(EnemyList, { mob, mob.Head });
				end;
			end;
			local EnemyHit = EnemyList[1][2];
			(Modules.ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack")):FireServer(0);
			if Flag_FastAttack then
				Hits_Function(EnemyHit, EnemyList, nil, FakeId);
			else
				(Modules.ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterHit")):FireServer(EnemyHit, EnemyList, nil, FakeId);
			end;
		end;
	end;
end;
function Modules.CheckNotify(self, aa)
	for r, v in pairs(self.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
		if v and (v.Parent and (v:IsA("TextLabel") and (v.Text and string.find(string.lower(v.Text), aa)))) then
			return v;
		end;
	end;
end;
function Modules.EnableBuso(self)
	if not Modules.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
		Modules.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso");
	end;
end;
function Modules.GetMidPosition(self, mobname)
	local niger;
	local counts = 0;
	for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
		if v.Name == mobname then
			if not niger then
				niger = v.HumanoidRootPart.Position;
			else
				niger = niger + v.HumanoidRootPart.Position;
			end;
			counts = counts + 1;
		end;
	end;
	niger = niger / counts;
	return niger;
end;
function Modules.SidePart(self, v, Ngu)
	local Distance = self:GetDistance(v.PrimaryPart.Position, nil, true);
	if v:FindFirstChild("Humanoid") then
		v.Humanoid.WalkSpeed = Distance <= 50 and 0 or Settings["Bring Mobs Speed"];
		v.Humanoid.JumpPower = 0;
		v.Humanoid.AutoRotate = false;
		v.HumanoidRootPart.CanCollide = false;
		v.Head.CanCollide = false;
	else
		return;
	end;
	for i, v in next, v:GetChildren() do
		if v.ClassName == "Shirt" or v.ClassName == "Pants" then
			v:Destroy();
		end;
		if v:IsA("MeshPart") then
			v.Transparency = 1;
			v.CanCollide = false;
		end;
		if v:IsA("Part") then
			v.CanCollide = false;
		end;
	end;
	if v.Humanoid:FindFirstChild("Animator") then
		v.Humanoid.Animator:Destroy();
	end;
	if Distance <= 50 and not v.HumanoidRootPart:FindFirstChild("Lock") then
		local Lock = Instance.new("BodyVelocity");
		Lock.Name = "Lock";
		Lock.Parent = v.HumanoidRootPart;
		Lock.Velocity = Vector3.new(0, 0, 0);
		Lock.MaxForce = Vector3.new(10000, 10000, 10000);
	end;
end;
function Modules.DetectNearPlayersInCFrame(self, x)
	for i, v in next, workspace.Characters:GetChildren() do
		if v.Name ~= Modules.Players.LocalPlayer.Name and self:IsAlive(v) then
			if self:GetDistance(v.HumanoidRootPart.Position) <= x then
				return true;
			end;
		end;
	end;
	return false;
end;
function Modules.GetElite(self)
	for _, p in next, { workspace.Enemies, game.ReplicatedStorage } do
		for i, v in next, p:GetChildren() do
			if v and (v.Parent and (table.find({ "Urban", "Deandre", "Diablo" }, v.Name) and (v:IsA("Model") and self:IsAlive(v)))) then
				return v;
			end;
		end;
	end;
end;
function Modules.CirclePos(self, TARGET_PRIMARYPART, RADIUS, TotalEnemy)
	if not TARGET_PRIMARYPART:FindFirstChild("Angle") then
		local Angle = Instance.new("IntValue");
		Angle.Parent = TARGET_PRIMARYPART;
		Angle.Name = "Angle";
		Angle.Value = 0;
	end;
	TARGET_PRIMARYPART.Angle.Value = TARGET_PRIMARYPART.Angle.Value + (30 / TotalEnemy) * 1.5;
	local x = math.sin(math.rad(TARGET_PRIMARYPART.Angle.Value)) * RADIUS;
	local z = math.cos(math.rad(TARGET_PRIMARYPART.Angle.Value)) * RADIUS;
	return CFrame.new((TARGET_PRIMARYPART.Position + Vector3.new(x, 0, z)) + Vector3.new(0, 0, 0));
end;
function Modules.BringMob(self)
	local Bring_Range = Settings["Bring Mobs Range"] or 350;
	if BringMobName and (BringMob and BringMobName:FindFirstChild("HumanoidRootPart")) then
		local Bring_Pos = BringMobName.HumanoidRootPart;
		self:SidePart(BringMobName);
		local Enemies = workspace.Enemies:GetChildren();
		if #Enemies > 1 then
			for i = 1, #Enemies, 1 do
				local Mob = Enemies[i];
				if Mob and (Mob.Name == BringMobName.Name and (Mob ~= BringMobName and (self:IsAlive(Mob) and (self:GetDistance(Mob.PrimaryPart.Position) <= Bring_Range and (isnetworkowner(Mob.HumanoidRootPart) and self:GetDistance(Mob.PrimaryPart.Position, nil, true) >= 5))))) then
					if Settings["Bring Mob Methods"] == "Slow" then
						if self:GetDistance(Mob.PrimaryPart.Position, nil, true) <= 100 then
							Mob:SetPrimaryPartCFrame(Bring_Pos.CFrame);
						end;
						Mob.Humanoid:MoveTo(Bring_Pos.Position);
					else
						Mob.HumanoidRootPart.CFrame = self:CirclePos(Bring_Pos, 8, #Enemies);
					end;
					self:SidePart(Mob, Bring_Pos);
				end;
			end;
		end;
	end;
end;
function Modules.GetMob(self, NAME, FINDMORE, DISTANCE)
	local selecttarget, max = nil, math.huge;
	for _, v in next, workspace.Enemies:GetChildren() do
		if (typeof(NAME) == "table" and table.find(NAME, v.Name) or typeof(NAME) == "string" and v.Name == NAME) and self:IsAlive(v) then
			if self:GetDistance(v.HumanoidRootPart.Position) <= max and self:GetDistance(v.HumanoidRootPart.Position) <= (DISTANCE or math.huge) then
				max = self:GetDistance(v.HumanoidRootPart.Position);
				selecttarget = v;
			end;
		end;
	end;
	if FINDMORE then
		for _, v in next, game.ReplicatedStorage:GetChildren() do
			if (typeof(NAME) == "table" and table.find(NAME, v.Name) or typeof(NAME) == "string" and v.Name == NAME) and self:IsAlive(v) then
				if self:GetDistance(v.HumanoidRootPart.Position) <= max and self:GetDistance(v.HumanoidRootPart.Position) <= (DISTANCE or math.huge) then
					max = self:GetDistance(v.HumanoidRootPart.Position);
					selecttarget = v;
				end;
			end;
		end;
	end;
	return selecttarget;
end;
function Modules.TweenObject(self, object, pos, speed)
	local distance = self:GetDistance(object.Position);
	local tween1 = (game:GetService("TweenService")):Create(object, TweenInfo.new(distance / (speed or 250), Enum.EasingStyle.Linear), { CFrame = pos });
	tween1:Play();
end;
function Modules.CheckSafeZone(self, x)
	for i, v in next, workspace._WorldOrigin.SafeZones:GetChildren() do
		if v and self:GetDistance(x.Position, v.Position) <= 1000 then
			return true;
		end;
	end;
	return false;
end;
function Modules.GetMasteryCurrentTool(self, Type)
	for i, v in next, self.Players.LocalPlayer.Character:GetChildren() do
		if v:IsA("Tool") and v.ToolTip == Type then
			return v.Level.Value;
		end;
	end;
	for i, v in next, self.Players.LocalPlayer.Backpack:GetChildren() do
		if v:IsA("Tool") and v.ToolTip == Type then
			return v.Level.Value;
		end;
	end;
	return 0;
end;
function Modules.KillMobs(self, TARGET, NAME_TOGGLE, CUSTOM_POSITON)
	local v = self:GetMob(typeof(TARGET) == "Instance" and TARGET.Name or TARGET, true);
	if v and self:IsAlive(v) then
		repeat
			task.wait();
			if typeof(NAME_TOGGLE) == "function" and NAME_TOGGLE() == true then
				break;
			end;
			if typeof(NAME_TOGGLE) == "string" and not Settings[NAME_TOGGLE] or not v or not self:IsAlive(v) then
				break;
			end;
			Modules:EquipWeapon();
			Modules:EnableBuso();
			BringMobName = v;
			BringMob = true;
			if self:CheckCakePrinceSkill() then
				Modules:Tweento(v.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0));
			else
				if Settings["Select Tool"] == "Blox Fruit" then
					Modules:Tweento(CUSTOM_POSITON or v.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0));
				else
					Modules:Tweento(CUSTOM_POSITON or v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0));
				end;
			end;
		until not v or not v.Parent or not Modules:IsAlive(v) or not Settings[NAME_TOGGLE];
		BringMob = false;
		BringMobName = nil;
	end;
end;
function Modules.GetInventoryWeapon(self, x)
	for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
		if v.Type == "Sword" then
			if v.Mastery <= x then
				return v.Name;
			end;
		end;
	end;
end;
function Modules.GetQuest(self)
	local Level = Modules.Players.LocalPlayer.Data.Level;
	local Name, NameQuest, Id = "", "", 0;
	local LevelReq = 0;
	if Sea1 and Level.Value >= 700 then
		return "Galley Captain", "FountainQuest", 2;
	elseif Sea2 and Level.Value >= 1500 then
		return "Water Fighter", "ForgottenQuest", 2;
	else
		for i, v in next, require(Modules.Quests) do
			for ID, v1 in next, v do
				local LvReq = v1.LevelReq;
				for i1, v2 in next, v1.Task do
					if Level.Value >= LvReq and (LvReq >= LevelReq and (not table.find({
						"CitizenQuest",
						"BartiloQuest",
						"MarineQuest",
						"Trainees",
					}, i) and v1.Task[i1] >= 5)) then
						LevelReq = LvReq;
						LevelReq, Name, NameQuest, Id = LvReq, i1, i, ID;
					end;
				end;
			end;
		end;
	end;
	return Name, NameQuest, Id;
end;
function Modules.GetCFrameQuest(self)
	for i, v in next, self.NPCs do
		if v.Name == (require(self.GuideModule)).Data.LastClosestNPC then
			return v.CFrame;
		end;
	end;
end;
function Modules.GetLastQuest(self)
	local QuestData;
	for i, v in next, (require(self.GuideModule)).Data do
		if i == "QuestData" then
			QuestData = v;
			break;
		end;
	end;
	if QuestData then
		for i, v in next, QuestData.Task do
			return i;
		end;
	else
		return false;
	end;
end;
function Modules.GetQuestUnlocked(self)
	local TotalQuestUnlocked = {};
	local Name, NameQuest, Id = self:GetQuest();
	for i, v in next, require(Modules.Quests) do
		for ID, v1 in next, v do
			local LvReq = v1.LevelReq;
			for i1, v2 in next, v1.Task do
				if i == NameQuest then
					if LvReq <= self.Level.Value and (v2 > 1 and v1.Name ~= "Town Raid") then
						table.insert(TotalQuestUnlocked, v);
					end;
				end;
			end;
		end;
	end;
	return TotalQuestUnlocked;
end;
function Modules.CheckDoubleQuest(self)
	local Name, NameQuest, Id = self:GetQuest();
	if Settings["Double Quest(RISK)"] and (self.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false and (self:GetLastQuest() and (self:GetLastQuest() == Name and #self:GetQuestUnlocked() >= 2))) then
		for i, v in next, require(Modules.Quests) do
			for ID, v1 in next, v do
				local LvReq = v1.LevelReq;
				for i1, v2 in next, v1.Task do
					if i1 ~= Name and i == NameQuest then
						if LvReq <= self.Level.Value and (v2 >= 5 and v1.Name ~= "Town Raid") then
							return i1, i, ID;
						end;
					end;
				end;
			end;
		end;
	end;
	return Name, NameQuest, Id;
end;
function Modules.GetSeaBeast(self)
	for i, v in next, workspace.SeaBeasts:GetChildren() do
		if v.Name == "SeaBeast1" and self:GetDistance(v.HumanoidRootPart.Position) <= 2000 then
			if v:FindFirstChild("Health") and v.Health.Value > 0 then
				return v;
			end;
		end;
	end;
end;
function Modules.GetYourBoat(self)
	for i, v in next, workspace.Boats:GetChildren() do
		if v and (v.Parent and (v:FindFirstChild("Humanoid") and (v.Humanoid.Value > 0 and (v:WaitForChild("Owner")).Value == game.Players.LocalPlayer))) then
			return v;
		end;
	end;
end;
function Modules.GetSeaBeastPosition(self, x)
	if (Vector3.new(0, x.HumanoidRootPart.Position.Y, 0) - Vector3.new(0, workspace.Map["WaterBase-Plane"].Position.Y, 0)).Magnitude <= 175 then
		return x.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0);
	else
		return CFrame.new(x.HumanoidRootPart.CFrame.X, workspace.Map["WaterBase-Plane"].Y + 200, x.HumanoidRootPart.CFrame.Z);
	end;
end;
function Modules.GetCDKProgress(self)
	local CDKPuzzle = { Evil = 0, Good = 0 };
	for i, v in next, game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good") do
		CDKPuzzle[i] = v;
	end;
	return CDKPuzzle;
end;
function Modules.GetCDKProcess(self)
	local Evil, Goon = (self:GetCDKProgress()).Evil, (self:GetCDKProgress()).Good;
	if Evil ~= -2 and (Evil ~= 3 and Evil ~= 4) then
		if Evil == 2 or Evil == -5 then
			return "Hell Dismension Quest";
		elseif Evil == 1 or Evil == -4 then
			return "Haze Quest";
		elseif Evil == 0 or Evil == -3 then
			return "Die Quest";
		end;
	else
		if Goon == 2 or Goon == -5 then
			return "Heavenly Dismension Quest";
		elseif Goon == 1 or Goon == -4 then
			return "Raid Castle Quest";
		elseif Goon == 0 or Goon == -3 then
			return "Boat Quest";
		end;
	end;
	return "None";
end;
function Modules.GetPedestal(self)
	local Pedestal;
	if CDKProcess.Evil == 3 then
		Pedestal = workspace.Map.Turtle.Cursed.Pedestal2;
	elseif (CDKProcess.Good == 3 or CDKProcess.Good == 4) and workspace.Map.Turtle.Cursed.Pedestal1.ProximityPrompt.Enabled then
		Pedestal = workspace.Map.Turtle.Cursed.Pedestal1;
	end;
	return Pedestal;
end;
function Modules.HazePos(self)
	local HazeQuestName = {};
	local Max = math.huge;
	local Pos;
	for i, v in next, self.Players.LocalPlayer.QuestHaze:GetChildren() do
		if v.Value > 0 then
			table.insert(HazeQuestName, v);
		end;
	end;
	if #HazeQuestName > 0 then
		for i, v in next, HazeQuestName do
			for _, v1 in next, workspace.NightHubCache.MobSpawns:GetChildren() do
				if v.Name == v1.Name then
					local Distance = self:GetDistance(v1.Position);
					if Distance <= Max then
						Max = Distance;
						Pos = v1.Position;
					end;
				end;
			end;
		end;
	end;
	return Pos;
end;
function Modules.HazeMobs(self)
	local Max = math.huge;
	local Select;
	for i, v in next, workspace.Enemies:GetChildren() do
		if v:IsA("Model") and (self:IsAlive(v) and v:FindFirstChild("HazeESP")) then
			if self:GetDistance(v.HumanoidRootPart.Position) <= Max then
				Max = self:GetDistance(v.HumanoidRootPart.Position);
				Select = v;
			end;
		end;
	end;
	for i, v in next, self.ReplicatedStorage:GetChildren() do
		if v:IsA("Model") and (self:IsAlive(v) and v:FindFirstChild("HazeESP")) then
			if self:GetDistance(v.HumanoidRootPart.Position) <= Max then
				Max = self:GetDistance(v.HumanoidRootPart.Position);
				Select = v;
			end;
		end;
	end;
	return Select;
end;
function Modules.GetMobInCFrame(self, Pos, Range)
	for i, v in next, workspace.Enemies:GetChildren() do
		if v:IsA("Model") and (self:IsAlive(v) and self:GetDistance(v.HumanoidRootPart.Position, Pos) <= (Range or 1000)) then
			return v;
		end;
	end;
end;
function Modules.GetShirneDungeon(self)
	for i, v in next, workspace.Map.Dungeon:GetChildren() do
		if v:IsA("Model") and v:FindFirstChild("Props") then
			for i1, v1 in next, v.Props:GetChildren() do
				if v1:GetAttribute("KitsuneMarkActive") == true then
					return v1;
				end;
			end;
		end;
	end;
end;
function Modules.GetDungeonWorldMob(self)
	local maxdistance = math.huge;
	local select;
	for i, v in next, workspace.Enemies:GetChildren() do
		if v and (v.Name ~= "Blank Buddy" and (v.Parent and (self:IsAlive(v) and (self:GetDistance(v.PrimaryPart.Position) <= 500 and self:GetDistance(v.PrimaryPart.Position) <= maxdistance)))) then
			maxdistance = self:GetDistance(v.PrimaryPart.Position);
			select = v;
		end;
	end;
	return select;
end;
function Modules.GetDungeonWorldDoors(self)
	local max = -math.huge;
	local select;
	for i, v in next, workspace.Map.Dungeon:GetChildren() do
		if v:IsA("Model") and (#v.Name <= 2 and (tonumber(v.Name) >= max and self:GetDistance((v:GetPivot()).Position) <= 800)) then
			max = tonumber(v.Name);
			select = v;
		end;
	end;
	return select;
end;
function Modules.GetZombieGuitarPuzzle(self)
	local AllZombie = {};
	for i, v in next, workspace.Enemies:GetChildren() do
		if v.Name == "Living Zombie" and (v.Parent and self:IsAlive(v)) then
			table.insert(AllZombie, v);
		end;
	end;
	return AllZombie;
end;
function Modules.DoCDKQuest(self)
	local Process = self:GetCDKProcess();
	if Process == "Die Quest" then
		if self:GetMob("Forest Pirate", true) then
			local v = self:GetMob("Forest Pirate", true);
			self:Tweento(v.HumanoidRootPart.CFrame);
		else
			self:Tweento(CFrame.new(-13234, 520, -6800));
		end;
	elseif Process == "Haze Quest" then
		if self:HazeMobs() then
			local v = self:HazeMobs();
			repeat
				wait();
				if Process ~= "Haze Quest" then
					break;
				end;
				self:KillMobs(v, "Auto Dual Cursed Katana");
			until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Haze Quest";
		else
			self:Tweento(CFrame.new(self:HazePos()) * CFrame.new(0, 20, 0));
		end;
	elseif Process == "Hell Dismension Quest" then
		local HellDismension = workspace._WorldOrigin.Locations["Hell Dimension"];
		if HellDismension and self:GetDistance(HellDismension.Position) <= 2000 then
			if workspace.Map:FindFirstChild("HellDimension") and (workspace.Map:FindFirstChild("HellDimension")).Exit.BrickColor == BrickColor.new("Olivine") then
				self:Tweento(workspace.Map.HellDimension.Exit.CFrame);
				return;
			end;
			local v = self:GetMobInCFrame(HellDismension.Position);
			if v then
				repeat
					wait();
					self:KillMobs(v, "Auto Dual Cursed Katana");
				until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Hell Dismension Quest";
			else
				if workspace.Map:FindFirstChild("HellDimension") then
					for i, v in next, (workspace.Map:FindFirstChild("HellDimension")):GetChildren() do
						if string.find(v.Name, "Torch") then
							if v.ProximityPrompt.Enabled then
								if self:GetDistance(v.Position) <= 15 then
									fireproximityprompt(v.ProximityPrompt);
								else
									self:Tweento(v.CFrame);
								end;
							end;
						end;
					end;
				end;
			end;
		else
			if self:GetMob("Soul Reaper", true) then
				local v = self:GetMob("Soul Reaper", true);
				repeat
					task.wait();
					if self:CheckNotify("loading...") then
						break;
					end;
					Process = self:GetCDKProcess();
					self:Tweento(v.HumanoidRootPart.CFrame);
				until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Hell Dismension Quest" or self:CheckNotify("loading...");
			else
				local _1, _2, RandomCount, TimeRandom, MaxRandom = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check");
				if RandomCount > 0 and _1 >= 50 then
					if self:CheckItem("Hallow Essence") then
						self:EquipTool("Hallow Essence");
						self:Tweento(CFrame.new(-8932, 142, 6063));
					else
						if self:GetDistance(CFrame.new(-8934, 142, 6036)) <= 50 then
							self.CommF_:InvokeServer("Bones", "Buy", 1, 1);
						else
							self:Tweento(CFrame.new(-8934, 142, 6036));
						end;
					end;
				elseif RandomCount <= 0 or _1 < 50 then
					self:HopServersWithApi("https://minhnghia.pythonanywhere.com/api/SoulReaper");
				end;
			end;
		end;
	elseif Process == "Boat Quest" then
		for i, v in next, workspace:GetChildren() do
			if Process ~= "Boat Quest" or not Settings["Auto Dual Cursed Katana"] then
				break;
			end;
			if v.Name == "Luxury Boat Dealer" and not v:GetAttribute("Dit") then
				repeat
					wait();
					Process = self:GetCDKProcess();
					if Process ~= "Boat Quest" or not Settings["Auto Dual Cursed Katana"] then
						break;
					end;
					self:Tweento(v.CFrame);
				until v:GetAttribute("Dit") or Process ~= "Boat Quest" or self:GetDistance(v.Position) <= 15;
				Process = self:GetCDKProcess();
				self.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"));
				self.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check");
				wait(.5);
				v:SetAttribute("Dit", true);
			end;
		end;
	elseif Process == "Raid Castle Quest" then
		if not self:GetMobInCFrame(CFrame.new(-5541, 314, -2961)) then
			if not waittick then
				waittick = tick();
			end;
			if tick() - waittick >= 30 and not self:GetMobInCFrame(CFrame.new(-5541, 314, -2961)) then
				self:HopServersWithApi("https://minhnghia.pythonanywhere.com/api/CastleRaid", 20);
			end;
			self:Tweento(CFrame.new(-5043, 548, -3044));
		else
			local v = self:GetMobInCFrame(CFrame.new(-5541, 314, -2961));
			if v then
				repeat
					wait();
					if Process ~= "Raid Castle Quest" then
						break;
					end;
					self:KillMobs(v, "Auto Dual Cursed Katana");
				until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Raid Castle Quest";
			end;
		end;
	elseif Process == "Heavenly Dismension Quest" then
		local HeavenlyDimension = workspace._WorldOrigin.Locations["Heavenly Dimension"];
		if HeavenlyDimension and self:GetDistance(HeavenlyDimension.Position) <= 2000 then
			if workspace.Map:FindFirstChild("HeavenlyDimension") and (workspace.Map:FindFirstChild("HeavenlyDimension")).Exit.BrickColor == BrickColor.new("Cloudy grey") then
				self:Tweento(workspace.Map.HeavenlyDimension.Exit.CFrame);
				return;
			end;
			if self:DetectNearPlayersInCFrame(1000) then
				return;
			end;
			local v = self:GetMobInCFrame(HeavenlyDimension.Position);
			if v then
				repeat
					wait();
					self:KillMobs(v, "Auto Dual Cursed Katana");
				until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Heavenly Dismension Quest";
			else
				if workspace.Map:FindFirstChild("HeavenlyDimension") then
					for i, v in next, (workspace.Map:FindFirstChild("HeavenlyDimension")):GetChildren() do
						if string.find(v.Name, "Torch") then
							if v.ProximityPrompt.Enabled then
								if self:GetDistance(v.Position) <= 30 then
									fireproximityprompt(v.ProximityPrompt);
								else
									self:Tweento(v.CFrame);
								end;
							end;
						end;
					end;
				end;
			end;
		else
			if self:GetMob("Cake Queen", true) then
				local v = self:GetMob("Cake Queen", true);
				repeat
					task.wait();
					if self:CheckNotify("loading...") or not self:IsAlive(v) then
						DontHop = true;
						break;
					end;
					self:KillMobs(v, "Auto Dual Cursed Katana");
				until not v or not v.Parent or not self:IsAlive(v) or not Settings["Auto Dual Cursed Katana"] or Process ~= "Heavenly Dismension Quest" or self:CheckNotify("loading...");
				DontHop = true;
			elseif not self:CheckNotify("loading...") and (not self:GetMob("Cake Queen", true) and not DontHop) then
				if self:GetDistance(CFrame.new(-731.20343017578125, 381.56588745117188, -11198.4951171875)) <= 500 then
					wait(3);
					DontHop = false;
					self:HopServersWithApi("https://minhnghia.pythonanywhere.com/api/CakeQueen");
				else
					self:Tweento(CFrame.new(-731.20343017578125, 381.56588745117188, -11198.4951171875));
				end;
			end;
		end;
	end;
end;
function Modules.GetChest(self)
	local distance = math.huge;
	local a;
	local Chest = (game:GetService("CollectionService")):GetTagged("_ChestTagged");
	for i = 1, #Chest, 1 do
		local v = ((Chest[i]:GetPivot()).Position - self.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
		if Chest[i].Parent and (Chest[i]:FindFirstChild("TouchInterest") and (not Chest[i]:GetAttribute("IsDisabled") and v <= distance)) then
			distance = v;
			a = Chest[i];
		end;
	end;
	return a;
end;
function Modules.IsRaiding(self, x)
	for i, v in next, workspace._WorldOrigin.Locations:GetChildren() do
		if v.Name == "Island 1" and self:GetDistance(x.Position, v.Position) <= 10000 then
			return true;
		end;
	end;
	return false;
end;
function Modules.CreateCacheFolder(self)
	local AllSpawnPoint = {};
	if not workspace:FindFirstChild("NightHubCache") then
		local Folder = Instance.new("Folder", workspace);
		Folder.Name = "NightHubCache";
	end;
	repeat
		wait();
	until workspace:FindFirstChild("NightHubCache");
	local MobSpawns = Instance.new("Folder", workspace.NightHubCache);
	MobSpawns.Name = "MobSpawns";
	for i, v in next, workspace.NightHubCache.MobSpawns:GetChildren() do
		v:Destroy();
	end;
	for i, v in next, workspace._WorldOrigin.EnemySpawns:GetChildren() do
		local niger = v:Clone();
		niger.Name = niger.Name:gsub(" %pLv. %d+%p", "");
		niger.Parent = workspace.NightHubCache.MobSpawns;
	end;
	local FarmLevelMob = {};
	for i, v in next, require(self.Quests) do
		for i1, v1 in next, v do
			for i2, v2 in next, v1.Task do
				if v1.Task[i2] > 1 then
					table.insert(FarmLevelMob, i2);
				end;
			end;
		end;
	end;
	for i, v in next, game.Workspace.Enemies:GetChildren() do
		if table.find(FarmLevelMob, v.Name) then
			table.insert(AllSpawnPoint, v);
		end;
	end;
	for i, v in next, game.ReplicatedStorage:GetChildren() do
		if table.find(FarmLevelMob, v.Name) then
			table.insert(AllSpawnPoint, v);
		end;
	end;
	for i, v in next, getnilinstances() do
		pcall(function()
			if v:FindFirstChild("Humanoid") and table.find(FarmLevelMob, v.Name) then
				table.insert(AllSpawnPoint, v);
			end;
		end);
	end;
	for i, v in next, AllSpawnPoint do
		if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
			local Part = Instance.new("Part", workspace.NightHubCache.MobSpawns);
			Part.Name = v.Name;
			Part.CanCollide = false;
			Part.Transparency = 1;
			Part.Anchored = true;
			Part.Size = Vector3.new(1, 1, 1);
			Part.CFrame = v.HumanoidRootPart.CFrame;
		elseif v:IsA("Part") then
			local a = v:Clone();
			a.Parent = workspace.NightHubCache.MobSpawns;
		end;
	end;
end;
Modules:CreateCacheFolder();
print("Refresh Folder Mobs");
function Modules.TweenToMobSpawn(self, MobName, StopFunc)
	for i, v in next, workspace.NightHubCache.MobSpawns:GetChildren() do
		if typeof(MobName) == "string" and v.Name:lower() == MobName:lower() or (typeof(MobName) == "table" and table.find(MobName, v.Name)) and self:GetDistance(v.Position) >= 50 then
			repeat
				wait();
				if not Settings[StopFunc] or self:GetMob(MobName) then
					break;
				end;
				self:Tweento(v.CFrame * CFrame.new(0, 20, 0));
				wait(1);
			until not Settings[StopFunc] or self:GetDistance(v.Position) <= 30 or self:GetMob(MobName);
		end;
	end;
end;
function Modules.GetBerries(self)
	local Berries, max, returner = (game:GetService("CollectionService")):GetTagged("BerryBush"), math.huge, nil;
	for i = 1, #Berries, 1 do
		for r, v in next, Berries[i]:GetAttributes() do
			if table.find({
				"Blue Icicle Berry",
				"Green Toad Berry",
				"Orange Berry",
				"Pink Pig Berry",
				"Purple Jelly Berry",
				"Red Cherry Berry",
				"White Cloud Berry",
				"Yellow Star Berry",
			}, v) then
				local a = ((Berries[i].Parent:GetPivot()).Position - self.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
				if a <= max then
					max, returner = a, Berries[i];
				end;
			end;
		end;
	end;
	return returner;
end;
function Modules.GetRaidIsland(self)
	local select;
	for i = 5, 1, -1 do
		for _, v in next, workspace._WorldOrigin.Locations:GetChildren() do
			if v.Name == "Island " .. tostring(i) and (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
				select = v;
				break;
			end;
		end;
		if select then
			break;
		end;
	end;
	return select;
end;
function Modules.GetBartiloPlates(self)
	local Plates = workspace.Map.Dressrosa.BartiloPlates:GetChildren();
	local Select;
	table.sort(Plates, function(i, v)
		return tonumber(i.Name:match("%d+$")) < tonumber(v.Name:match("%d+$"));
	end);
	for i, v in next, Plates do
		if v.BrickColor == BrickColor.new("Sand yellow") then
			Select = v;
			break;
		end;
	end;
	return Select;
end;
function Modules.Call(self, x, xx, xxx)
	if x == "Elite" then
		local Elite = self:GetElite();
		if Elite then
			if self.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(self.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, Elite.Name) then
				if self:GetDistance(workspace["Elite Hunter"].Position) <= 15 then
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("EliteHunter");
				else
					(game:GetService("ReplicatedStorage")).Remotes.CommF_:InvokeServer("AbandonQuest");
					self:Tweento(workspace["Elite Hunter"].CFrame);
				end;
			else
				if Elite and self:IsAlive(Elite) then
					repeat
						wait();
						Modules:KillMobs(Elite, xx);
					until not Elite or not Elite.Parent or not Modules:IsAlive(Elite) or not Settings[x];
				end;
			end;
		else
			if xxx == nil or xxx == true then
				self:HopServersWithApi("https://minhnghia.pythonanywhere.com/api/Elite");
			end;
		end;
	end;
end;
function Modules.GetNpcMeleeBuy(self, x)
	if not x then
		return;
	end;
	local NpcWithMelee = {
			["Black Leg"] = "Dark Step Teacher",
			Electro = "Mad Scientist",
			["Fishman Karate"] = "Water Kung-fu Teacher",
			["Dragon Claw"] = "Sabi",
			Superhuman = "Martial Arts Master",
			["Dark Step"] = "Phoeyu, the Reformed",
			["Sharkman Karate"] = "Sharkman Teacher",
			["Electric Claw"] = "Previous Hero",
			["Dragon Talon"] = "Uzoth",
			Godhuman = "Ancient Monk",
			["Sanguine Art"] = "Shafi",
		};
	for i, v in next, NpcWithMelee do
		if i == x then
			return v;
		end;
	end;
end;
function Modules.GetNearestMobs(self)
	local maxdistance = math.huge;
	local select;
	for i, v in next, workspace.Enemies:GetChildren() do
		if v and (v.Parent and (self:IsAlive(v) and (self:GetDistance(v.PrimaryPart.Position) <= 1000 and self:GetDistance(v.PrimaryPart.Position) <= maxdistance))) then
			maxdistance = self:GetDistance(v.PrimaryPart.Position);
			select = v;
		end;
	end;
	return select;
end;
Modules.Saved = {};
function Modules.AddFeature(self, TAB, TYPE, CONFIG)
	local function AddChildFeature(SECTION, TYPE, CONFIG)
		if TYPE == "Toggle" then
			local CFToggle = {};
			CFToggle.Title = CONFIG.Title;
			CFToggle.Description = CONFIG.Description or "";
			CFToggle.Default = CONFIG.Default or Settings[CONFIG.Title];
			CFToggle.Callback = CONFIG.Callback or function(v)
					Settings[CONFIG.Title] = v;
					self:Save();
					if Functions[CONFIG.Title] and Functions[CONFIG.Title].Enable then
						Functions[CONFIG.Title]["Real Function"]();
					end;
				end;
			return SECTION:AddToggle(CFToggle);
		elseif TYPE == "Button" then
			local CFButton = { Title = CONFIG.Title, Description = CONFIG.Description, Callback = CONFIG.Callback or function(...)
 
					end };
			return SECTION:AddButton(CFButton);
		elseif TYPE == "Label" then
			return SECTION:AddLabel(CONFIG.Title);
		elseif TYPE == "Paragraph" then
			return SECTION:AddParagraph(CONFIG);
		elseif TYPE == "Slider" then
			local CFSlider = {};
			CFSlider.Title = CONFIG.Title;
			CFSlider.Description = CONFIG.Description or "";
			CFSlider.Max = CONFIG.Max;
			CFSlider.Min = CONFIG.Min;
			CFSlider.Increment = CONFIG.Increment;
			CFSlider.Default = CONFIG.Default or Settings[CONFIG.Title];
			CFSlider.Callback = CONFIG.Callback or function(v)
					Settings[CONFIG.Title] = v;
					self:Save();
				end;
			return SECTION:AddSlider(CFSlider);
		elseif TYPE == "Dropdown" then
			local CFDropdown = {};
			CFDropdown.Title = CONFIG.Title;
			CFDropdown.Values = CONFIG.Values;
			CFDropdown.Description = CONFIG.Description or "";
			CFDropdown.Multi = CONFIG.Multi;
			CFDropdown.Default = CONFIG.Default or Settings[CONFIG.Title];
			CFDropdown.Callback = CONFIG.Callback or function(v)
					Settings[CONFIG.Title] = v;
					self:Save();
				end;
			return SECTION:AddDropdown(CFDropdown);
		elseif TYPE == "Textbox" then
			local TextboxCF = {};
			TextboxCF.Title = CONFIG.Title;
			TextboxCF.Default = CONFIG.Default or Settings[CONFIG.Title];
			TextboxCF.PlaceHolder = CONFIG.PlaceHolder;
			TextboxCF.Callback = CONFIG.Callback or function(v)
					Settings[CONFIG.Title] = v;
					self:Save();
				end;
			return SECTION:AddInput(TextboxCF);
		elseif TYPE == "Section" then
			local ConfigSection = {};
			ConfigSection.Title = CONFIG.Title;
			ConfigSection.Content = CONFIG.Description or "";
			ConfigSection.List = CONFIG.List or {};
			local REAL_SECTION = SECTION:AddSection(ConfigSection);
			for i, v in next, ConfigSection.List do
				AddChildFeature(REAL_SECTION, v[1], v[2]);
			end;
			return REAL_SECTION;
		elseif TYPE == "Seperator" then
			return SECTION:AddSeperator(CONFIG.Title);
		else
			return;
		end;
	end;
	CONFIG = CONFIG or {};
	if not TAB or not TYPE or not CONFIG then
		return;
	end;
	return AddChildFeature(TAB, TYPE, CONFIG);
end;