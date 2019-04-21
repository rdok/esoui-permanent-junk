ItemCreatedEvent = function(bagId, slotId, itemId)

    if not Database.hasId(itemId) then
        do return end
    end

    pj_print('Junking new item: ' .. Inspect.inspect(Database.getById(itemId)))

    SetItemIsJunk(bagId, slotId, true)
end
