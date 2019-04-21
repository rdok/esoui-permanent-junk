describe("EventDispatcher", function()

    local itemId = 'itemIdLoreIpsum'

    before_each(function()
        _G.ZO_LinkHandler_ParseLink = function() return _, _, _, itemId end
        _G.GetItemLink = function() return nil end
    end)

    it("should dispatch event for new item", function()
        stub(_G, 'ItemCreatedEvent')

        EventDispatcher(_, 'bagIdValue', 'slotIdValue', true)

        assert.stub(_G.ItemCreatedEvent)
              .was_called_with('bagIdValue', 'slotIdValue', itemId)
    end)

    it("should dispatch event for updated item", function()
        stub(_G, 'ItemUpdatedEvent')

        EventDispatcher(_, 'bagIdValue', 'slotIdValue', false)

        assert.stub(_G.ItemUpdatedEvent)
              .was_called_with('bagIdValue', 'slotIdValue', itemId)
    end)

end)
