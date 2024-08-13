Doctor = setmetatable({}, { __index = Role })
Role.addRoleToRoles(Doctor)
ROLE_DOCTOR     = 3
Doctor.enum     = ROLE_DOCTOR
Doctor.name     = "doctor"
Doctor.color    = Color(50, 170, 144, 255)
Doctor.health   = 90
Doctor.runSpeed = 1.05
Doctor.enum     = ROLE_DOCTOR
if CLIENT then
    Doctor.hudCycler = HUDCycler:new("materials/vgui/doctorRole", 0.25)
end
function Doctor.selectRoles(maxCount, choices, prev_roles)
    --- Make one of the remaining INNO a doctor
    if (#choices >= 1) then
        local pick = math.random(1, #choices)
        local pply = choices[pick]
        if (IsValid(pply)) then
            pply:SetRole(ROLE_DOCTOR)
            print(pply:Name() .. "is now a doctor")
            table.remove(choices, pick)
        end
    end
end
