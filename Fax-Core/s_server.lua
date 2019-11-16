--[[
	GENERAL CONFIGURATION 
]]
-- Do you have the Whitelist Extension? (Set to "true" or "false").
FaxcWhiteL = true -- Not used

--[[
Fax Core, made by FAXES
Do not edit this file. Please edit the config.lua instead
]]
-- Checks for Ace perms
RegisterServerEvent("Fax:CheckWhite")
AddEventHandler('Fax:CheckWhite', function()

    local source = source -- just incase source doesn't exist for whatever reason
    if IsPlayerAceAllowed(source, "owner") then
        TriggerClientEvent("setPlayerGroup", source, "Owner")
    elseif IsPlayerAceAllowed(source, "snradmin") then
        TriggerClientEvent("setPlayerGroup", source, "Sadmin")
    elseif IsPlayerAceAllowed(source, "fadmin") then
        TriggerClientEvent("setPlayerGroup", source, "Admin")
    elseif IsPlayerAceAllowed(source, "member3") then
        TriggerClientEvent("setPlayerGroup", source, "M3")
    elseif IsPlayerAceAllowed(source, "member2") then
        TriggerClientEvent("setPlayerGroup", source, "M2")
    elseif IsPlayerAceAllowed(source, "member1") then
        TriggerClientEvent("setPlayerGroup", source, "M1")
    else
        TriggerClientEvent("setPlayerGroup", source, "Guest")
    end
end)

-- ODA Command
RegisterCommand("oda", function(source, args, rawCommand)
    if IsPlayerAceAllowed(source, "owner") then
        TriggerClientEvent("FaxCore:TeamYes", source)
    -- Check for senior admin perms
    elseif IsPlayerAceAllowed(source, "snradmin") then
        TriggerClientEvent("FaxCore:TeamYes", source)
    -- Check for admin perms
    elseif IsPlayerAceAllowed(source, "fadmin") then
        TriggerClientEvent("FaxCore:TeamYes", source)
	else
		print('FaxCore : Access Denied after /ODA was used.')
	end
end)

-- Version checker
PerformHttpRequest("http://faxes.zone/files/fax-core/version.txt", function(err, serverVersion, headers)
    local version = "v2.1.0"
    if string.find(serverVersion, version) == nil then
        Wait(120)
        print("\n")
        print("---------------------- Fax-Core ----------------------")
        print("---- ALERT : Your version of Fax-Core is outdated ----")
        print("--- Please update your version as soon as possible ---")
        print("------ http://faxes.zone/scripts/fax-core.html -------")
        print("------------------------------------------------------")
        print("\n")
    else
        Wait(120)
        print("\n")
        print("---------------------- Fax-Core ----------------------")
        print("--------- Fax Core is on the latest version ----------")
        print("------------------------------------------------------")
    end
end)

Citizen.CreateThread(function ()
check = (GetConvar("Fax-Core", "false") == "true")
    if not check then
        Wait(140)
        print("\n")
        print("---------------------- Fax-Core ----------------------")
        print("------ ALERT: Permissions are not set correctly ------")
        print("--- Please read the Wiki on setting up permissions ---")
        print("------ http://faxes.zone/scripts/fax-core.html -------")
        print("------------------------------------------------------")
        print("\n")
    end
end)
