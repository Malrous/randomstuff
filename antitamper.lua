-- original anti-tamper from leakd
-- modified to detect more
-- crashes the env once detected

local a = {}
local function r(n, f) a[#a+1] = {n, f} end

r("1", function()
    local b = workspace.CurrentCamera
    local c = b and b.ViewportSize
    return c ~= nil and c.X > 0 and c.Y > 0 and c.X <= 15360 and c.Y <= 8640
end)

r("2", function()
    local b = game:GetService("GuiService")
    local c = b:GetScreenResolution()
    local d = c.X / c.Y
    return c.X > 0 and c.Y > 0 and d >= 1 and d <= 3.5
end)

r("3", function()
    local b = game:GetService("RunService")
    local c = os.clock()
    b.Heartbeat:Wait()
    local d = os.clock() - c
    return d > 0 and d < 1
end)

r("4", function()
    local b = workspace.StreamingEnabled
    if not b then return true end
    local c = game:GetService("Players").LocalPlayer
    return c ~= nil and c.Character ~= nil
end)

r("5", function()
    local b = game:GetService("Players").LocalPlayer
    local c = b and b.Character
    local d = c and c:FindFirstChild("HumanoidRootPart")
    if not d then return true end
    local e = d.Position
    task.wait(0.5)
    local f = d.Position
    local g = (f - e).Magnitude
    return g == g
end)

r("6", function()
    local b = game:GetService("UserInputService")
    local c = b.MouseDeltaSensitivity
    return type(c) == "number" and c > 0
end)

r("7", function()
    local b = game:GetService("UserInputService")
    local c, d = pcall(function() return b.InputBegan:Connect(function() end) end)
    if c and d then d:Disconnect() end
    return c and d ~= nil
end)

r("8", function()
    local b = Instance.new("Sound")
    b.SoundId = "rbxassetid://12222216"
    b.Parent = workspace
    b:Play()
    task.wait(0.3)
    local c = type(b.PlaybackLoudness) == "number"
    b:Destroy()
    return c
end)

r("9", function()
    local b = game:GetService("ReplicatedStorage")
    local c = Instance.new("RemoteEvent")
    c.Parent = b
    local d = os.clock()
    local e = pcall(function() c:FireServer() end)
    local f = os.clock() - d
    c:Destroy()
    return e and f <= 5
end)

r("10", function()
    local b = game:GetService("Players").LocalPlayer
    local c = b and b:GetNetworkPing()
    return type(c) == "number" and c >= 0
end)

r("11", function()
    local b = game:GetService("Stats")
    local c = b.Network
    local d = c and c.ServerStatsItem
    return d ~= nil and d["Data Ping"] ~= nil
end)

r("12", function()
    local b = os.clock()
    local c = tick()
    task.wait(1)
    local d = os.clock() - b
    local e = tick() - c
    return math.abs(d - e) <= 0.5
end)

r("13", function()
    local b = game:GetService("Stats")
    local c = b:GetTotalMemoryUsageMb()
    return type(c) == "number" and c > 0
end)

r("14", function()
    local b = Instance.new("Part")
    b.Anchored = false
    b.Position = Vector3.new(0, 500, 0)
    b.Parent = workspace
    local c = b.Position.Y
    task.wait(0.5)
    local d = b.Position.Y
    b:Destroy()
    return d < c
end)

r("15", function()
    local b = Vector3.new(0, 1000, 0)
    local c = Vector3.new(0, -2000, 0)
    local d = workspace:Raycast(b, c)
    return d ~= nil and d.Position ~= nil
end)

r("16", function()
    local b = Instance.new("Part")
    b.Anchored = true
    b.Position = Vector3.new(0, 10, 0)
    b.Parent = workspace
    local c = false
    b.Touched:Connect(function() c = true end)
    local d = Instance.new("Part")
    d.Anchored = false
    d.Position = Vector3.new(0, 15, 0)
    d.Parent = workspace
    task.wait(1)
    b:Destroy()
    d:Destroy()
    return c
end)

r("17", function()
    local b = game:GetService("Players").LocalPlayer
    local c = b:WaitForChild("PlayerGui")
    local d = Instance.new("ScreenGui")
    d.Parent = c
    local e = Instance.new("Frame")
    e.Size = UDim2.new(0.5, 0, 0.5, 0)
    e.Parent = d
    task.wait(0.2)
    local f = e.AbsoluteSize
    d:Destroy()
    return f.X > 0 and f.Y > 0
end)

r("18", function()
    local b = game:GetService("Players").LocalPlayer
    local c = b:WaitForChild("PlayerGui")
    local d = Instance.new("ScreenGui")
    d.Parent = c
    local e = Instance.new("TextLabel")
    e.Text = "test123"
    e.Size = UDim2.new(0, 200, 0, 50)
    e.Parent = d
    task.wait(0.2)
    local f = e.TextBounds
    d:Destroy()
    return f.X > 0 and f.Y > 0
end)

r("19", function()
    local b = identifyexecutor
    if type(b) ~= "function" then return false end
    local c = b()
    return type(c) == "string" and #c > 0
end)

r("20", function()
    local b = http_request or (syn and syn.request) or request
    if type(b) ~= "function" then return false end
    local c = os.clock()
    local d = pcall(b, {Url = "https://httpbin.org/get", Method = "GET"})
    local e = os.clock() - c
    return d and e > 0 and e <= 15
end)

r("21", function()
    if type(writefile) ~= "function" or type(readfile) ~= "function" then return false end
    local b = "dtc_test.txt"
    local c = tostring(math.random(1, 999999))
    writefile(b, c)
    local d = readfile(b)
    if delfile then delfile(b) end
    return d == c
end)

r("22", function()
    local b = getrawmetatable
    if type(b) ~= "function" then return false end
    local c = b(game)
    return type(c) == "table"
end)

r("23", function()
    local b = game.PlaceId
    local c = game.JobId
    return type(b) == "number" and b > 0 and type(c) == "string"
end)

r("24", function()
    local b = game:GetService("Players").LocalPlayer
    local c = b and b.UserId
    if type(c) ~= "number" or c <= 0 then return false end
    local d = game:GetService("Players")
    local e, f = pcall(function() return d:GetNameFromUserIdAsync(c) end)
    return e and type(f) == "string"
end)

r("25", function()
    local b = game:GetService("Players").LocalPlayer
    if b.Character then return true end
    local c = false
    local d
    d = b.CharacterAdded:Connect(function() c = true end)
    task.wait(3)
    d:Disconnect()
    return c
end)

r("26", function()
    local b = workspace:GetServerTimeNow()
    return type(b) == "number" and b > 0
end)

r("27", function()
    local b = Instance.new("Part")
    b.Parent = workspace
    b:Destroy()
    return b.Parent == nil
end)

r("28", function()
    local b = game:GetService("Lighting")
    local c = b.ClockTime
    task.wait(1)
    local d = b.ClockTime
    return type(c) == "number" and type(d) == "number"
end)

r("29", function()
    local b = Instance.new("BasePart",nil)
    setscriptable(b, "PhysicsRepRootPart", true)
    setscriptable(b, "MaterialVariantSerialized", true)
    return b["PhysicsRepRootPart"].ClassName == "BasePart" and b["MaterialVariantSerialized"].ClassName == "string"
end)

local s = {}
for i = 1, #a do
    local n, f = a[i][1], a[i][2]
    local ok, res = pcall(f)
    if not ok or not res then
        s[#s + 1] = n
    end
end

if #s == 0 then
    continue
else
    warn("skid detected - crashing env")
    local function cr() task.spawn(function() cr() while true do end end) end
    task.spawn(function() cr() end)
    error("ultra-skid detected, get access denied")
end
