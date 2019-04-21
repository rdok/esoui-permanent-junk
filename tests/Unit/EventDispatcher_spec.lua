describe("EventDispatcher", function()

    it("should dispatch event for new item", function()
        stub(_G, 'ItemCreatedEvent')
        EventDispatcher('eventcode', '2', '3', true, '5')
        assert.stub(_G.ItemCreatedEvent).was_called_with('eventcode', '2', '3', true, '5')
    end)

    it("should dispatch event for updated item", function()
        stub(_G, 'ItemUpdatedEvent')
        EventDispatcher('eventcode', '2', '3', false, '5')
        assert.stub(_G.ItemUpdatedEvent).was_called_with('eventcode', '2', '3', false, '5')
    end)

end)
