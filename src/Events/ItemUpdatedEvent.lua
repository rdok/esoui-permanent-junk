ItemUpdatedEvent = {}

local itemRemovedUnexpectedly = function(itemId)
    return nil == itemId
end

ItemUpdatedEvent = function(bagId, slotId, itemId)
    if itemRemovedUnexpectedly(itemId) then do return end end

    if not IsItemJunk(bagId, slotId) then
        return Database.removeById(itemId)
    end

    Database.insertById(itemId, {
        ["name"] = GetItemName(bagId, slotId),
        ["createdAt"] = os.date('%c')
    })

end