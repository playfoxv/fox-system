-- Car Spawn Command:
RegisterCommand('car', function(source, args, rawCommand)
    local vehicleName = args[1]
    
    -- Check if the vehicle name is valid
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { LocalizedStrings["car_not_exist"] }
        })
        return
    end

    RequestModel(vehicleName)
    
    -- Wait until the model has loaded
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(1000) -- Wait 1 second to load the model
    end

    -- Spawn the vehicle
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
    
    -- Edit the vehicle
    SetVehicleNumberPlateText(vehicle, "ADMIN") -- Change the numberplate to admin
    SetVehicleHasBeenOwnedByPlayer(vehicle, false) -- Set the vehicle as not owned by the player (for better server performance)
    SetEntityAsNoLongerNeeded(vehicle) -- Set the vehicle as no longer needed (for better server performance)
    SetModelAsNoLongerNeeded(vehicleName) -- Set the model as no longer needed (for better client performance)

    -- Set the player ped into the vehicle
    SetPedIntoVehicle(playerPed, vehicle, -1)
end, false)


-- ---------------------------------------------------------------------------------------------------------------------------------------

-- Save car command (prevent car from despawning):
local savedVehicle = nil -- Variable to store the saved vehicle

RegisterCommand('savecar', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        savedVehicle = vehicle
        SetEntityAsMissionEntity(savedVehicle, true, true) -- Prevent the saved vehicle from despawning
        TriggerEvent('chat:addMessage', {
            color = { 0, 255, 0 },
            multiline = true,
            args = { LocalizedStrings["car_saved"] }
        })
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { LocalizedStrings["must_be_in_vehicle"] }
        })
    end
end, false)

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- Delete vehicle command:
RegisterCommand('dv', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if savedVehicle ~= nil and savedVehicle == vehicle then
            DeleteVehicle(savedVehicle)
            savedVehicle = nil
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0 },
                multiline = true,
                args = { LocalizedStrings["car_deleted"] }
            })
        else
            DeleteVehicle(vehicle)
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0 },
                multiline = true,
                args = { LocalizedStrings["car_deleted"] }
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { LocalizedStrings["must_be_in_vehicle"] }
        })
    end
end, false)

-- ---------------------------------------------------------------------------------------------------------------------------------------

-- Add a description to the commands
TriggerEvent('chat:addSuggestion', '/car', LocalizedStrings["spawn_car"], {
    { name="spawnName", help="Vehicle Model Name" }
})

TriggerEvent('chat:addSuggestion', '/savecar', LocalizedStrings["save_car"], {})

TriggerEvent('chat:addSuggestion', '/dv', LocalizedStrings["delete_car"], {})
