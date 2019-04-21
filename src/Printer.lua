Printer = {}

Printer.print = function(prefix, bagId, slotId, itemId)
    local item = PermanentJunk.data[itemId] or {}
    local formatstring = '%s Item. \n bagId: %s, slotId: %s, id: %s, name: %s, createAt: %s'

    local message = string.format(
            formatstring,
            prefix,
            tostring(bagId),
            tostring(slotId),
            tostring(itemId),
            tostring(item.name),
            tostring(item.createdAt)
    )

    d(message)
end
