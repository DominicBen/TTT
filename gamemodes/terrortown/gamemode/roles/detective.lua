local detective_karma_min = CreateConVar("ttt_detective_karma_min", "600")
Detective = setmetatable({}, { __index = Role })
Role.addRoleToRoles(Detective)
ROLE_DETECTIVE     = 2
Detective.enum     = ROLE_DETECTIVE
Detective.name     = "detective"
Detective.color    = Color(50, 60, 180, 255)
Detective.health   = 100
Detective.runSpeed = 1.1
if CLIENT then
    Detective.hudCycler = HUDCycler:new("materials/vgui/detectiveRole", 0.25)
end
function Detective.selectRoles(maxNumber, choices, prev_roles, temp)
    -- now select detectives, explicitly choosing from players who did not get
    -- traitor, so becoming detective does not mean you lost a chance to be
    -- traitor
    local ds = 0
    local det_count = Detective.GetMaxRoleCount(maxNumber)
    local min_karma = detective_karma_min:GetInt()
    while (ds < det_count) and (#choices >= 1) do
        -- sometimes we need all remaining choices to be detective to fill the
        -- roles up, this happens more often with a lot of detective-deniers
        if #choices <= (det_count - ds) then
            for k, pply in ipairs(choices) do
                if IsValid(pply) then
                    pply:SetRole(ROLE_DETECTIVE)
                end
            end

            break -- out of while
        end


        local pick = math.random(1, #choices)
        local pply = choices[pick]

        -- we are less likely to be a detective unless we were innocent last round
        if (IsValid(pply) and
                ((pply:GetBaseKarma() > min_karma and
                        table.HasValue(prev_roles[ROLE_INNOCENT], pply)) or
                    math.random(1, 3) == 2)) then
            -- if a player has specified he does not want to be detective, we skip
            -- him here (he might still get it if we don't have enough
            -- alternatives)
            if not pply:GetAvoidDetective() then
                pply:SetRole(ROLE_DETECTIVE)
                ds = ds + 1
            end

            table.remove(choices, pick)
        end
    end
end

function Detective.GetMaxRoleCount(ply_count)
    if ply_count < GetConVar("ttt_detective_min_players"):GetInt() then return 0 end

    local det_count = math.floor(ply_count * GetConVar("ttt_detective_pct"):GetFloat())
    -- limit to a max
    det_count = math.Clamp(det_count, 1, GetConVar("ttt_detective_max"):GetInt())

    return det_count
end
