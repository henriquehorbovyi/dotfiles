## Dotfiles Doc

> [!NOTE]
> I'd like to create a install.sh file to automate the installation process. 


### 🔧 Installation 
- Macos
    - Install Xcode command line tools beforehand `xcode-select --install`
    - Install [brew](https://brew.sh/)  
    - `brew install git` to have git installed in your country 

- Linux/Common
    - `git clone https://github.com/henriquehorbovyi/dotfiles.git $HOME/dotfiles`
    - `cd dotfiles`
    - run `stow .`

Congratulations!! 🖥️🔥

### 📦 Dotfiles 
- Zsh
- Oh-my-zsh
- Ghostty
- Starship
- Tmux
- Nvim

### ⚠️ Important

##### Stow 
GNU Stow is a symlink farm manager - it creates symlinks for all files inside a directory and pass to it
In order to GNU stow to work you should place files inside this directory as if they were in your Home directory.

