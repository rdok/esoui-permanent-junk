describe("PermanentJunk", function()

    it("should be auto-initialized", function()
        assert.is_type_of('table', PermanentJunk)
    end)

    it("should be contain the correct version of the app", function()
        assert.is_same(1, PermanentJunk.variableVersion)
    end)

    it("should create a new wide account for the database when calling onAddOnLoaded", function()
        stub(ZO_SavedVars, "NewAccountWide")

        PermanentJunk:onAddOnLoaded()

        assert.stub(ZO_SavedVars.NewAccountWide).was_called_with(
                ZO_SavedVars,
                PermanentJunk.databaseId,
                PermanentJunk.variableVersion,
                PermanentJunk.namespace,
                {}
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
                PermanentJunk.namespace,
                EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
                REGISTER_FILTER_BAG_ID,
                BAG_BACKPACK
        )
    end)
end)
