if status is-interactive
    set -g fish_greeting "" # REMOVE FISH GREETING

    # ADD PATH
    fish_add_path ~/.nix-profile/bin
    
    # SOURCE
    source ~/.config/fish/abbr.fish
    source ~/.config/fish/functions.fish
        
    # INITIALIZE TOOLS
    zoxide init fish | source
    devenv hook fish | source

    # pnpm
    set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
    if not string match -q -- "$PNPM_HOME/bin" $PATH
      set -gx PATH "$PNPM_HOME/bin" $PATH
    end
end

if status --is-login
    if test (tty) = "/dev/tty1"
        if uwsm check may-start
            exec uwsm start hyprland.desktop
        end
    end
end
