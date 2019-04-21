ItemCreatedEvent = function(bagId, slotId, itemId)

    if PermanentJunk.database[itemId] then
        SetItemIsJunk(bagId, slotId, true)
    end
end
