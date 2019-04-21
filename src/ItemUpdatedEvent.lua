ItemUpdatedEvent = {}

local itemWasRemoved = function(itemId)
    return nil == itemId
end

ItemUpdatedEvent = function(bagId, slotId, itemId)
    if itemWasRemoved(itemId) then
        do return end
    end

    if false == IsItemJunk(bagId, slotId) then
        PermanentJunk.database[itemId] = nil

        do return end
    end

    local name = GetItemName(bagId, slotId)
    local createdAt = os.date('%c')

    PermanentJunk.database[itemId] = {
        ["name"] = name,
        ["createdAt"] = createdAt
    }
end
