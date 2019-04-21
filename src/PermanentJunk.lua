PermanentJunk = { database = {} }

local databaseHost = "PermanentJunkDatabase"
local namespaceSave = 'PermanentJunkSave'
local databaseVersion = 1
local namespace = 'PermanentJunk'

PermanentJunk.onAddOnLoaded = function()
    PermanentJunk.database = ZO_SavedVars:NewAccountWide(databaseHost, databaseVersion, namespaceSave, {})

    -- https://wiki.esoui.com/Events#Inventory_and_Currencies
    EVENT_MANAGER:RegisterForEvent(namespace, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, EventDispatcher)
end

EVENT_MANAGER:RegisterForEvent(namespace, EVENT_ADD_ON_LOADED, PermanentJunk.onAddOnLoaded)
