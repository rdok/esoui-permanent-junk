describe("EventDispatcher", function()

    local itemId = 'itemIdLoreIpsum'
    local expectedLink = 'linkValue'
    local expectedBagId = BAG_BACKPACK
    local expectedSlotId = 'slotIdValue'

    before_each(function()
        stub(_G, 'GetItemLink').invokes(function(bagId, slotId)
            if (expectedBagId == bagId and expectedSlotId == slotId) then
                return expectedLink
            end
            error('Unexpected arguments passed.')
        end)

        stub(_G, 'ZO_LinkHandler_ParseLink').invokes(function(link)
            if (expectedLink == link) then return 1, 2, 4, itemId end
            error('Unexpected arguments passed.')
        end)
    end)

    it("should dispatch event for new item", function()
        stub(_G, 'ItemCreatedEvent')

        EventDispatcher(_, BAG_BACKPACK, 'slotIdValue', true)

        assert.stub(_G.ItemCreatedEvent)
              .was_called_with(BAG_BACKPACK, 'slotIdValue', itemId)
    end)

    it("should dispatch event for updated item", function()
        stub(_G, 'ItemUpdatedEvent')

        EventDispatcher(_, BAG_BACKPACK, expectedSlotId, false)

        assert.stub(_G.ItemUpdatedEvent)
              .was_called_with(BAG_BACKPACK, expectedSlotId, itemId, expectedLink)
    end)

    it("should not process virtual bag", function()
        stub(_G, 'ItemCreatedEvent')
        stub(_G, 'ItemUpdatedEvent')

        EventDispatcher(_, BAG_VIRTUAL)

        assert.stub(_G.ItemCreatedEvent).was_not_called()
        assert.stub(_G.ItemUpdatedEvent).was_not_called()
    end)
end)
