local Box = {}
Box.__index = Box

function Box.new(x, y, w, h, clicked)
    local box = setmetatable({}, Box)

    box.x = x
    box.y = y
    box.w = w
    box.h = h
    box.clicked = 0

    return box
end

function Box.within(self, x, y)
    return x > self.x and x < (self.x + self.w) and
        y > self.y and y < (self.y + self.h)
end

function Box.draw(self)
    local mode = "line"
    if self.clicked % 2 ~= 0 then
        mode = "fill"
    end

    love.graphics.rectangle(mode, self.x, self.y, self.w, self.h)
end

function Box.click(self)
    self.clicked = self.clicked + 1
end

return Box
