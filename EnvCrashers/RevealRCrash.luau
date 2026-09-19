-- RevealR environment crasher
if __env2_watchdog_4d657461 and typeof(__env2_watchdog_4d65746) == "function" then
    warn("RevealR detected, no watchdog and crashing env lmfao")
    __env2_watchdog_4d657461 = function() end
    task.spawn(function() 
        while true do end
    end)
    while true do end
end
