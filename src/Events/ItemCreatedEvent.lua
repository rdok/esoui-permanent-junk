ItemCreatedEvent = function(bagId, slotId, itemId)

    pj_print('ItemCreatedEvent. bagId: ' .. bagId, {})

    if not Database.hasId(itemId) then
        do return end
    end

    pj_print('Junking new item: ', Database.getById(itemId))

    SetItemIsJunk(bagId, slotId, true)
end
