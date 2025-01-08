
RegisterCommand('time', function(source, args, rawCommand)
    
    if IsPlayerAceAllowed(source, "command.time") then

        if #args < 1 then
            TriggerEvent('chat:addMessage', {
                args = { '^3Suggestie', 'Gebruik het commando als volgt: /time [uur] of /time [dagdeel]' }
            })
            TriggerEvent('chat:addMessage', {
                args = { '^3Opties', 'Beschikbare opties: 0-23 (uur) of dagdelen: ochtend, middag, avond, nacht.' }
            })
            return
        end

       
        local timeInput = args[1]:lower()  
        local hour = nil

        if tonumber(timeInput) then
            hour = tonumber(timeInput)
            if hour < 0 or hour > 23 then
                TriggerEvent('chat:addMessage', {
                    args = { '^1Fout', 'Het uur moet een getal zijn tussen 0 en 23.' }
                })
                return
            end
        else

            if timeInput == 'ochtend' then
                hour = 9       
            elseif timeInput == 'middag' then
                hour = 12      
            elseif timeInput == 'avond' then
                hour = 18      
            elseif timeInput == 'nacht' then
                hour = 0       
            else
                TriggerEvent('chat:addMessage', {
                    args = { '^1Fout', 'Ongeldige invoer. Gebruik een getal (0-23) of een dagdeel (ochtend, middag, avond, nacht).' }
                })
                return
            end
        end

     
        NetworkOverrideClockTime(hour, 0, 0)

        local tijdsweergave = hour .. ":00"
        TriggerEvent('chat:addMessage', {
            args = { '^2Succes', 'De tijd is aangepast naar ' .. tijdsweergave .. '.' }
        })
    else

        TriggerEvent('chat:addMessage', {
            args = { '^1Fout', 'Je hebt geen permissie om dit commando te gebruiken.' }
        })
    end
end, false)
