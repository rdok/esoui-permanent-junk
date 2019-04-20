describe("PermanentJunk", function()

    it("should be auto-initialized", function()
        assert.is_same({}, PermanentJunk)
    end)

    it("should auto-initialize the table of junk items", function()
        local items = PermanentJunk.items
        assert.is_equals({}, items)
    end)

end)
