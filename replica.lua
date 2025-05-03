if not game:IsLoaded() then
    game.Loaded:Wait()
end
if game:GetService("BadgeService"):UserHasBadgeAsync(game.Players.LocalPlayer.UserId, 2125950512) then
     game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Nice!",Text = "Congratulations, you got bob ;)" ,Duration = 1000, Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "OK"})
     fireclickdetector(game:GetService("Workspace").Lobby.bob.ClickDetector)
     return 
end

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/FernandoVeigaAquiar/slap/refs/heads/main/replica.lua\"))()")
    end
end)

local RepeatTime = 750000 -- Make the number smaller if your executor can't handle the lag 
fireclickdetector(game:GetService("Workspace").Lobby.Replica.ClickDetector)
wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby.Teleport1.CFrame
task.wait(.3)
for i = 1, RepeatTime do
	game:GetService("ReplicatedStorage").Duplicate:FireServer(unpack({[1] = true}))
	if i == 45 then
	    local serverList = {}
        for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
	        if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
		        serverList[#serverList + 1] = v.id
		    end
	    end
    end
    if #serverList > 0 then
	    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1, #serverList)])
    end
    
end
wait(0.5)
--[[serverhop script by Inco]]--
