ItemCreatedEvent = function(bagId, slotId, itemId)

    if nil == PermanentJunk.database[itemId] then
        do return end
    end

    local item = PermanentJunk.database[itemId]
    local formatstring = 'Marking new item as junk. \n bagId: %s, slotId: %s, db: %s'
    local message = string.format(formatstring, tostring(bagId), tostring(slotId), tostring(item))
    d(message)

    SetItemIsJunk(bagId, slotId, true)
end
