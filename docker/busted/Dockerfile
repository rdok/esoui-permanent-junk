FROM luarocks:5.1

# Sync lua files with host for IDE usage.
RUN apk add rsync

RUN luarocks install busted
RUN luarocks install inspect

ENV LUA_PATH "/app/tests/_support/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/_support/Mocks/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/_support/Assertions/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/Unit/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/Unit/Events/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/Acceptance/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/tests/?.lua;$LUA_PATH"
ENV LUA_PATH "/app/src/Events/?.lua;$LUA_PATH"

ENTRYPOINT ["/app/docker/busted/entry-point.sh"]
