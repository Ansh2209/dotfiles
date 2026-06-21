hl.window_rule({
  name = "Stop apps from maximizing by default",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "Center and size xdg-desktop-portal-gtk",
  match = { initial_class = "xdg-desktop-portal-gtk" },
  float = true,
  center = true,
  size = { 800, 600 },
})
