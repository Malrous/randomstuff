-- RevealR environment crasher
if __env2_watchdog_4d657461 and typeof(__env2_watchdog_4d657461) == "function" then
    warn("This envlog was kindly crashed by the edf")
    __env2_watchdog_4d657461 = function() end
    task.spawn(function()
        while task.wait() do
            while true do error("[ENV2_WATCHDOG] script stopped because skill issue") end
        end
    end)
end
