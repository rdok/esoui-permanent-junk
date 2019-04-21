## About Permanent Junk

> This addon does one, and only one thing: mark items as junk, **permanently**.

[![Build Status](https://travis-ci.org/rdok/esoui-permanent-junk.svg?branch=master)](https://travis-ci.org/rdok/esoui-permanent-junk)

I found it quite annoying once I sold items as junk marked, these items when re-acquired being unmarked as junk.


#### Features
- Mark as junk new items that have been marked in the past as such.
- Changes are saved for the account.
- Persisting when  on logout/esoui reload.
- Lightweight. Hooks on [Event filtering.](https://wiki.esoui.com/AddFilterForEvent)
- Minimalistic. No messages, or any other hidden changes.
- Fully TDD with CI, ensuring stability, maintainability, and very easy to patch any missed bugs.

There are a lot of addons that already do that, I think, but they add a lot of additional features. The automation they provide is amazing, but I consider these breaking my gameplay immersion.

 
- [Remember Junk](https://www.esoui.com/downloads/info470-RememberJunk.html) This is the closest fitting my needs. However it adds add features through commands such as clearing/list junked items.
- [Zolan's Junk Handler](https://www.esoui.com/downloads/info285-ZolansJunkHandler.html)
- [Deconstruction Junk Marker](https://www.esoui.com/downloads/info1388-DeconstructionJunkMarker.html)
- [Dustman](https://www.esoui.com/downloads/info97-Dustman.html)
- [JunkBuster](https://www.esoui.com/downloads/info266-JunkBuster.html)
- [Circonians JunkIt Loot Manager](https://www.esoui.com/downloads/info661-CirconiansJunkItLootManager.html)


## Development
This project is based on [ESOUI Framework](https://github.com/rdok/esoui-framework)

Link code to game: `mklink /d "C:\Users\rdok\Documents\Elder Scrolls Online\live\AddOns\PermanentJunk" "D:\Code\PermanentJunk"`
