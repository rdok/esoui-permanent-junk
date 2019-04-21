Database = {
    data = {}
}

Database.new = function()
    Database.data = {}
end

Database.insertById = function(id, item)
    Database.data[id] = item

    Printer.print('Created.', bagId, slotId, itemId)

    return Database.data[id]
end

Database.removeById = function(id)
    Printer.print('Deleting.', bagId, slotId, itemId)

    Database.data[id] = nil
end

Database.getById = function(id)
    if (nil == Database.data[id]) then
        return nil
    end

    return Database.data[id]
end
