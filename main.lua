if arg[2] == "debug" then
    lldebugger = require("lldebugger")
    lldebugger.start()
end

local Box = require("Box")

Boxes = {}

Add = Box.new(10, 10, 75, 30, 0)

ClickAll = Box.new(10, 50, 75, 30, 0)

function love.load()
end

function love.draw()
    Add:draw()
    love.graphics.print("Add", 18, 12, 0, 2, 2)

    ClickAll:draw()
    love.graphics.print("ClickAll", 18, 52)

    for _, box in ipairs(Boxes) do
        box:draw()
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button ~= 1 then
        return
    end

    for i, box in ipairs(Boxes) do
        if box:within(x, y) then
            box:click()
            return
        end
    end

    if Add:within(x, y) then
        local x = math.random(95, 1024 - (30 + 95))
        local y = math.random(50, 768 - (30 + 50))

        table.insert(Boxes, Box.new(x, y, 30, 30, 0))
    end

    if ClickAll:within(x, y) then
        for _, box in ipairs(Boxes) do
            box:click()
        end
    end
end

local love_errorhandler = love.errorhandler
function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
