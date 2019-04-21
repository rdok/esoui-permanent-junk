ItemUpdatedEvent = function(
        eventCode,
        bagId,
        slotId,
        isNewItem,
        itemSoundCategory,
        inventoryUpdateReason,
        stackCountChange
)
    local itemLink = GetItemLink(bagId, slotId)
    local text, color, type, itemId = ZO_LinkHandler_ParseLink(itemLink)

    if IsItemJunk(bagId, slotId) then
        PermanentJunk.database[itemId] = {
            ["name"] = GetItemName(bagId, slotId),
            ["createdAt"] = os.date('%c')
        }
    elseif nil ~= itemId then
        PermanentJunk.database[itemId] = nil
    end
end
