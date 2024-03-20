repeat wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.PlayerGui.MainLeft.Left.Currency.Diamonds.Diamonds.Visible == true
local Config = {
    ["Account"] = "",
    ["Value"] = nil,
    ["min"] = nil,
    ["timeskipballoon"] = nil
}
spawn(function()
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    workspace.MAP:Destroy()
    workspace.Map:Destroy()
    setfpscap(30)
    UserSettings():GetService("UserGameSettings").MasterVolume = 0
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = 0
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(w:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") and decalsyeeted then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        elseif v:IsA("SpecialMesh") and decalsyeeted then
            v.TextureId = 0
        elseif v:IsA("ShirtGraphic") and decalsyeeted then
            v.Graphic = 1
        elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
            v[v.ClassName .. "Template"] = 1
        end
    end
    for i = 1, #l:GetChildren() do
        e = l:GetChildren()[i]
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end

    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end
    for i, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    workspace.DescendantAdded:Connect(function(child)
        task.spawn(function()
            if child:IsA('ForceField') then
                RunService.Heartbeat:Wait()
                child:Destroy()
            elseif child:IsA('Sparkles') then
                RunService.Heartbeat:Wait()
                child:Destroy()
            elseif child:IsA('Smoke') or child:IsA('Fire') then
                RunService.Heartbeat:Wait()
                child:Destroy()
            end
        end)
    end)
end)
local namefile = game.Players.LocalPlayer.Name .. "-Pet99.json"
local HttpService = game:GetService("HttpService")

local function Load()
    if isfile(namefile) then
        local fileContents = readfile(namefile)
        if fileContents then
            local decodedConfig = HttpService:JSONDecode(fileContents)
            if decodedConfig then
                for key, value in pairs(decodedConfig) do
                    Config[key] = value
                end
            end
        end
    else
        writefile(namefile, HttpService:JSONEncode(Config))
    end
end
Load()

spawn(function()
    while wait() do
        local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
        local iditem = nil
        for i, v in pairs(save.Get().Inventory.Currency) do
            if v.id == "Diamonds" then
                iditem = i
                break
            end
        end

        local playerDiamonds = tonumber(game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"]
        .Value)
        local requiredDiamonds = tonumber(Config["Value"])

        if playerDiamonds and requiredDiamonds and playerDiamonds >= requiredDiamonds then
            local args = {
                [1] = Config["Account"],
                [2] = "Made By Honglamx",
                [3] = "Currency",
                [4] = tostring(iditem),
                [5] = playerDiamonds
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(
            unpack(args))
        end
    end
end)

spawn(function()
    while wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Large Gift Bag")
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Mini Chest")
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(
            "Gift Bag")
    end
end)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local function tpserverless(maxplayer)
    local Sitez;
    if foundAnything == "" then
        Sitez = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Sitez = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Sitez.nextPageCursor and Sitez.nextPageCursor ~= "null" and Sitez.nextPageCursor ~= nil then
        foundAnything = Sitez.nextPageCursor
    end
    local num = 0;
    for i, v in pairs(Sitez.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.playing) <= maxplayer then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
            end
        else
            print(tonumber(v.playing))
        end
    end
end

local function Teleportserverless(maxplayerr)
    pcall(function()
        tpserverless(maxplayerr)
        if foundAnything ~= "" then
            tpserverless(maxplayerr)
        end
    end)
end
function checkempty()
    for i, v in pairs(workspace.__THINGS.BalloonGifts:GetChildren()) do
        if v:FindFirstChild("Balloon") or i ~= nil or v ~= nil then
            return false
        else
            return true
        end
    end
end

spawn(function()
    while wait() do
        local empty = true
        local old = tick()
        repeat
            wait(1)
        until not checkempty() or (tick() - old) >= (Config.min * 60)
        if checkempty() then
            Teleportserverless(math.random(1, 5))
        end
    end
end)
spawn(function()
    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
            Teleportserverless(math.random(1, 5))
        end
    end)
end)
function getnamepet()
    local savename = {}
    for i, v in pairs(workspace.__THINGS.Pets:GetChildren()) do
        if v:IsA("Model") and not table.find(savename, v.Name) then
            table.insert(savename, v.Name)
        end
    end
    return savename
end

function checkequipgun()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == "WEAPON_" .. game.Players.LocalPlayer.Name then
            if v:FindFirstChild("Stick") then
                return true
            end
        end
    end
end

spawn(function()
    while wait() do
        if not checkequipgun() then
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Slingshot_Toggle"):InvokeServer()
        end
    end
end)

local a = game:GetService("Players")
local b = game:GetService("Workspace")
local c = game:GetService("RunService")
local d = game:GetService("VirtualUser")
local e = game:GetService("HttpService")
local e = game:GetService("UserInputService")
local e = game:GetService("ReplicatedStorage")
local a = a.LocalPlayer
local f = b:WaitForChild("__THINGS")
local g = f:WaitForChild("__INSTANCE_CONTAINER"):WaitForChild("Active")
local h = b:WaitForChild("__DEBRIS")
local i = e:WaitForChild("Network")
local function j()
    local old = tick()
    local c = game:GetService("Workspace").__THINGS.Lootbags:GetChildren()
    local d = {}
    local q = getsenv(a.PlayerScripts.Scripts.Game:WaitForChild("Lootbags Frontend")).Claim

    if #c > 0 and q then
        for i, a in c do
            q(a.Name)
        end
    end
end
spawn(function()
    while wait() do
        pcall(j)
    end
end)
spawn(function()
    while wait() do
        for i, v in game:GetService("Players").LocalPlayer.PlayerGui._MISC.FreeGifts.Frame.ItemsFrame.Gifts:GetChildren() do
            if v:FindFirstChild("Timer") and v.Timer.Text == "Redeem!" then
                local a = v.Name:gsub("Gift", "")
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Redeem Free Gift")
                    :InvokeServer(tonumber(a))
            end
        end
    end
end)
local time = os.time() -- Record the start time
local s = require(game:GetService("ReplicatedStorage").Library:WaitForChild("Client"))

s.PlayerPet.CalculateSpeedMultiplier = function(...)
    return 999
end
spawn(function()
    while wait() do
        local plr = game.Players.LocalPlayer
        spawn(function()
            while wait() do
                if NoClip and not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                    local BV = Instance.new("BodyVelocity")
                    BV.Parent = plr.Character.HumanoidRootPart
                    BV.Name = "EffectsSY"
                    BV.MaxForce = Vector3.new(100000, 100000, 100000)
                    BV.Velocity = Vector3.new(0, 0, 0)
                elseif not NoClip and plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                    plr.Character.HumanoidRootPart.EffectsSY:Destroy()
                end
            end
        end)
        for i, v in next, workspace.__THINGS.BalloonGifts:GetChildren() do
            NoClip = true
            if v:FindFirstChild("Balloon") then
                pcall(function()
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Balloon.CFrame *
                            CFrame.new(0, 20, 5)
                        local args = {
                            [1] = Ray.new(Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                                Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z)),
                            [2] = Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Click"):FireServer(
                            unpack(args))
                        local args = {
                            [1] = Vector3.new(v.Balloon.CFrame.X, v.Balloon.CFrame.Y, v.Balloon.CFrame.Z),
                            [2] = math.random(-1, 3),
                            [3] = math.random(-1, 1),
                            [4] = 200
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild(
                            "Slingshot_FireProjectile"):InvokeServer(unpack(args))
                        if v:FindFirstChild("Balloon") then
                            local args = {
                                [1] = tostring(v.Balloon:GetAttribute("BalloonId"))
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild(
                                "BalloonGifts_BalloonHit"):FireServer(unpack(args))
                        end
                        spawn(function()
                            if os.time() - time >= Config.timeskipballoon then
                                if v.Parent then
                                    v:Destroy()
                                    time = os.time()
                                    print("Destroyed" .. v.Name)
                                end
                            end
                        end)
                    until not v:FindFirstChild("Balloon") or not v or not v.Parent
                end)
            end
            break
        end
        workspace.__THINGS.Breakables.ChildAdded:Connect(function(v)
            if string.find(tostring(v:GetAttribute("BreakableID")), "Balloon") and tostring(v:GetAttribute("OwnerUsername")) == game.Players.LocalPlayer.Name then
                if v:FindFirstChild("1") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v["1"].Hitbox.CFrame
                    local b = s.PlayerPet.GetAll()
                    repeat
                        wait()
                        task.spawn(
                            function()
                                for a = 1, 10 do
                                    game:GetService("ReplicatedStorage"):WaitForChild("Network")
                                        .Breakables_PlayerDealDamage:FireServer(tostring(v.Name))
                                    task.wait(0.01)
                                end
                            end
                        )
                        for i, a in b do
                            s.PlayerPet.SetTarget(a, v)
                        end
                    until not v or not v.Parent or not string.find(tostring(v:GetAttribute("BreakableID")), "Balloon") or tostring(v:GetAttribute("OwnerUsername")) ~= game.Players.LocalPlayer.Name
                end
            end
        end)
    end
end)
print(Config.timeskipballoon)
local VirtualUser = game:service 'VirtualUser'
game:service('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
