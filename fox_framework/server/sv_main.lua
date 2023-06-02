-- Füge diese Funktion zu deinem Code hinzu
function CheckFrameworkKey(key)
    local endpoint = "http://185.94.29.161:3000/check-key"

    local requestData = {
        key = key
    }

    PerformHttpRequest(endpoint, function(errorCode, resultData, resultHeaders)
        if errorCode == 200 then
            -- Key ist gültig
            -- Füge hier den Code ein, der ausgeführt werden soll, wenn der Key gültig ist
            StartScriptLogic()
        else
            -- Key ist ungültig
            print(LocalizedStrings["error_api"])

            if Config.DiscordWebhook and Config.DebugWebhook then
                if Config.Language == "de" then
                    SendWebhookMessage("[Fox Framework] Ungültiger Key", "Ein ungültiger Key wurde erkannt.")
                end
                if Config.Language == "en" then
                    SendWebhookMessage("[Fox Framework] Invalid API Key", "An invalid API key was detected.")
                end
            end
        end
    end, "POST", json.encode(requestData), { ["Content-Type"] = "application/json" })
end

-- Funktion, die deine Script-Logik enthält
function StartScriptLogic()
    -- Füge hier deinen Code ein, der ausgeführt werden soll, wenn alle Bedingungen erfüllt sind
    print(LocalizedStrings["valid_api"])

    if Config.DiscordWebhook then
        if Config.Language == "de" then
            SendWebhookMessage("[Fox Framework] Server Startet", "Dein Server startet nun...")
        end
        if Config.Language == "en" then
            SendWebhookMessage("[Fox Framework] Server starting", "Your server is now starting...")
        end
    end
end

function SendWebhookMessage(title, message)
    local webhookData = {
        ["embeds"] = {
            {
                ["title"] = title,
                ["description"] = message,
                ["color"] = 16711680 -- Red color
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function(errorCode, resultData, resultHeaders)
        -- You can handle the result if needed
    end, "POST", json.encode(webhookData), { ["Content-Type"] = "application/json" })
end

Citizen.CreateThread(function()
    local resourceName = GetCurrentResourceName()

    if resourceName == "fox_framework" then
        local hasSqlConnection = false

        -- Check if oxmysql exists
        if exports.oxmysql then
            hasSqlConnection = true
        end

        if hasSqlConnection then
            -- Key-Abfrage durchführen
            CheckFrameworkKey(Config.Key)
        else
            print(LocalizedStrings["error_mysql"])

            if Config.DiscordWebhook and Config.DebugWebhook then
                if Config.Language == "de" then
                    SendWebhookMessage("[Fox Framework] Mysql Fehler", "Bitte stelle sicher, dass du eine Datenbankverbindung hast.")
                end
                if Config.Language == "en" then
                    SendWebhookMessage("[Fox Framework] Mysql error", "Please make sure you have a database connection.")
                end
            end
        end
    else
        print(LocalizedStrings["error_scriptname"])

        if Config.DiscordWebhook and Config.DebugWebhook then
            if Config.Language == "de" then
                SendWebhookMessage("[Fox Framework] Ungültiger Name", "Bitte nenne den Script Ordner nicht um.")
            end
            if Config.Language == "en" then
                SendWebhookMessage("[Fox Framework] Invalid name", "Please don't rename the Script Folder.")
            end
        end
    end
end)
