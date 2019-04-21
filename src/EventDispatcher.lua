EventDispatcher = function(_, bagId, slotId, isNewItem)
    -- https://wiki.esoui.com/AddFilterForEvent

    local itemLink = GetItemLink(bagId, slotId)
    local _, _, _, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if isNewItem then
        return ItemCreatedEvent(bagId, slotId, itemId)
    end

    return ItemUpdatedEvent(bagId, slotId, itemId)
end
