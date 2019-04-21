describe("Database", function()

    local expectedItem = { '--lorem-ipsum--' }
    local expectedId = 'idValue'

    before_each(function()
        Database.new()
    end)

    it("should be able to get an item by it's id", function()
        Database.data[expectedId] = expectedItem

        assert.is_same(expectedItem, Database.getById(expectedId))
    end)

    it("should be able to remove an item", function()
        Database.data[expectedId] = expectedItem
        assert.is_not_nil(Database.data[expectedId])

        Database.removeItemById(expectedId)

        assert.is_nil(Database.data[expectedId])
    end)

    it("should be able to store a new item", function()
        assert.is_nil(Database.data[expectedId])

        Database.insertById(expectedId, expectedItem)

        assert.is_same(expectedItem, Database.data[expectedId])
    end)

    it("should be able to answer if any item exists given an ide", function()
        assert.is_false(Database.hasId(expectedId))

        Database.data[expectedId] = expectedItem

        assert.is_true(Database.hasId(expectedId))
    end)
end)
