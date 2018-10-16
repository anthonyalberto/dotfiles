# Setup

0. Open `/etc/shells` and append `/usr/local/bin/zsh`

1. Install homebrew

2. Run :

  ```sh
  cd
  git clone git@github.com:anthonyalberto/dotfiles .dotfiles
  .dotfiles/setup.sh
  cd
  rm .git
  ```

3. In iTerm preferences => General => Load preferences from a custom folder and put `/Users/anthony/.dotfiles/iterm`


# Patch fonts

In case font is still messy, download https://gist.github.com/epegzz/1634235#file-monaco_linux-powerline-ttf and install it via Finder.
