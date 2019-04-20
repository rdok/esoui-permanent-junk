describe("PermanentJunk", function()

    it("should be auto-initialized", function()
        assert.is_type_of('table', PermanentJunk)
    end)

    it("should be contain the correct version of the app", function()
        assert.is_same(1, PermanentJunk.variableVersion)
    end)

    it("should auto-initialize account the account wide saved variables ", function()
        expected = {
            savedVariableTable = "PermanentJunkDatabase",
            version = 1,
            namespace = 'PermanentJunk',
            defaults = {}
        }

        assert.is_same(expected, ZO_SavedVars:getAccount(1))
    end)

end)
