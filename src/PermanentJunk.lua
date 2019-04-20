PermanentJunk = {
    variableVersion = 1,
    namespace = 'PermanentJunk',
    databaseId = "PermanentJunkDatabase",
    database = {},
    onAddOnLoaded = function()
        PermanentJunk.database = ZO_SavedVars:NewAccountWide(
                PermanentJunk.databaseId,
                PermanentJunk.variableVersion,
                PermanentJunk.namespace,
                {}
        )

        -- https://wiki.esoui.com/Events#Inventory_and_Currencies
        EVENT_MANAGER:RegisterForEvent(
                PermanentJunk.namespace,
                EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
                PermanentJunk.update
        )

        -- https://wiki.esoui.com/AddFilterForEvent
        EVENT_MANAGER:AddFilterForEvent(
                PermanentJunk.namespace,
                EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
                REGISTER_FILTER_BAG_ID,
                BAG_BACKPACK
        )
    end,
    update = function(eventCode, bagId, slotId, isNewItem, itemSoundCategory, inventoryUpdateReason, stackCountChange)
        d('bagId: ' .. bagId)
        d('slotId: ' .. slotId)
    end
}

EVENT_MANAGER:RegisterForEvent(PermanentJunk.namespace, EVENT_ADD_ON_LOADED, PermanentJunk.onAddOnLoaded)
