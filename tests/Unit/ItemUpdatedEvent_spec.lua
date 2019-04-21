describe("ItemUpdatedEvent", function()

    it("should save an item of junk type to the database", function()
        stub(_G, 'IsItemJunk').returns(true)
        stub(_G, 'GetItemName').returns('ItemName')
        stub(os, 'date').invokes(function(argument)
            if ('%c' == argument) then return 'CreatedAtValue' end
            return nil
        end)

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', 'ItemIdValue')

        assert.is_same({
            ["name"] = 'ItemName',
            ["createdAt"] = 'CreatedAtValue'
        }, PermanentJunk.database['ItemIdValue'])
    end)

    it("should remove an non-junk item from the database.", function()
        stub(_G, 'IsItemJunk').returns(false)
        local itemId = 'ItemValueId'

        PermanentJunk.database['ItemValueId'] = { '--lorem-ipsum--' }
        assert.is_not_nil(PermanentJunk.database[itemId])

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', itemId)
        assert.is_nil(PermanentJunk.database[itemId])
    end)

    it("should not attempt to remove an unknown item from the database", function()
        stub(_G, 'IsItemJunk').returns(false)

        ItemUpdatedEvent('BagIdValue', 'SlotIdValue', nil)

        assert.is_true(true) -- no error thrown
    end)
end)
