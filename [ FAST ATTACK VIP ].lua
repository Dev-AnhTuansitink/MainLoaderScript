--// This file was created by NatAov Hub

(getgenv()).Settings = {
		Enable = true,
		AttackMobs = true,
		AttackPlayers = true,
		Distance = 60,
		AttackDelay = 0,
	};
_G.StartFarm = true;
_G.FastAttack = true;
task.spawn(function()
	local success, err = pcall(function()
			(loadstring(game:HttpGet("https://rise-evo.xyz/apiv3/attack-module.lua")))();
		end);
	if success then
		print("--> Ez fast attack");
	end;
end);
task.spawn(function()
	local success, err = pcall(function()
			(loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhDzaiScript/Setting/refs/heads/main/FastMax.lua")))();
		end);
	if success then
		print("--> NatAov Hub on top");
	end;
end);
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Workspace = game:GetService("Workspace");
local LocalPlayer = Players.LocalPlayer;
local Net = (ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net");
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack");
local RegisterHit = Net:WaitForChild("RE/RegisterHit");
local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent");
local function IsAlive(model)
	local hum = model and model:FindFirstChild("Humanoid");
	local root = model and model:FindFirstChild("HumanoidRootPart");
	return hum and (root and hum.Health > 0);
end;
local function GetTargets()
	local Targets = {};
	local MyRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
	if not MyRoot then
		return Targets;
	end;
	local Folders = {};
	if (getgenv()).Settings.AttackMobs then
		table.insert(Folders, Workspace.Enemies);
	end;
	if (getgenv()).Settings.AttackPlayers then
		table.insert(Folders, Workspace.Characters);
	end;
	for _, Folder in pairs(Folders) do
		for _, Enemy in pairs(Folder:GetChildren()) do
			if Enemy ~= LocalPlayer.Character and IsAlive(Enemy) then
				local EnemyRoot = Enemy.HumanoidRootPart;
				if (EnemyRoot.Position - MyRoot.Position).Magnitude <= (getgenv()).Settings.Distance then
					table.insert(Targets, { Enemy, EnemyRoot });
				end;
			end;
		end;
	end;
	return Targets;
end;
local function LocalAttackLoop()
	if not (getgenv()).Settings.Enable then
		return;
	end;
	local Character = LocalPlayer.Character;
	if not IsAlive(Character) then
		return;
	end;
	local Tool = Character:FindFirstChildOfClass("Tool");
	if not Tool then
		return;
	end;
	local Targets = GetTargets();
	if #Targets == 0 then
		return;
	end;
	if Tool.ToolTip == "Melee" or Tool.ToolTip == "Sword" then
		RegisterAttack:FireServer((getgenv()).Settings.AttackDelay);
		local ArgsHead = nil;
		local ArgsData = {};
		local Signature = (tostring(LocalPlayer.UserId)):sub(2, 4) .. (tostring(coroutine.running())):sub(11, 15);
		for _, Data in pairs(Targets) do
			local EnemyModel = Data[1];
			local EnemyRoot = Data[2];
			if not ArgsHead then
				ArgsHead = EnemyModel:FindFirstChild("Head");
			end;
			table.insert(ArgsData, { EnemyModel, EnemyRoot });
		end;
		if ArgsHead then
			pcall(function()
				RegisterHit:FireServer(ArgsHead, ArgsData, {}, Signature);
			end);
		end;
	elseif Tool.ToolTip == "Blox Fruit" then
		if Tool:FindFirstChild("LeftClickRemote") then
			local Nearest = Targets[1][2];
			local Direction = (Nearest.Position - Character.HumanoidRootPart.Position).Unit;
			pcall(function()
				Tool.LeftClickRemote:FireServer(Direction, 1);
			end);
		end;
	elseif Tool.ToolTip == "Gun" then
		local Nearest = Targets[1][2];
		pcall(function()
			ShootGunEvent:FireServer(Nearest.Position);
		end);
	end;
end;
RunService.Heartbeat:Connect(function()
	pcall(LocalAttackLoop);
end);
print("--> [System] \196\144\195\163 k\195\173ch ho\225\186\161t Fast Attack VIP (All Weapons)!");