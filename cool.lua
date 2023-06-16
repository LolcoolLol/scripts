local dat = game:HttpGet("https://raw.githubusercontent.com/LolcoolLol/scripts/main/whitelists2.json")
local sx = game:GetService("HttpService")
local xs = sx:JSONDecode(dat)
--print("✔ | Loaded!", "Data: "..tostring(xs))
if not xs then return end
local rs = game:GetService("ReplicatedStorage")
local pl = game:GetService("Players")
local plr = pl.LocalPlayer
local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
local versiox = textChatService.ChatVersion
repeat task.wait() until game:IsLoaded()
local replicatedStorageService = game:GetService("ReplicatedStorage")
pcall(function()
  local ocf
  local oct = {}
  if getconnections then
    for i, v in pairs(getconnections(rs.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
      if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
        oct = getmetatable(debug.getupvalues(v.Function)[1])
        ocf = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
         getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
          local tab = ocf(Self, Name)
          if tab and tab.AddMessageToChannel then
            local addmessage = tab.AddMessageToChannel
            if oct[tab] == nil then
              oct[tab] = tab.AddMessageToChannel
            end
            tab.AddMessageToChannel = function(se, md)
              local x = md.FromSpeaker 
              if x and pl[x] then
                if not xs[tostring(pl[x].UserId)] or not xs[tostring(pl[x].UserId)].tag then 
                  return addmessage(se, md) 
                end
                local tag = xs[tostring(pl[x].UserId)]["tag"] 
                local r = xs[tostring(pl[x].UserId)]["r"] or 128
                local g = xs[tostring(pl[x].UserId)]["g"] or 0
                local b = xs[tostring(pl[x].UserId)]["b"] or 128
                md.ExtraData = {
                  NameColor = md.ExtraData.NameColor or Color3.fromRGB(255,0,0),
                  Tags = {
                    table.unpack(md.ExtraData.Tags),
                    {
                      TagColor = Color3.fromRGB(r, g, b),
                      TagText = tag
                    },
                  },
                }
              end
              return addmessage(se, md)
            end
          end
          return tab
        end
      end
    end
  end
end)
pcall(
  function()
    textChatService.OnIncomingMessage = function(message)
      local props = Instance.new("TextChatMessageProperties")
			if not message.TextSource then return end
      local plr = playersService:GetPlayerByUserId(message.TextSource.UserId)
			if not plr then return end
      if xs[tostring(plr.UserId)] and xs[tostring(plr.UserId)]["tag"] then
        local t = xs[tostring(plr.UserId)].tag
        local r, g, b = xs[tostring(plr.UserId)].r or 128, xs[tostring(plr.UserId)].g or 0, xs[tostring(plr.UserId)].b or 128
        props.PrefixText = "<font color='#"..Color3.fromRGB(r,g,b):ToHex().."'>[".. t .."]</font> "..message.PrefixText
      end
      return props
    end
  end
)
