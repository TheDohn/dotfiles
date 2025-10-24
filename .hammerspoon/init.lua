
-- this all looks neat, but I think Emacs does most of what I need
-- if the mission control and spaces stuff was more fleshed out, I could imagine that being useful
-- I also am just trying this on my laptop, I need to connect to external monitors to see how it would work in those cases

-- -- Hello World example
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--     hs.alert.show("Hello World!")
-- end)


-- spaces trial
-- one thing I didn't like is that the space numbers were a little weird, and didn't line up with the #s I saw in Mission Control
-- which implies that these could get screwy over the long term (get out of alignment)
-- ideally someone will just write the code I need at some point and I can just use it
------#####******----#####******----#####******----#####******----#####******----#####******
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "s", function()
-- --     hs.spaces.allSpaces()
--     --hs.alert.show(hs.spaces.allSpaces())
--     hs.alert.show(hs.spaces.missionControlSpaceNames())
-- end)



-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "f", function()
-- --     hs.spaces.allSpaces()
--     hs.alert.show(hs.spaces.focusedSpace())
-- end)


-- Window switcher -----#####******----#####******----#####******----#####******---#####******
--http://www.hammerspoon.org/docs/hs.window.switcher.html
-- set up your windowfilter
-- switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
-- switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)

-- bind to hotkeys; WARNING: at least one modifier key is required!
-- hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
-- hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)

-- alternatively, call .nextWindow() or .previousWindow() directly (same as hs.window.switcher.new():next())
--hs.hotkey.bind('alt','tab','Next window',hs.window.switcher.nextWindow)
-- you can also bind to `repeatFn` for faster traversing
--hs.hotkey.bind('alt-shift','tab','Prev window',hs.window.switcher.previousWindow,nil,hs.window.switcher.previousWindow)

-- ------#####******----#####******----#####******----#####******----#####******----#####******
-- -- expose
-- -- https://www.hammerspoon.org/docs/hs.expose.html
-- -- set up your instance(s)
-- expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
-- expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
-- -- expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
-- -- actually try setting this to true
-- expose_space = hs.expose.new(nil,{includeOtherSpaces=true}) -- only windows in the current Mission Control Space
-- expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- -- for your dozens of browser windows :)

-- -- then bind to a hotkey
-- hs.hotkey.bind('ctrl-cmd','e','Expose',function()expose:toggleShow()end)
-- hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)



-- GPT v1----------------------------------------------------------------------------------
-- local spaces = require("hs.spaces")
-- local screen = require("hs.screen")
-- local hotkey = require("hs.hotkey")
-- local chooser = require("hs.chooser")

-- -- Function to build a structured list of all spaces
-- local function buildSpaceList()
--     local screens = screen.allScreens()
--     local currentSpaceID = spaces.focusedSpace()
--     local spaceList = {}

--     for sIndex, scr in ipairs(screens) do
--         local spaceIDs = spaces.spacesForScreen(scr)
--         for spIndex, spID in ipairs(spaceIDs) do
--             local text = string.format("Display %d → Space %d", sIndex, spIndex)
--             if spID == currentSpaceID then
--                 text = "▶ " .. text  -- highlight current space
--             end
--             table.insert(spaceList, {
--                 text = text,
--                 spaceID = spID
--             })
--         end
--     end

--     return spaceList
-- end

-- -- Create the chooser
-- local spaceChooser = chooser.new(function(choice)
--     if choice then
--         spaces.gotoSpace(choice.spaceID)
--     end
-- end)

-- spaceChooser:rows(10)  -- number of visible rows

-- -- Bind a single hotkey to show the chooser
-- hotkey.bind({"alt"}, "space", function()
--     spaceChooser:choices(buildSpaceList())
--     spaceChooser:show()
-- end)

-- hs.alert.show("Enhanced Space chooser loaded")
-- GPT v1----------------------------------------------------------------------------------


-- GPT v2----------------------------------------------------------------------------------
-- =========================================
-- Hammerspoon Multi-Monitor Space Switcher
-- =========================================
-- Features:
-- 1. Single hotkey (⌥ + Space) opens a chooser of all spaces on all monitors
-- 2. Spaces are grouped by monitor and labeled "Display X → Space Y"
-- 3. Current active space is highlighted
-- 4. Navigate with arrow keys and press Enter to jump
-- 5. Automatically handles any number of monitors and spaces

