describe("PermanentJunk", function()
    local namespace = 'PermanentJunk'

    it("should be auto-initialized", function()
        assert.is_type_of('table', PermanentJunk)
    end)
    --
    --it("should create a new wide account for the database when calling onAddOnLoaded", function()
    --    stub(ZO_SavedVars, "NewAccountWide")
    --
    --    PermanentJunk:onAddOnLoaded()
    --
    --    assert.stub(ZO_SavedVars.NewAccountWide)
    --          .was_called_with(ZO_SavedVars, "PermanentJunkDatabase", 1, 'PermanentJunkSave', {})
    --end)
    --
    --it("should automatically listen to the add_on_loaded event. ", function()
    --    expected = {
    --        namespace = namespace,
    --        event = EVENT_ADD_ON_LOADED,
    --        callback = PermanentJunk.onAddOnLoaded
    --    };
    --
    --    assert.is_same(expected, EVENT_MANAGER:getEvents()[1])
    --end)
    --
    --it("should register for item updated event when when calling onAddOnLoaded", function()
    --    stub(EVENT_MANAGER, "RegisterForEvent")
    --
    --    PermanentJunk:onAddOnLoaded()
    --
    --    assert.stub(EVENT_MANAGER.RegisterForEvent)
    --          .was_called_with(
    --            EVENT_MANAGER,
    --            namespace,
    --            EVENT_INVENTORY_SINGLE_SLOT_UPDATE,
    --            EventDispatcher
    --    )
    --end)

end)
