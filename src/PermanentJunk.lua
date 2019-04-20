PermanentJunk = {
    variableVersion = 1,
    namespace = 'PermanentJunk',
    databaseId = "PermanentJunkDatabase",
    database = {}
}

PermanentJunk.savedVariables = ZO_SavedVars:NewAccountWide(
        PermanentJunk.databaseId,
        PermanentJunk.variableVersion,
        PermanentJunk.namespace,
        PermanentJunk.database
)

--PermanentJunk.update(
--        eventCode,
--        result,
--        isError,
--        abilityName,
--        abilityGraphic,
--        abilityActionSlotType,
--        sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log
--)

-- https://wiki.esoui.com/Events#Inventory_and_Currencies
--callback = function(eventCode, bagId, slotId, isNewItem, itemSoundCategory, inventoryUpdateReason, stackCountChange)
--end
--EVENT_MANAGER:RegisterForEvent('PermanentJunk.eventname', EVENT_INVENTORY_SINGLE_SLOT_UPDATE, callback)

-- https://wiki.esoui.com/AddFilterForEvent
--EVENT_MANAGER:AddFilterForEvent('PermanentJunk.eventname', EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_BACKPACK)
--EVENT_MANAGER:AddFilterForEvent(null, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_WORN)