-- Required modules
-- local spaces = require("hs.spaces")
-- local screen = require("hs.screen")
-- local hotkey = require("hs.hotkey")
-- local chooser = require("hs.chooser")

-- -- Function: Build list of all spaces on all monitors
-- local function buildSpaceList()
--     local screens = screen.allScreens()
--     local currentSpaceID = spaces.focusedSpace()
--     local spaceList = {}

--     for sIndex, scr in ipairs(screens) do
--         local spaceIDs = spaces.spacesForScreen(scr)
--         for spIndex, spID in ipairs(spaceIDs) do
--             local text = string.format("Display %d → Space %d", sIndex, spIndex)
--             if spID == currentSpaceID then
--                 text = "▶ " .. text  -- highlight current space
--             end
--             table.insert(spaceList, {
--                 text = text,
--                 spaceID = spID
--             })
--         end
--     end

--     return spaceList
-- end

-- -- Create chooser
-- local spaceChooser = chooser.new(function(choice)
--     if choice then
--         spaces.gotoSpace(choice.spaceID)
--     end
-- end)

-- spaceChooser:rows(10)  -- number of visible rows in the chooser

-- -- Hotkey to open chooser
-- hotkey.bind({"alt"}, "space", function()
--     spaceChooser:choices(buildSpaceList())
--     spaceChooser:show()
-- end)

-- -- Optional: show an alert when config loads
-- hs.alert.show("Multi-Monitor Space Switcher Loaded")
-- GPT v2----------------------------------------------------------------------------------


-- GPT v3----------------------------------------------------------------------------------
-- =========================================
-- Hammerspoon Multi-Monitor Space Switcher
-- =========================================
-- Features:
-- 1. Single hotkey (⌥ + Space) opens a chooser of all spaces on all monitors
-- 2. Custom friendly labels stored in Lua (no Yabai required)
-- 3. Highlights the current active space
-- 4. Navigate with arrow keys and press Enter to jump
-- 5. Works dynamically with any number of monitors

-- local spaces = require("hs.spaces")
-- local screen = require("hs.screen")
-- local hotkey = require("hs.hotkey")
-- local chooser = require("hs.chooser")

-- -- =========================================
-- -- Friendly labels for your spaces
-- -- Map by screen index and space index
-- -- Example: labels[display][space] = "Name"
-- -- Adjust these names as you like
-- -- =========================================
-- local labels = {
--     [1] = { "Slack/Email", "Spotify"},                             -- Display 1
--     [2] = {"Emacs"},                                               -- Display 2
--     [3] = { "personal", "Jira", "AWS", "VW", "project other", ""}  -- Display 3
-- }

-- -- Build a list of all spaces for the chooser
-- local function buildSpaceList()
--     local screens = screen.allScreens()
--     local currentSpaceID = spaces.focusedSpace()
--     local spaceList = {}

--     for sIndex, scr in ipairs(screens) do
--         local spaceIDs = spaces.spacesForScreen(scr)
--         for spIndex, spID in ipairs(spaceIDs) do
--             local label = "Space " .. spIndex
--             if labels[sIndex] and labels[sIndex][spIndex] then
--                 label = labels[sIndex][spIndex]
--             end
--             local text = string.format("Display %d → %s", sIndex, label)
--             if spID == currentSpaceID then
--                 text = "▶ " .. text  -- highlight current space
--             end
--             table.insert(spaceList, {
--                 text = text,
--                 spaceID = spID
--             })
--         end
--     end

--     return spaceList
-- end

-- -- Create the chooser
-- local spaceChooser = chooser.new(function(choice)
--     if choice then
--         spaces.gotoSpace(choice.spaceID)
--     end
-- end)

-- spaceChooser:rows(10)  -- number of visible rows

-- -- Hotkey to show chooser
-- hotkey.bind({"alt"}, "space", function()
--     spaceChooser:choices(buildSpaceList())
--     spaceChooser:show()
-- end)

-- -- Optional: alert when config loads
-- hs.alert.show("Multi-Monitor Labeled Space Switcher Loaded")


-- DOES NOT WORK
-- -- GPT v4----------------------------------------------------------------------------------
-- -- =========================================
-- -- Hammerspoon Multi-Monitor Space Switcher (Sticky Note Labels)
-- -- =========================================
-- -- Features:
-- -- 1. Single hotkey (⌥ + Space) opens a chooser of all spaces on all monitors
-- -- 2. Reads space labels from tiny sticky-note windows
-- --    - Windows must have title starting with "SpaceLabel:"
-- --    - Example: "SpaceLabel: Work"
-- -- 3. Fallback: "Space X" if no sticky note found
-- -- 4. Highlights current active space
-- -- 5. Navigate with arrow keys, Enter jumps to selected space
-- -- 6. Fully Hammerspoon-native (no Yabai or SIP changes)

