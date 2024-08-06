-- Function to add all PNG files in a specified folder to resource downloads
function AddPngFilesFromFolder(folderName)
    -- Find all PNG files in the specified folder
    local files, directories = file.Find(folderName .. "/*.png", "GAME")

    -- Iterate over each file found
    for _, fileName in ipairs(files) do
        -- Construct the full path to the file
        local filePath = folderName .. "/" .. fileName
        -- Add the file to the resource list
        resource.AddFile(filePath)
        -- Print to the console for debugging
        print("Added file to download: " .. filePath)
    end
end

-- Example usage: Add all PNG files from the "materials/vgui" folder
AddPngFilesFromFolder("materials/vgui/unknownRole")
AddPngFilesFromFolder("materials/vgui/traitorRole")
AddPngFilesFromFolder("materials/vgui/detectiveRole")
