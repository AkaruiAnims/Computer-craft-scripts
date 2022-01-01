-- mine, return stuff to chest and keep auto mining, work and stop on command or return on command
-- calculate how much it can mine and know where it already did mine 
-- keep logs on how things are going
-- print where it needs more fuel and how much minimum to keep going
-- Quarry, stair/strip mining
--await hight input 
-- check inventory level and chest level

function termClear()
    term.clear()
    term.setCursorPos(1,1)
end

termClear()

print("turtle hight: ")
local hight = tonumber(read())
local bottom = hight - 12
-- local bottomed = false

function dropLoad()
    
end

function quarry()

end

function stairMine(fuel)
    local fueluse = 2*bottom
    local leftover = fuel - fueluse * 2
        for i = 0, bottom, 1 do
            turtle.dig()
            turtle.forward()
            turtle.digUp()
            turtle.digDown()
            turtle.down() 
        end

        for i = 0, (leftover/2), 1 do
        turtle.dig()
        turtle.forward() -- 1
        turtle.digUp()
        end

        turtle.turnLeft()
        turtle.turnLeft()

        for i = 0, (leftover+fueluse), 1 do
            if not(i >= leftover) then
            turtle.forward()
            else
                turtle.up()
                turtle.forward()
            end
        end
end

function horizontalWhipe()
    
end

termClear()
while true do
    local fuel = turtle.getFuelLevel()
    stairMine(fuel)
end