-- local spaces = require("hs.spaces")
-- local screen = require("hs.screen")
-- local hotkey = require("hs.hotkey")
-- local chooser = require("hs.chooser")
-- local window = require("hs.window")

-- -- -- Function: Get label for a space by scanning its windows
-- -- local function getSpaceLabel(spaceID)
-- --     local winIDs = spaces.windowsForSpace(spaceID)
-- --     for _, winID in ipairs(winIDs) do
-- --         local win = window.get(winID)
-- --         if win then
-- --             local title = win:title()
-- --             if title:match("^SpaceLabel:") then
-- --                 -- Remove prefix
-- --                 return title:gsub("^SpaceLabel:%s*", "")
-- --             end
-- --         end
-- --     end
-- --     return nil
-- -- end


-- local function getSpaceLabel(spaceID)
--   local winIDs = spaces.windowsForSpace(spaceID)
--   for _, winID in ipairs(winIDs) do
--     -- Use pcall to prevent hangs/crashes
--     local ok, win = pcall(window.get, winID)
--     if ok and win then
--       local title = win:title()
--       if title and title:match("^SpaceLabel:") then
--         return title:gsub("^SpaceLabel:%s*", "")
--       end
--     end
--   end
--   return nil
-- end


-- -- Build list of spaces for chooser
-- local function buildSpaceList()
--     local screens = screen.allScreens()
--     local currentSpaceID = spaces.focusedSpace()
--     local spaceList = {}

--     for sIndex, scr in ipairs(screens) do
--         local spaceIDs = spaces.spacesForScreen(scr)
--         for spIndex, spID in ipairs(spaceIDs) do
--             local label = getSpaceLabel(spID) or ("Space " .. spIndex)
--             local text = string.format("Display %d → %s", sIndex, label)
--             if spID == currentSpaceID then
--                 text = "▶ " .. text -- highlight current space
--             end
--             table.insert(spaceList, {
--                 text = text,
--                 spaceID = spID
--             })
--         end
--     end

--     return spaceList
-- end

-- -- Create chooser
-- local spaceChooser = chooser.new(function(choice)
--     if choice then
--         spaces.gotoSpace(choice.spaceID)
--     end
-- end)

-- spaceChooser:rows(10)  -- number of visible rows

-- -- Hotkey to show chooser
-- hotkey.bind({"alt"}, "space", function()
--     spaceChooser:choices(buildSpaceList())
--     spaceChooser:show()
-- end)

-- hs.alert.show("Multi-Monitor Space Switcher Loaded (Sticky Note Labels)")


-- GPT v6----------------------------------------------------------------------------------
-- =========================================
-- Hammerspoon Multi-Monitor Space Switcher (Safe, Sticky Note Labels)
-- =========================================
-- Features:
-- 1. Single hotkey (⌥ + Space) opens a chooser of all spaces on all monitors
-- 2. Reads space labels from tiny sticky-note windows (titles starting with "SpaceLabel:")
-- 3. Fallback: "Space X" if no sticky note found
-- 4. Highlights current active space
-- 5. Navigate with arrow keys, Enter jumps to selected space
-- 6. Safe: skips inaccessible windows to avoid hangs
-- 7. Caches labels per hotkey press for speed

-- local spaces = require("hs.spaces")
-- local screen = require("hs.screen")
-- local hotkey = require("hs.hotkey")
-- local chooser = require("hs.chooser")
-- local window = require("hs.window")

-- -- =========================================
-- -- Function: Get label for a space by scanning windows safely
-- -- =========================================
-- local function getSpaceLabel(spaceID)
--     local winIDs = spaces.windowsForSpace(spaceID)
--     for _, winID in ipairs(winIDs) do
--         -- Use pcall to prevent hangs from inaccessible windows
--         local ok, win = pcall(window.get, winID)
--         if ok and win then
--             local title = win:title()
--             if title and title:match("^SpaceLabel:") then
--                 return title:gsub("^SpaceLabel:%s*", "")
--             end
--         end
--     end
--     return nil
-- end

