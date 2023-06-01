Citizen.CreateThread(function()
    local resourceName = GetCurrentResourceName()

    if resourceName ~= "fox-system" then
        print(LocalizedStrings["error_scriptname"])
    end
end)