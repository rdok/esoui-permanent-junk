describe("ItemUpdatedEvent", function()

    it("should save a junk item to the database", function()
        _G.GetItemLink = function() return 'ItemLink' end
        _G.IsItemJunk = function() return true end
        _G.ZO_LinkHandler_ParseLink = function() return 1, 2, 3, 'ItemId' end
        _G.GetItemName = function() return 'ItemName' end
        _G.GetTimeStamp = function() return 'TimeStamp' end
        PermanentJunk.update('eventcode', 2, 5)
        assert.is_same({
            ["name"] = 'ItemName',
            ["link"] = 'ItemLink',
            ["timestamp"] = 'TimeStamp'
        }, PermanentJunk.database['ItemId'])
    end)

end)
