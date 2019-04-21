ItemCreatedEvent = function(bagId, slotId, itemId)

    if not Database.hasId(itemId) then
        do return end
    end

    local item = Database.getById(itemId)

    d(string.format('[PermanentJunk]: Junked item: %s', item.link))

    SetItemIsJunk(bagId, slotId, true)
end
