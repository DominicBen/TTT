-- Define the base class Role

---@class Role
Role = {}
Role.__index = Role
Role.roles = {}
Role.loadout = nil
function Role:getRoleString()
    return self.name
end

function Role:getColor()
    return self.color
end

function Role:addWeaponToLoadout(wep)
    table.insert(Role.loadout, wep)
end

function Role:getLoadout()
    if self.loadout == nil then
        self.loadout = {}
        for k, w in pairs(weapons.GetList()) do
            if w and istable(w.InLoadoutFor) then
                for _, wrole in pairs(w.InLoadoutFor) do
                    if wrole == self:toEnum() then
                        table.insert(self.loadout, WEPS.GetClass(w))
                    end
                end
            end
        end
    end
    return self.loadout
end

function Role.addRoleToRoles(role)
    table.insert(Role.roles, role)
end

function Role.getRoles()
    return Role.roles
end

function Role:getDarkColor()
    local darkColor = Color(self.color.r - 40, self.color.g - 40, self.color.b - 40, self.color.a - 100)
    return darkColor
end

function Role:getHealth()
    return self.health
end

function Role:getRunSpeed()
    return self.runSpeed
end

function Role:getPortrait()
    return self.hudCycler
end

function Role.selectRoles()
    error("This is a Abstract Function")
end

function Role.GetMaxRoleCount()
    error("Abstract function")
end

function Role:toEnum()
    return self.enum
end
