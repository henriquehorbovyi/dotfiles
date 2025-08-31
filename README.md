## Dotfiles Doc

> [!NOTE]
> Before install read the Important topic 📕

### 🔧 Installation 
- Install [GNU stow](https://www.gnu.org/software/stow/) in your machine, if you are on macos `brew isntall stow`. 
- Macos
    - Install Xcode command line tools beforehand `xcode-select --install`
    - Install [brew](https://brew.sh/)  
    - `brew install git` to have git installed 

- Linux/Common
    - `git clone https://github.com/henriquehorbovyi/dotfiles.git $HOME/dotfiles`
    - `cd dotfiles`
    - run `./setup.sh`
- Install Nerd Fonts (some plugins will need it to render glyphs):
    - ttf-firacode-nerd
    - jetbrains-mono

Congratulations!! 🖥️🔥

### 📦 Dotfiles 
- Zsh
- Oh-my-zsh (installed by setup.sh)
- Ghostty
- Starship (installed by setup.sh)
- Tmux
- Nvim

### ⚠️ Important
Make sure you have all dependencies before running setup script. 
##### Stow 

GNU Stow is a symlink farm manager - it creates symlinks for all files inside a directory and pass to it. In order to GNU stow to work you should place files inside this directory as if they were in your Home directory.
