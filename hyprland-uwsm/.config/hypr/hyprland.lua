-- Require files
require("hyprland.binds")
require("hyprland.autostart")
require("hyprland.window-rules")

-- Monitor
hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@120",
  position = "0x0",
  scale = "1.0",
})

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 15,
    border_size = 2,

    col = {
      active_border = { colors = { "rgb(5c7094)", "rgb(768c79)" }, angle = 45 },
      inactive_border = "rgba(55585daa)",
    },

    resize_on_border = false,
    allow_tearing = true,
    layout = "master",
  },

  master = {
    new_status = "slave",
    mfact = 0.6,
  },

  animations = {
    enabled = true,
  },

  decoration = {
    rounding = 10,
    rounding_power = 5,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },

  input = {
    kb_layout = "us",
    numlock_by_default = true,
    repeat_delay = 500,
    repeat_rate = 20,
    follow_mouse = 1,
    sensitivity = 0.2, -- -1.0 to 1.0
    touchpad = {
      natural_scroll = true,
      clickfinger_behavior = true,
    },
  },
})

hl.device({
  name = "pixart-dell-ms116-usb-optical-mouse",
  accel_profile = "flat",
  sensitivity = 0.8,
})

-- Animation curves
hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

-- Animation configs
hl.animation({ leaf = "layersIn", enabled = true, speed = 5, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 4, bezier = "emphasizedAccel", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "standard" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 5, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "emphasizedAccel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "standard" })

hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 4,
  bezier = "specialWorkSwitch",
  style = "slidefadevert 15%",
})
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })
