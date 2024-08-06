Detective = setmetatable({}, { __index = Role })
Detective.name = "detective"
Detective.color = Color(50, 60, 180, 255)
Detective.health = 100
Detective.runSpeed = 1.1