
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
