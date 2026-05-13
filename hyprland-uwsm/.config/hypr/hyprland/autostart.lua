hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("uwsm app -- qs -c noctalia-shell")
end)