describe("ItemCreatedEvent", function()

    local item = { link = 'itemLinkValue' }
    local id = 'itemIdValue'

    it('should junk new items given they are stored as such in the database', function()
        stub(_G, "SetItemIsJunk")

        Database.insertById(id, item)

        ItemCreatedEvent('bagIdValue', 'slotIdValue', id)

        assert.stub(_G.SetItemIsJunk)
              .was_called_with('bagIdValue', 'slotIdValue', true)
    end)

    it('should not junk new items given they are NOT stored in the database', function()
        stub(_G, "SetItemIsJunk")
        Database.removeItemById(id)

        ItemCreatedEvent('bagIdValue', 'slotIdValue', 'itemIdValue')

        assert.stub(_G.SetItemIsJunk).was_not_called()
    end)

    it('should notify the chat when junking a new item', function()
        stub(_G, "d")
        Database.insertById(id, item)
        ItemCreatedEvent('bagIdValue', 'slotIdValue', id)

        local expected = string.format('[PermanentJunk]: Junked item: %s', item.link)

        assert.stub(_G.d).was_called_with(expected)
    end)
end)
