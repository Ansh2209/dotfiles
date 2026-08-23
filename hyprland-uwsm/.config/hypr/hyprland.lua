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

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