-- -- =========================================
-- -- Function: Build list of spaces for chooser
-- -- =========================================
-- local function buildSpaceList()
--     local screens = screen.allScreens()
--     local currentSpaceID = spaces.focusedSpace()
--     local spaceList = {}

--     -- Cache labels per hotkey press
--     local labelCache = {}

--     for sIndex, scr in ipairs(screens) do
--         local spaceIDs = spaces.spacesForScreen(scr)
--         for spIndex, spID in ipairs(spaceIDs) do
--             local label = labelCache[spID]
--             if not label then
--                 label = getSpaceLabel(spID) or ("Space " .. spIndex)
--                 labelCache[spID] = label
--             end
--             local text = string.format("Display %d → %s", sIndex, label)
--             if spID == currentSpaceID then
--                 text = "▶ " .. text -- highlight current space
--             end
--             table.insert(spaceList, {
--                 text = text,
--                 spaceID = spID
--             })
--         end
--     end

--     return spaceList
-- end

-- -- =========================================
-- -- Create the chooser
-- -- =========================================
-- local spaceChooser = chooser.new(function(choice)
--     if choice then
--         spaces.gotoSpace(choice.spaceID)
--     end
--  end)

-- spaceChooser:rows(10)  -- number of visible rows



-- GPT v7----------------------------------------------------------------------------------
-- -- =========================================
-- -- Hotkey to show chooser
-- -- =========================================
-- hotkey.bind({"alt"}, "space", function()
--     spaceChooser:choices(buildSpaceList())
--     spaceChooser:show()
-- end)

-- -- Optional: alert when config loads
-- hs.alert.show("Multi-Monitor Space Switcher Loaded (Safe Labels)")


-- ==============================
-- Multi-Monitor Space Switcher
-- ==============================

-- local spaces = require("hs.spaces")
-- local window = require("hs.window")
-- local timer = require("hs.timer")

-- -- Cache of spaces to avoid repeated system calls
-- local cachedSpaces = {}

-- -- Function to get all spaces by display
-- local function getSpacesByDisplay()
--     local displays = hs.screen.allScreens()
--     local allSpaces = spaces.allSpaces()
--     local result = {}

--     for _, display in ipairs(displays) do
--         local uuid = display:getUUID()
--         result[uuid] = allSpaces[uuid] or {}
--     end
--     return result
-- end

-- -- Function to get space name via hidden sticky note
-- local function getSpaceName(spaceID)
--     local wins = hs.window.allWindows()
--     for _, w in ipairs(wins) do
--         if w:isStandard() and w:title() ~= "" then
--             local note = w:title()
--             -- assuming a convention: "SPACE_NAME: <name>"
--             local name = note:match("SPACE_NAME:%s*(.+)")
--             if name then
--                 return name
--             end
--         end
--     end
--     return nil
-- end

-- -- Switch to space by name on a specific display
-- local function switchToSpace(displayUUID, name)
--     local displaySpaces = cachedSpaces[displayUUID] or {}
--     for _, spaceID in ipairs(displaySpaces) do
--         local spaceName = getSpaceName(spaceID)
--         if spaceName == name then
--             spaces.gotoSpace(spaceID)
--             return true
--         end
--     end
--     return false
-- end

-- -- Initial caching of spaces
-- cachedSpaces = getSpacesByDisplay()

-- -- Timer to refresh cache periodically (every 10 seconds)
-- timer.doEvery(10, function()
--     cachedSpaces = getSpacesByDisplay()
-- end)

-- -- Example hotkeys for switching
-- hs.hotkey.bind({"ctrl", "alt"}, "1", function()
--     local primaryUUID = hs.screen.primaryScreen():getUUID()
--     switchToSpace(primaryUUID, "Work")
-- end)

-- hs.hotkey.bind({"ctrl", "alt"}, "2", function()
--     local primaryUUID = hs.screen.primaryScreen():getUUID()
--     switchToSpace(primaryUUID, "Chat")
-- end)

-- hs.hotkey.bind({"ctrl", "alt"}, "3", function()
--     local primaryUUID = hs.screen.primaryScreen():getUUID()
--     switchToSpace(primaryUUID, "Misc")
-- end)


-- GPT v10----------------------------------------------------------------------------------
-- local spaces = require("hs.spaces")
-- local window = require("hs.window")
-- local timer = require("hs.timer")

-- -- Cache spaces and their names
-- local cachedSpaces = {}

