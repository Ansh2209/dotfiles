function mkcd
    mkdir -p $argv && cd $argv
end

function vscode
    code -p $argv && exit
end
