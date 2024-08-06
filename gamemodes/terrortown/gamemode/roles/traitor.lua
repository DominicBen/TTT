-- Define static roles
Traitor = setmetatable({}, { __index = Role })
Traitor.name = "traitor"
Traitor.color = Color(180, 50, 40, 255)
Traitor.health = 80
Traitor.runSpeed = 1.2