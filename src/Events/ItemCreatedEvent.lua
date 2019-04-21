ItemCreatedEvent = function(bagId, slotId, itemId)

    if not Database.existsById(itemId) then
        do return end
    end

    PermanentJunk.dItem('Setting as junk', bagId, slotId, itemId)

    SetItemIsJunk(bagId, slotId, true)
end
