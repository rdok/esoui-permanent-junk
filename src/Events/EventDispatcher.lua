local filteredBagIds = {}
filteredBagIds[5] = 'clothing station'

EventDispatcher = function(_, bagId, slotId, isNewItem)

    if (nil ~= filteredBagIds[bagId]) then return end

    local itemLink = GetItemLink(bagId, slotId)
    local _, _, _, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if isNewItem then
        return ItemCreatedEvent(bagId, slotId, itemId)
    end

    return ItemUpdatedEvent(bagId, slotId, itemId)
end
