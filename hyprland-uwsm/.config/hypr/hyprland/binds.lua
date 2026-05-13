-- VARS
local mainMod = "SUPER"
local ipc =     "qs -c noctalia-shell ipc call"

-- PROGRAMS
local terminal =    "uwsm-app -- kitty"
local fileManager = "uwsm-app -- kitty -e yazi"
local appLauncher = "uwsm-app -- walker"
local browser =     "uwsm-app -- librewolf"
local powerMenu =   ipc .. " sessionMenu toggle"
local settings =    ipc .. " settings toggle"

-- ACTIONS
hl.bind(mainMod .. " + C",          hl.dsp.window.close()) -- close a window
hl.bind(mainMod .. " + SHIFT + C",  hl.dsp.window.kill()) -- force close (kill) a window
hl.bind(mainMod .. " + F",          hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"})) -- maximise a window
hl.bind(mainMod .. " + SHIFT + F",  hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- fullscreen a window
hl.bind(mainMod .. " + TAB",        hl.dsp.window.cycle_next()) -- cycle next window

-- LAUNCHING STUFF
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(appLauncher .. " -m clipboard"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(settings))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("uwsm-app -- kitty -e nmtui"))

-- MOVE FOCUS WITH ARROW KEYS
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- MOVE/RESIZE WINDOWS WITH MOUSE KEYS
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--  MOVE WINDOWS WITH ARROW KEYS
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- SWITCH WORKSPACES WITH mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + mouse:274", hl.dsp.focus({ workspace = 1 })) -- workspace 1 with mainMod + middle mouse button (scroll click)

-- VOLUME
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

-- MEDIA
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- BRIGHTNESS
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- SCREENSHOT FOCUSED WINDOW USING PRINT
hl.bind("PRINT",         hl.dsp.exec_cmd("hyprshot -z -s -m window --clipboard-only"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -z -m window -o ~/Pictures/captures -f $(date +%I-%M-%S%p_%d-%m-%Y.png)"))

-- GESTURES
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" }) -- three finger swipe for workspace
hl.gesture({
    fingers = 3,
    direction = "down",
---@diagnostic disable-next-line: assign-type-mismatch
    action = function()
        hl.exec_cmd("hyprshot -z -s -m region --clipboard-only")
    end
})
hl.gesture({
    fingers = 4,
    direction = "down",
---@diagnostic disable-next-line: assign-type-mismatch
    action = function()
        hl.exec_cmd("hyprshot -z -m region -o ~/Pictures/captures -f $(date +%I-%M-%S%p_%d-%m-%Y.png)")
    end
})
