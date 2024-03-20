local namefile = game.Players.LocalPlayer.Name .. "-Pet99.json"
local Config = {
    ["Account"] = "",
    ["Value"] = nil
}
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
local iditem = nil
local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
for i, v in pairs(save.Get().Inventory.Currency) do
    if v.id == "Diamonds" then
        iditem = i
    end
end
spawn(function()
    while wait() do
        if game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value >= Config["Value"] and Config["Value"] ~= nil then
            local args = {
                [1] = Config["Account"],
                [2] = "Made By Honglamx",
                [3] = "Currency",
                [4] = tostring(iditem),
                [5] = Config["Value"]
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(
                unpack(args))
        end
    end
end)
