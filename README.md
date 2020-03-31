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
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Install my dotfiles

```
  $ mv dotfiles .dotfiles
  $ cd .dotfiles
  $ stow vim
  $ stow tmux
```
