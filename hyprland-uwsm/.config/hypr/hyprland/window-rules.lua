hl.window_rule({
    name = "Stop apps from maximizing by default",
    match = { class = ".*" },
    suppress_event = "maximize",
})