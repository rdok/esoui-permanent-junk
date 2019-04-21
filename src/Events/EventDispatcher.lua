local testedBagId = {}
testedBagId[BAG_VIRTUAL] = true
testedBagId[BAG_BACKPACK] = true
testedBagId[BAG_WORN] = true
testedBagId[BAG_WORN] = true
testedBagId[BAG_BANK] = true

EventDispatcher = function(_, bagId, slotId, isNewItem)

    if (bagId ~= BAG_BACKPACK) then return end

    local itemLink = GetItemLink(bagId, slotId)
    local _, _, _, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if isNewItem then
        return ItemCreatedEvent(bagId, slotId, itemId)
    end

    return ItemUpdatedEvent(bagId, slotId, itemId, itemLink)
end
