local timersMod = {}
timersMod.currentTimers = {}

function timersMod.findTimer(identifier)
    for index,data in pairs(timersMod.currentTimers) do
        if data.identifier == identifier then
            return data,index
        end
    end
    return false
end
function timersMod.rewindTimer(identifier,resetCrntInt)
    local data = timersMod.findTimer(identifier)
    if not data then return false end

    if data.dt then
        data.dt = 0
    else
        data.preciseTime = love.timer.getTime()
    end
    if resetCrntInt then
        data.crntInc = 0
    end

    return true
end
function timersMod.setTimerPaused(identifier,toggle)
    local data = timersMod.findTimer(identifier)
    if not data then return false end

    data.paused = toggle
    return true
end
function timersMod.getTimerPaused(identifier)
    local data = timersMod.findTimer(identifier)
    if not data then return 'notfound' end

    return data.paused
end
function timersMod.removeTimer(identifier)
    local data,index = timersMod.findTimer(identifier)
    if not data then return false end

    table.remove(timersMod.currentTimers,index)
    return true
end

function timersMod.newTimer(identifier,timePerIter,maxIter,execution,isPrecise)
    if timersMod.findTimer(identifier) then return false end

    local timerTable = {}

    timerTable.identifier = identifier
    timerTable.maxDt = timePerIter
    timerTable.maxIter = maxIter
    timerTable.execution = execution

    if (isPrecise) then
        timerTable.preciseTime = love.timer.getTime()
    else
        timerTable.dt = 0
    end
    timerTable.crntInc = 0
    timerTable.paused = false

    table.insert(timersMod.currentTimers,timerTable)
    return timerTable
end

function timersMod.update(dt)
    local loveTime = love.event.getTime()
    for index,data in pairs(timersMod.currentTimers) do
        
        if not data.paused then
            local didSurpass = false

            if data.dt then
                data.dt = data.dt + dt
                didSurpass = (data.dt >= data.maxDt)
            else
                didSurpass = ((loveTime - data.preciseTime) >= data.maxDt)
            end
            if didSurpass then
                if data.dt then
                    data.dt = 0
                else
                    data.preciseTime = loveTime
                end

                data.crntInc = data.crntInc + 1
                data.execution(data)

                if (data.crntInc >= data.maxIter) and data.maxIter > 0 then
                    table.remove(timersMod.currentTimers,index)
                end
            end
        end

    end
end

return timersMod
