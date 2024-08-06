-- Define the HUDCycler class
HUDCycler = {}
HUDCycler.__index = HUDCycler

-- Constructor for HUDCycler
function HUDCycler:new(folderName, switchTime)
    local obj = setmetatable({}, HUDCycler)
    obj.images = {}
    obj.currentIndex = 1
    obj.switchTime = switchTime or 1
    obj.lastSwitch = CurTime()
   
    obj:LoadImagesFromFolder(folderName)
    return obj
end

-- Function to load all PNG files from a folder
function HUDCycler:LoadImagesFromFolder(folderName)
    local files, _ = file.Find(folderName .. "/*.png", "GAME")
    for _, fileName in ipairs(files) do
        local mat = Material(folderName .. "/" .. fileName)
        table.insert(self.images, mat)
    end
end

-- Function to draw the current image
function HUDCycler:Draw(x,y, scale)
    if #self.images == 0 then return end

    if CurTime() - self.lastSwitch >= self.switchTime then
        self.currentIndex = self.currentIndex % #self.images + 1
        self.lastSwitch = CurTime()
    end

    local mat = self.images[self.currentIndex]
    local width = 128
    scale = scale or 1
    surface.SetMaterial(mat)
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(x, y, width * scale, width * scale)
end