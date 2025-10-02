local tree = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/scripts/git/trees/"..game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/scripts/branches/main")).commit.commit.tree.sha.."?recursive=1"))
for _, scrip in ipairs(tree.tree) do
    if scrip.type == "blob" and scrip.path ~= "Loader.lua" and string.split(string.split(scrip.path:lower(), ".lua")[1]:lower(),game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:lower())[1] ~= game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:lower() then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptiHub/scripts/main/"..scrip.path))()
    end
end
