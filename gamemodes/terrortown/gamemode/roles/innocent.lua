if CLIENT then print("Loading Innocent File") end
Innocent = setmetatable({}, { __index = Role })
Role.addRoleToRoles(Innocent)
ROLE_INNOCENT     = 0
Innocent.enum     = ROLE_INNOCENT
Innocent.name     = "innocent"
Innocent.color    = Color(55, 170, 50, 255)
Innocent.health   = 100
Innocent.runSpeed = 1.0

if CLIENT then
    if Innocent == nil then
        error("Load of Inoocent failed")
    else
        print("loaded Innocent successfully")
    end
    Innocent.hudCycler = HUDCycler:new("materials/vgui/unknownRole", 0.25)
end
function Innocent.selectRoles(maxNumber, choices, prev_roles)
    while (#choices >= 1) do
        -- select random index in choices table
        local pick = math.random(1, #choices)
        local pply = choices[pick]
        if IsValid(pply) then
            pply:SetRole(ROLE_INNOCENT)
            table.remove(choices, pick)
        end
    end
end
