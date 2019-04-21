describe("ItemCreatedEvent", function()

    it('should junk new items given they are stored as such in the database', function()
        stub(_G, "SetItemIsJunk")

        Database.insertById('itemIdValue', { '--lorem-ipsum--' })

        ItemCreatedEvent('bagIdValue', 'slotIdValue', 'itemIdValue')

        assert.stub(_G.SetItemIsJunk)
              .was_called_with('bagIdValue', 'slotIdValue', true)
    end)

    it('should not junk new items given they are NOT stored in the database', function()
        stub(_G, "SetItemIsJunk")
        Database.removeItemById('itemIdValue')

        ItemCreatedEvent('bagIdValue', 'slotIdValue', 'itemIdValue')

        assert.stub(_G.SetItemIsJunk).was_not_called()
    end)

end)
