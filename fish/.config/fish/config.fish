if status is-interactive
    set -g fish_greeting "" # REMOVE FISH GREETING

    # SOURCE
    source ~/.config/fish/abbr.fish
    source ~/.config/fish/functions.fish
        
    # INITIALIZE TOOLS
    zoxide init fish | source
end

if status --is-login
    if test (tty) = "/dev/tty1"
        if uwsm check may-start
            exec uwsm start hyprland.desktop
        end
    end
end
