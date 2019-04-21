ItemUpdatedEvent = {}

local itemRemovedUnexpectedly = function(itemId)
    return nil == itemId
end

ItemUpdatedEvent = function(bagId, slotId, itemId, itemLink)

    if itemRemovedUnexpectedly(itemId) then do return end end

    if IsItemJunk(bagId, slotId) then
        return Database.insertById(itemId, {
            ["name"] = GetItemName(bagId, slotId),
            ["createdAt"] = os.date('%c'),
            ["link"] = itemLink
        })
    end

    if (Database.hasId(itemId)) then
        return Database.removeItemById(itemId)
    end
end