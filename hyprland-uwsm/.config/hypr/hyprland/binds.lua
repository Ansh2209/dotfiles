-- VARS
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- PROGRAMS
local terminal = "uwsm-app -- kitty"
local fileManager = "uwsm-app -- kitty -e yazi"
local appLauncher = "uwsm-app -- walker"
local browser = "uwsm-app -- librewolf"
--local powerMenu = ipc "sessionMenu toggle"
--local settings = ipc "settings toggle"

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
--hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(settings))
--hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("uwsm-app -- kitty -e nmtui"))

-- MOVE FOCUS WITH ARROW KEYS
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--  MOVE WINDOWS WITH ARROW KEYS
--hl.bind(mainMod .. " + ", hl.dsp.window.mo)
--hl.bind(mainMod .. " + ", hl.dsp.window.mo)
--hl.bind(mainMod .. " + ", hl.dsp.window.mo)
--hl.bind(mainMod .. " + ", hl.dsp.window.mo)

-- SWITCH WORKSPACES WITH mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind(mainMod .. " + mouse:274", hl.dsp.focus({ workspace = 1 })) -- focus workspace 1 with mainMod + middle mouse button (scroll click)
