function mkcd
    mkdir -p $argv && cd $argv
end

function vscode
    code $argv && exit
end

function nv
    nohup neovide $argv >/dev/null 2>&1 &
end
