function mkcd
    mkdir -p $argv && cd $argv
end

function vscode
    code $argv && exit
end
