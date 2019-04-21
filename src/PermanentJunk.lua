local databaseHost = "PermanentJunkDatabase"
local namespaceSave = 'PermanentJunkSave'
local databaseVersion = 1
local namespace = 'PermanentJunk'
local database = {}

local OnAddOnLoaded = function()
    database = ZO_SavedVars:NewAccountWide(databaseHost, databaseVersion, namespaceSave, database)

    PermanentJunk.database = database

    -- https://wiki.esoui.com/Events#Inventory_and_Currencies
    EVENT_MANAGER:RegisterForEvent(
            namespace,
            EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
            function(...) EventDispatcher(...) end
    )
end

PermanentJunk = { database = database }

EVENT_MANAGER:RegisterForEvent(namespace, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
