describe("ItemCreatedEvent", function()

    it('should junk new items given they are stored as such in the database', function()
        stub(_G, "SetItemIsJunk")
        _G.GetItemLink = function() return end
        _G.ZO_LinkHandler_ParseLink = function() return _, _, _, 'itemIdValue' end

        PermanentJunk.database['itemIdValue'] = { '--lorem-ipsum--' }

        ItemCreatedEvent(_, 'bagIdValue', 'slotIdValue')

        assert.stub(_G.SetItemIsJunk)
              .was_called_with('bagIdValue', 'slotIdValue', true)
    end)

end)
