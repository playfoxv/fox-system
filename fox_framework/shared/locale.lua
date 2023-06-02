-- To submit a new language, please create a thread in our discord.

Locales = {}

-- English localization
Locales["en"] = {
    ["valid_api"] = "^2[Fox]: You have a valid key!",
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Please make sure you have a database connection!",
    ["error_scriptname"] = "^1[ERROR]: Dont rename the Script Folder!",
    ["error_api"] = "^1[ERROR]: Please make sure you have a valid key!"
}

-- German localization
Locales["de"] = {
    ["valid_api"] = "^2[Fox]: Dein Key wurde erfolgreich überprüft!",
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Bitte Stelle Sicher, dass du eine Datenbankverbindung hast!",
    ["error_scriptname"] = "^1[ERROR]: Bitte nenne den Script Ordner nicht um!",
    ["error_api"] = "^1[ERROR]: Bitte ändere deinen Key in der Config!"
}

LocalizedStrings = Locales[Config.Language]