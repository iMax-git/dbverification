Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local countPlayer = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM users") -- get count from table in mysql 
        local countPlayerText = '[DBVERIFICATION | WIP | 0.0.1] - Nombre de Ligne dans la base de donnée des joueurs: ' .. countPlayer --  text 
        print(countPlayerText) -- print in console 
        break -- stop my request
    end
end)
RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    data.victim = source

    if data.killedByPlayer then
        TriggerClientEvent('esx:showNotification', -1, GetPlayerName(data.victim) .. 'was killed by ' .. GetPlayerName(data.killerServerId) .. ' from ' .. data.distance .. ' units')
    else
        TriggerClientEvent('esx:showNotification', -1, GetPlayerName(data.victim) .. ' died')
    end
end)



AddEventHandler('es:playerLoaded', function(source) 
    Citizen.Wait(10000)
    local countPlayer = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM users")
    TriggerClientEvent('esx:showAdvancedNotification', source, "DBVERIFICATION", "Fin de Chargement", 'Nombre de Ligne dans la base de donnée des joueurs: ' .. countPlayer, 'CHAR_AMMUNATION', 3)
    local playerLoadedprinted = '[DBVERIFICATION | WIP | 0.0.1] - playerLoaded es Printed Now'
    print(playerLoadedprinted)
end)