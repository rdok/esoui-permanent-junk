describe("ItemUpdatedEvent", function()

    it("should save an item of junk type to the database", function()
        stub(_G, 'IsItemJunk').returns(true)
        stub(_G, 'GetItemName').returns('ItemName')
        stub(Database, 'insertById')

        -- https://github.com/Olivine-Labs/luassert/pull/84#issuecomment-98021906
        stub(os, 'date').invokes(function(argument)
            if ('%c' == argument) then return 'CreatedAtValue' end
            return nil
        end)

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', 'ItemIdValue')

        assert.stub(Database.insertById).was_called_with('ItemIdValue', {
            ["name"] = 'ItemName',
            ["createdAt"] = 'CreatedAtValue'
        })
    end)

    it("should remove an non-junk item from the database.", function()
        stub(_G, 'IsItemJunk').returns(false)
        stub(Database, 'removeItemById')

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', 'ItemIdValue')

        assert.stub(Database.removeItemById).was_not_called()
    end)

    it("should not attempt to remove a removed item from the database", function()
        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', nil)

        assert.is_true(true) -- no error thrown
    end)

    it("should not attempt to remove a non-existent item from the database", function()
        stub(_G, 'IsItemJunk').returns(false)
        stub(Database, 'removeItemById')

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', 'ItemValueId')

        assert.stub(Database.removeItemById).was_not_called()
    end)

    it("should not insert an item if it's not junk and it does not exists in the database", function()
        stub(_G, 'IsItemJunk').returns(false)
        stub(Database, 'insertById')

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', nil)

        assert.stub(Database.insertById).was_not_called()
    end)
end)
