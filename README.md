# dotfiles

* ###Vim

  Setup Vundle and install Vim plugins
  ```
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  ```


* ###Git

  Create a file `~/.git-user` which contains:
  ```
  [user]
      name = <name>
      email = <email>
  ```
