EventDispatcher = function(eventCode, bagId, slotId, isNewItem, ...)

    if isNewItem then
        return ItemCreatedEvent(eventCode, bagId, slotId, isNewItem, ...)
    end

    return ItemUpdatedEvent(eventCode, bagId, slotId, isNewItem, ...)
end
