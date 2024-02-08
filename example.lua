function love.load()
    ilovetimers = require 'ilovetimers' -- load module
    cube = {x=15} -- load cube

    ilovetimers.newTimer('moveCube',0.2,0,function() -- move cube 15 units to the right every .2 seconds infinitely
        cube.x = cube.x + 15
    end)

end

function love.keypressed(key)
    if key == 'escape' then love.event.quit() end
end

function love.update(dt)
    ilovetimers.update(dt) -- update module w/ dt
end

function love.draw()
    love.graphics.rectangle('fill',cube.x,15,25,25) -- draw cube
end