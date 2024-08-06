-- Define the base class Role
Role = {}

function Role:getRoleString()
    return self.name
end

function Role:getColor()
    return self.color
end

function Role:getDarkColor()
    local darkColor = Color(self.color.r - 40,self.color.g - 40,self.color.b - 40,self.color.a)
    return darkColor
end
function Role:getHealth()
    return self.health
end

function Role:getRunSpeed()
    return self.runSpeed
end