# DIRSTACKFILE="$HOME/.cache/zsh/dirs"
# if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#   dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#   [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi
# chpwd() {
#   print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
# }
# DIRSTACKSIZE=20
# setopt autopushd pushdsilent pushdtohome
# ## Remove duplicate entries
# setopt pushdignoredups
# ## This reverts the +/- operators.
# setopt pushdminus


# add ssh keys
add-ssh-agent () {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}


# ssh re-agent
ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
      export SSH_AUTH_SOCK=$agent
      if ssh-add -l 2>&1 > /dev/null; then
         echo Found working SSH Agent:
         ssh-add -l
         return
      fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
  echo Try running 'add-ssh-agent'
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
ppath() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}


# -------------------------------------------------------------------
# myIP address
# -------------------------------------------------------------------
myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

ls_snip() {
list_snippets_for() {
  egrep "^snippet|^#" ~/.vim/snippets/$1.snippets | awk '/^#/ {comment = comment $0} /^snippet/ {print $0 "\t\t" comment; comment=""}'
}

if [ "$1" == "" ]
then
  echo "You must specify at least one file type as an argument to ls_snip"
  exit
fi

for filetype in "$@"
do
  echo `echo $filetype | awk '{print toupper($0)}'`
  list_snippets_for $filetype
  echo
done
}

pyswitch2() {
    echo 'Switching to Python2.'
    export PATH=${PATH%:$HOME/anaconda/bin}
    export PATH=${PATH%:$HOME/anaconda3/bin}
    export PATH=$HOME/anaconda/bin:$PATH
    path=($path)
    # echo $PATH
}

pyswitch3() {
    echo 'Switching to Python3.'
    export PATH=${PATH%:$HOME/anaconda/bin}
    export PATH=${PATH%:$HOME/anaconda3/bin}
    export PATH=$HOME/anaconda3/bin:$PATH
    path=($path)
    # echo $PATH
}
