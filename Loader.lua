local tree = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/scripts/git/trees/"..game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.github.com/repos/CryptiHub/scripts/branches/main")).commit.commit.tree.sha.."?recursive=1"))
for _, scrip in ipairs(tree.tree) do
    if scrip.type == "blob" and scrip.path ~= "Loader.lua" and string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:lower(), string.split(scrip.path:lower(), ".lua")[1]) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptiHub/scripts/main/"..scrip.path))()
        break
    else
        print("game not supported")
    end
end
