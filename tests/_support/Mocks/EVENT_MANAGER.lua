EVENT_MANAGER = {}
local registeredEvents = {}

function EVENT_MANAGER:RegisterForEvent(namespace, event, callback)
    -- this the only method that we need to manually call.
    -- Thus 'mocking' esoui calling it.
    -- All other functions should be spied/stubbed.
    event = {
        namespace = namespace,
        event = event,
        callback = callback
    };

    table.insert(registeredEvents, event)
end

function EVENT_MANAGER:getEvents()
    return registeredEvents
end

function EVENT_MANAGER:RegisterForUpdate(id, milliseconds, callback)
end

function EVENT_MANAGER:UnregisterForUpdate(id)
end

function EVENT_MANAGER:AddFilterForEvent(id)
end
