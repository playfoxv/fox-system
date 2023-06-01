fx_version 'cerulean' -- Latest FiveM Version
games { 'gta5' } -- The game that this mod is designed for

author 'Gerrxt <gerrxt07@proton.me>' -- Author of the mod
description 'Fox System - Your Server System' -- Description for the mod
version '1.0.0' -- Version for the mod

-- What to run
client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@oxmysql/lib/MySQL.lua',
    'shared/*.lua'
}

dependencies {
    '/onesync', -- Onesync enabled
    'oxmysql', -- Oxmysql installed
    'es_extended' -- ESX installed
}

lua54 'yes' -- Lua 5.4 enabled