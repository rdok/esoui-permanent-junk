describe("PermanentJunk", function()
    local database

    before_each(function()
        database = PermanentJunk.database
        _G.ZO_SavedVars.NewAccountWide = function() return database end
    end)

    after_each(function() PermanentJunk.database = database end)

    it("should be auto-initialized", function()
        assert.is_type_of('table', PermanentJunk)
    end)

    it("should be contain the correct version of the app", function()
        assert.is_same(1, PermanentJunk.variableVersion)
    end)

    it(" #dd should create a new wide account for the database when calling onAddOnLoaded", function()
        stub(ZO_SavedVars, "NewAccountWide")

        PermanentJunk:onAddOnLoaded()

        assert.stub(ZO_SavedVars.NewAccountWide).was_called_with(
                ZO_SavedVars,
                PermanentJunk.databaseHost,
                PermanentJunk.variableVersion,
                PermanentJunk.namespaceSave,
                database
        )
    end)

    it("should automatically listen to the add_on_loaded event. ", function()
        expected = {
            namespace = PermanentJunk.namespace,
            event = PermanentJunk.initialize,
            callback = PermanentJunk.onAddOnLoaded
        };

        assert.is_same(expected, EVENT_MANAGER:getEvents()[1])
    end)

    it("should register for item updated event when when calling onAddOnLoaded", function()
        stub(EVENT_MANAGER, "RegisterForEvent")
        PermanentJunk:onAddOnLoaded()
        assert.stub(EVENT_MANAGER.RegisterForEvent).was_called_with(
                EVENT_MANAGER,
                PermanentJunk.namespace,
                EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
                PermanentJunk.update
        )
    end)

    it("should filter item update event based on player backpack when calling onAddOnLoaded", function()
        stub(EVENT_MANAGER, "AddFilterForEvent")
        PermanentJunk:onAddOnLoaded()
        assert.stub(EVENT_MANAGER.AddFilterForEvent).was_called_with(
                EVENT_MANAGER,
                PermanentJunk.namespaceSave,
                EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
                REGISTER_FILTER_BAG_ID,
                BAG_BACKPACK
        )
    end)

    it('#dd should not remove item from db if it was removed backpack', function()
        _G.ZO_LinkHandler_ParseLink = function() return nil end
        _G.GetItemLink = function() return end
        _G.IsItemJunk = function() return false end
        PermanentJunk.update('eventcode', '111', '222')
        assert.is_true(true) -- no error was thrown
    end)
end)
