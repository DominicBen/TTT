-- Define static roles
Unknown = setmetatable({}, { __index = Role })
Role.addRoleToRoles(Unknown)
ROLE_NONE        = ROLE_INNOCENT
Unknown.enum     = ROLE_NONE
Unknown.name     = "unknown"
Unknown.color    = Color(180, 180, 180, 255)
Unknown.health   = 80
Unknown.runSpeed = 1.2
function Unknown:getLoadout()
    if self.loadout == nil then
        self.loadout = Innocent:getLoadout()
    end
    return self.loadout
end

if CLIENT then
    Unknown.hudCycler = HUDCycler:new("materials/vgui/unknownRole", 0.25)
end
