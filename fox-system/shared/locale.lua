-- To submit a new language, please create a thread in our discord.

Locales = {}

-- English localization
Locales["en"] = {
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Please make sure you have a database connection!",
    ["error_scriptname"] = "^1[ERROR]: Dont rename the Script Folder!"
}

-- German localization
Locales["de"] = {
    -- Errors:
    ["error_mysql"] = "^1[ERROR]: Bitte Stelle Sicher, dass du eine Datenbankverbindung hast!",
    ["error_scriptname"] = "^1[ERROR]: Bitte nenne den Script Ordner nicht um!"
}

LocalizedStrings = Locales[Config.Language]