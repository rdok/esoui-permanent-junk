ItemCreatedEvent = function(eventCode, bagId, slotId)

    local itemLink = GetItemLink(bagId, slotId)
    local text, color, type, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if PermanentJunk.database[itemId] then
        SetItemIsJunk(bagId, slotId, true)
    end
end
