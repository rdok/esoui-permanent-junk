Database = {
    data = {}
}

Database.new = function()
    Database.data = {}
end

Database.insertById = function(id, item)
    Database.data[id] = item
end

Database.removeItemById = function(id)
    Database.data[id] = nil
end

Database.getById = function(id)
    if (not Database.data[id]) then
        error('Not item exists with id: ' .. tostring(id))
    end

    return Database.data[id]
end

Database.hasId = function(id)
    return nil ~= Database.data[id]
end
