ItemCreatedEvent = function(bagId, slotId, itemId)

    if not Database.hasId(itemId) then
        do return end
    end

    SetItemIsJunk(bagId, slotId, true)
end
