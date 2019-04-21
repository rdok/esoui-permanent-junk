describe("EventDispatcher", function()

    local itemId = 'itemIdLoreIpsum'

    before_each(function()
        _G.ZO_LinkHandler_ParseLink = function() return _, _, _, itemId end
        _G.GetItemLink = function() return nil end
    end)

    it("should dispatch event for new item", function()
        stub(_G, 'ItemCreatedEvent')

        EventDispatcher(_, BAG_BACKPACK, 'slotIdValue', true)

        assert.stub(_G.ItemCreatedEvent)
              .was_called_with(BAG_BACKPACK, 'slotIdValue', itemId)
    end)

    it("should dispatch event for updated item", function()
        stub(_G, 'ItemUpdatedEvent')

        EventDispatcher(_, BAG_BACKPACK, 'slotIdValue', false)

        assert.stub(_G.ItemUpdatedEvent)
              .was_called_with(BAG_BACKPACK, 'slotIdValue', itemId)
    end)

    it("should not process virtual bag", function()
        stub(_G, 'ItemCreatedEvent')
        stub(_G, 'ItemUpdatedEvent')

        EventDispatcher(_, BAG_VIRTUAL)

        assert.stub(_G.ItemCreatedEvent).was_not_called()
        assert.stub(_G.ItemUpdatedEvent).was_not_called()
    end)
end)
