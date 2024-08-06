Doctor = setmetatable({}, { __index = Role })
Doctor.name = "doctor"
Doctor.color = Color(50, 170, 144,255)
Doctor.health = 90
Doctor.runSpeed = 1.05