-- To submit a new language, please create a thread in our discord.

Locales = {}

-- English localization
Locales["en"] = {
    -- Debug:
    ["no_mysql_connection"] = "^8[DEBUG]: Please make sure you have a database connection!"
}

-- German localization
Locales["de"] = {
    -- Debug:
    ["no_mysql_connection"] = "^8[DEBUG]: Bitte Stelle Sicher, dass du eine Datenbankverbindung hast!"
}

LocalizedStrings = Locales[Config.Language]