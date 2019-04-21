EventDispatcher = function(_, bagId, slotId, isNewItem)

    pj_print('EventDispatcher: bagId: ' .. bagId)

    if (bagId ~= BAG_BACKPACK) then return end

    local itemLink = GetItemLink(bagId, slotId)
    local _, _, _, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if isNewItem then
        return ItemCreatedEvent(bagId, slotId, itemId)
    end

    return ItemUpdatedEvent(bagId, slotId, itemId)
end
