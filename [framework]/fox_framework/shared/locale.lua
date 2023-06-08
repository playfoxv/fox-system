-- To submit a new language, please create a thread in our discord.

Locales = {}

-- English localization
Locales["en"] = {
    ["valid_api"] = "^2[Fox]: You have a valid key!",
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Please make sure you have a database connection!",
    ["error_scriptname"] = "^1[ERROR]: Dont rename the Script Folder!",
    ["error_api"] = "^1[ERROR]: Please make sure you have a valid key!",

    -- Commands:
 
    ["spawn_car"] = "Spawn a car with /car [Spawnname]",
    ["car_not_exist"] = "This car does not exist!",

    ["save_car"] = "Save the car on the server.",
    ["car_saved"] = "Car saved successfully!",
    ["must_be_in_vehicle"] = "You must be in a vehicle!",

    ["delete_car"] = "Delete a car!",
    ["car_deleted"] = "Car deleted!"
}

-- German localization
Locales["de"] = {
    ["valid_api"] = "^2[Fox]: Dein Key wurde erfolgreich überprüft!",
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Bitte Stelle Sicher, dass du eine Datenbankverbindung hast!",
    ["error_scriptname"] = "^1[ERROR]: Bitte nenne den Script Ordner nicht um!",
    ["error_api"] = "^1[ERROR]: Bitte ändere deinen Key in der Config!",

    -- Commands:
    ["spawn_car"] = "Spawne ein Auto mit /car [Spawnname]",
    ["car_not_exist"] = "Dieses Auto existiert nicht!",

    ["save_car"] = "Speichere ein Auto auf dem Server.",
    ["car_saved"] = "Auto wurde gespeichert!",
    ["must_be_in_vehicle"] = "Du musst in einem Fahrzeug sitzen!",

    ["delete_car"] = "Lösche das Fahrzeug!",
    ["car_deleted"] = "Fahrzeug Gelöscht!"
}

LocalizedStrings = Locales[Config.Language]