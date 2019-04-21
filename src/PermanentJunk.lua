PermanentJunk = { }

local databaseHost = "PermanentJunkDatabase"
local databaseVersion = 1
local namespace = 'PermanentJunk'

PermanentJunk.onAddOnLoaded = function()
    Database.data = ZO_SavedVars:NewAccountWide(databaseHost, databaseVersion)

    -- https://wiki.esoui.com/Events#Inventory_and_Currencies
    EVENT_MANAGER:RegisterForEvent(namespace, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, EventDispatcher)
end

EVENT_MANAGER:RegisterForEvent(namespace, EVENT_ADD_ON_LOADED, PermanentJunk.onAddOnLoaded)

pj_print = function(message, item)
    -- TODO: deployment script should delete inspect script
    if nil == Inspect then do return end end

    local secondArgument = nil ~= item and Inspect.inspect(item) or ''

    d(string.format('[PermanentJunk]: %s: %s', message, secondArgument))
end