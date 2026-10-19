-- VARS
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- PROGRAMS
local terminal = "uwsm-app -- kitty"
local fileManager = "uwsm-app -- thunar"
local launcher = "uwsm-app -- vicinae"
local browser = "uwsm-app -- librewolf"
local codeEditor = "uwsm-app -- neovide"
local powerMenu = ipc .. " panel-toggle session"
local settings = ipc .. " settings-open"

-- ACTIONS
hl.bind(mainMod .. " + C", hl.dsp.window.close())                                                        -- close a window
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.kill())                                                 -- force close (kill) a window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))          -- maximise a window
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- fullscreen a window
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next())                                                 -- cycle next window
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))                                                  -- lock

-- LAUNCHING STUFF
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(codeEditor))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(launcher .. " vicinae://toggle"))                   -- Toggle Launcher
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(launcher .. " vicinae://launch/applications"))      -- App Launcher
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(launcher .. " vicinae://launch/clipboard/history")) -- Clipboard History
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(settings))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("uwsm-app -- kitty -e nmtui"))

-- MOVE FOCUS WITH ARROW KEYS
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- MOVE/RESIZE WINDOWS WITH MOUSE KEYS
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- MOVE WINDOWS WITH ARROW KEYS
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- RESIZE WINDOWS WITH ARROW KEYS
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- SWITCH WORKSPACES WITH mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + mouse:274", hl.dsp.focus({ workspace = 1 })) -- workspace 1 with mainMod + middle mouse button (scroll click)

-- SPECIAL WORKSPACE
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:special", follow = false }))

-- VOLUME
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up 10"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down 10"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"), { locked = true, repeating = true })

-- MEDIA
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media toggle"), { locked = true })

-- BRIGHTNESS
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up 10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down 10"), { locked = true, repeating = true })

-- GESTURES
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" }) -- three finger swipe for workspace
hl.gesture({
  fingers = 3,
  direction = "down",
  action = function()
    hl.exec_cmd(ipc .. " screenshot-region")
  end,
})
hl.gesture({
  fingers = 4,
  direction = "down",
  action = function()
    hl.exec_cmd(ipc .. " screenshot-fullscreen")
  end,
})
