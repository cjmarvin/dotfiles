
if [[ $IS_LINUX -eq 1 ]]; then
    alias l="ls -Al --color=always"
    alias ll="ls -AFGhkl --color=always"
    alias ls="ls -Fh --color=always"
elif [[ $IS_MAC -eq 1 ]]; then
    alias l="ls -al"
    alias ll="ls -aFGhkl"
    alias ls="ls -Fh"
fi
alias grep='grep --color=auto --exclude-dir=\.git'
alias pygrep='grep --color=auto --include="*.py" --exclude-dir=\.git'

alias 'dus=du -sckx * | sort -nr'
alias targz="tar -zcvf"
alias untargz="tar -zxvf"

# alias tmux='TERM=screen-256color-bce tmux'

alias acat='vim -R ~dotpath/aliases.zsh ~dotpath/local.aliases.zsh'
alias fcat='vim -R ~dotpath/functions.zsh'
alias sz='source ~/.zshrc'

# Remove all .git files from a folder
alias resetgit='find . -type f | grep -i "\.git" | xargs rm'
# fix EOL error in Git
alias fixeol="find . -type f -exec sed -i 's/\x0d//g' {} \+"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -khs | sort -n -r | more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -khs | sort -rn"

# show path
alias path='echo -e ${PATH//:/\\n}'

# flatten directory
alias flatten="find TargetDirectory/ -mindepth 2 -type f -exec mv -i '{}' TargetDirectory/ ';'"

# rmate
alias sshrmate="ssh -R 52698:localhost:52698"

if [[ $IS_MAC -eq 1 ]]; then
    alias hide="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
    alias unhide="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
fi

if [[ -f $dotpath/local.aliases.zsh ]]; then
    source $dotpath/local.aliases.zsh 
fi
