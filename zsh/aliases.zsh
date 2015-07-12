
alias l="ls -al"
alias ll="ls -alFGhkl"
alias ls="ls -Fh"
alias grep='grep --color=auto --exclude-dir=\.git'
alias pygrep='grep --color=auto --include="*.py" --exclude-dir=\.git'

alias 'dus=du -sckx * | sort -nr'
alias targz="tar -zcvf"
alias untargz="tar -zxvf"

# alias tmux='TERM=screen-256color-bce tmux'

alias acat='less ~dotpath/aliases.zsh'
alias fcat='less ~dotpath/functions.zsh'
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

if [[ -f $dotpath/local.aliases.zsh ]]; then
    source $dotpath/local.aliases.zsh 
fi
