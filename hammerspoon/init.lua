-- Hyper keys
local hyper = { "cmd", "alt" }

-- Reload
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

-- Fullscreen and Window Management 
hs.hotkey.bind(hyper, "return", function()
  local win = hs.window.frontmostWindow()
	win:setFullscreen(not win:isFullscreen())
end)

hs.hotkey.bind(hyper, "'", function()
	local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
	
	f.x = max.x + (max.w / 16) 
  f.y = max.y
  f.w = max.w * (7 / 8) 
  f.h = max.h
  win:setFrame(f)
end)

-- App Shortcuts
local applicationHotkeys = {
	b = 'Brave Browser',
	d = 'Discord',
	f = 'Finder',
	i = 'Messages',
	o = 'Obsidian',
	s = 'Spotify',
	v = 'Visual Studio Code',
  n = 'Notes',
  z = 'zoom.us'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


hs.hotkey.bind(hyper, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.y / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)


hs.hotkey.bind(hyper, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y / 2
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Lock Screen
hs.hotkey.bind(hyper, "l", function()
  hs.caffeinate.lockScreen()
end)