-- -- Function to get the name of a space via a hidden sticky note
-- local function getSpaceName(spaceID)
--     for _, w in ipairs(hs.window.allWindows()) do
--         if w:isStandard() and w:title():match("^SPACE_NAME:") then
--             local note = w:title()
--             local name = note:match("SPACE_NAME:%s*(.+)")
--             local space = spaces.windowSpaces(w)[1]
--             if space == spaceID then
--                 return name
--             end
--         end
--     end
--     return nil
-- end

-- -- Refresh cached spaces and their names
-- local function refreshSpaces()
--     cachedSpaces = {}
--     local allSpaces = spaces.allSpaces()
--     for _, displaySpaces in pairs(allSpaces) do
--         for _, spaceID in ipairs(displaySpaces) do
--             cachedSpaces[spaceID] = getSpaceName(spaceID) or "Unnamed"
--         end
--     end
-- end

-- -- Initial cache
-- refreshSpaces()
-- -- Refresh every 10 seconds
-- timer.doEvery(10, refreshSpaces)

-- -- Cycle function for a display
-- local function cycleSpace(display)
--     local uuid = display:getUUID()
--     local displaySpaces = spaces.allSpaces()[uuid]
--     if not displaySpaces or #displaySpaces == 0 then return end

--     local currentSpace = spaces.activeSpaceOnScreen(display)
--     local nextIndex = 1

--     for i, s in ipairs(displaySpaces) do
--         if s == currentSpace then
--             nextIndex = i + 1
--             break
--         end
--     end

--     if nextIndex > #displaySpaces then
--         nextIndex = 1
--     end

--     local nextSpace = displaySpaces[nextIndex]
--     spaces.gotoSpace(nextSpace)

--     -- Show space name in Hammerspoon alert
--     hs.alert.show(cachedSpaces[nextSpace])
-- end

-- -- Hotkey to cycle primary display spaces
-- hs.hotkey.bind({"ctrl", "alt"}, "tab", function()
--     local primary = hs.screen.primaryScreen()
--     cycleSpace(primary)
-- end)

-- GPT v11----------------------------------------------------------------------------------
-- local spaces = require("hs.spaces")
-- local window = require("hs.window")
-- local timer = require("hs.timer")
-- local alert = require("hs.alert")

-- -- Cache spaces and their names
-- local cachedSpaces = {}

-- -- Get space name via hidden sticky note
-- local function getSpaceName(spaceID)
--     for _, w in ipairs(hs.window.allWindows()) do
--         if w:isStandard() and w:title():match("^SPACE_NAME:") then
--             local note = w:title()
--             local name = note:match("SPACE_NAME:%s*(.+)")
--             local space = spaces.windowSpaces(w)[1]
--             if space == spaceID then
--                 return name
--             end
--         end
--     end
--     return "Unnamed"
-- end

-- -- Refresh cached spaces and names
-- local function refreshSpaces()
--     cachedSpaces = {}
--     local allSpaces = spaces.allSpaces()
--     for _, displaySpaces in pairs(allSpaces) do
--         for _, spaceID in ipairs(displaySpaces) do
--             cachedSpaces[spaceID] = getSpaceName(spaceID)
--         end
--     end
-- end

-- -- Initial cache
-- refreshSpaces()
-- timer.doEvery(10, refreshSpaces)

-- -- Cycle spaces on a single display
-- local function cycleDisplaySpaces(display)
--     local uuid = display:getUUID()
--     local displaySpaces = spaces.allSpaces()[uuid]
--     if not displaySpaces or #displaySpaces == 0 then return end

--     local currentSpace = spaces.activeSpaceOnScreen(display)
--     local nextIndex = 1

--     for i, s in ipairs(displaySpaces) do
--         if s == currentSpace then
--             nextIndex = i + 1
--             break
--         end
--     end

--     if nextIndex > #displaySpaces then
--         nextIndex = 1
--     end

--     local nextSpace = displaySpaces[nextIndex]
--     spaces.gotoSpace(nextSpace)

--     -- Show space name
--     alert.show(cachedSpaces[nextSpace], 1)
-- end

-- -- Cycle spaces on all screens
-- local function cycleAllDisplays()
--     for _, screen in ipairs(hs.screen.allScreens()) do
--         cycleDisplaySpaces(screen)
--     end
-- end

-- -- Hotkey: Ctrl + Alt + Tab cycles all monitors
-- hs.hotkey.bind({"ctrl", "alt"}, "tab", cycleAllDisplays)
