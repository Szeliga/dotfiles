hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hyper = {"option", "shift", "control", "command"}

-------- Window Sizing
---- Left 50%
hs.hotkey.bind(hyper, "A", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrameInScreenBounds(f, 0)
end)

---- Top 50%
hs.hotkey.bind(hyper, "W", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrameInScreenBounds(f, 0)
end)

---- Middle 80%
hs.hotkey.bind(hyper, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.2)
  f.y = max.y
  f.w = max.w * 0.6
  f.h = max.h
  win:setFrameInScreenBounds(f, 0)
end)

---- Right 50%
hs.hotkey.bind(hyper, "D", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrameInScreenBounds(f, 0)
end)

---- Bottom 50%
hs.hotkey.bind(hyper, "X", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrameInScreenBounds(f, 0)
end)

---- Fullscreen
hs.hotkey.bind(hyper, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrameInScreenBounds(f, 0)
end)

-------- Window Movement
---- Move to left by 100
hs.hotkey.bind(hyper, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 100
  win:setFrameInScreenBounds(f, 0)
end)

---- Move to bottom by 100
hs.hotkey.bind(hyper, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 100
  win:setFrameInScreenBounds(f, 0)
end)

---- Move to top by 100
hs.hotkey.bind(hyper, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 100
  win:setFrameInScreenBounds(f, 0)
end)

---- Move to right by 100
hs.hotkey.bind(hyper, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 100
  win:setFrameInScreenBounds(f, 0)
end)
