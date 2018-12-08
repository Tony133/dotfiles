# dotvim
My Vim configuration

## Install Stow

Ubuntu/Debian
```
  $ apt install stow
```

MacOS
```
  $ brew install stow
```
If you don’t already have Homebrew installed

```
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install my dotvim

```
  $ mv dotvim .dotvim
  $ cd dotvim
  $ mv vim/vimrc vim/.vimrc
  $ mv tmux/tmux.conf tmux/.tmux.conf
  $ stow vim
  $ stow tmux
```
