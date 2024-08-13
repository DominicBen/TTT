-- Define static roles
Traitor = setmetatable({}, { __index = Role })
Role.addRoleToRoles(Traitor)
ROLE_TRAITOR     = 1
Traitor.enum     = ROLE_TRAITOR
Traitor.name     = "traitor"
Traitor.color    = Color(180, 50, 40, 255)
Traitor.health   = 80
Traitor.runSpeed = 1.2
if CLIENT then
    Traitor.hudCycler = HUDCycler:new("materials/vgui/traitorRole", 0.25)
end
function Traitor.selectRoles(maxNumber, choices, prev_roles)
    local traitor_count = Traitor.GetMaxRoleCount(maxNumber)
    local ts = 0
    while (ts < traitor_count) and (#choices >= 1) do
        -- select random index in choices table
        local pick = math.random(1, #choices)

        -- the player we consider
        local pply = choices[pick]

        -- make this guy traitor if he was not a traitor last time, or if he makes
        -- a roll
        if IsValid(pply) and
            ((not table.HasValue(prev_roles[Traitor.name], pply)) or (math.random(1, 3) == 2)) then
            pply:SetRole(ROLE_TRAITOR)

            table.remove(choices, pick)
            ts = ts + 1
        end
    end
end

function Traitor.GetMaxRoleCount(ply_count)
    -- get number of traitors: pct of players rounded down
    local traitor_count = math.floor(ply_count * GetConVar("ttt_traitor_pct"):GetFloat())
    -- make sure there is at least 1 traitor
    traitor_count = math.Clamp(traitor_count, 1, GetConVar("ttt_traitor_max"):GetInt())

    return traitor_count
end
