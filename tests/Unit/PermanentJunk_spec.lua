describe("PermanentJunk", function()

    it("should be auto-initialized", function()
        assert.is_type_of('table', PermanentJunk)
    end)

    it("should be contain the correct version of the app", function()
        assert.is_same(1, PermanentJunk.variableVersion)
    end)

    it("should auto-initialize the table of junk items", function()
        local items = PermanentJunk.items

        assert.is_type_of('table', items)
    end)

    it("should auto-initialize account the account wide saved variables ", function()
        local actual = ZO_SavedVars:getAccount(1)

        expected = {
            ['savedVariableTable'] = "PermanentJunkVariables",
            ['version'] = PermanentJunk.variableVersion,
            ['namespace'] = nil,
            ['defaults'] = PermanentJunk.items
        }

        assert.is_same(expected, actual)
    end)

end)
