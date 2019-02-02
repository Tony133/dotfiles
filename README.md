# dotfiles
My dotfiles

### Install Stow

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

### Install my dotfiles

```
  $ mv dotfiles .dotfiles
  $ cd .dotfiles
  $ stow vim
  $ stow tmux
```
