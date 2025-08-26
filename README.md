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

GNU Stow is a symlink farm manager - it creates symlinks for all files inside a directory and pass to it
In order to GNU stow to work you should place files inside this directory as if they were in your Home directory.

#### Ghostty
On linux Ghostty lives in $HOME/.config/ghostty/config and on Macos it lives in $HOME/Library/Application\ Support/com.mitchellh.ghostty/config.
So if your are on macos let's `export` our XDG_CONFIG_HOME variable, so ghostty can see our config on it's new location.

In your `.zshrc` add the following line:  
```bash 
export XDG_CONFIG_HOME="$HOME/.config"

```

And we can delete the current config file once we wont need it. 
```bash 
rm -rf ~/Library/Application\ Support/com.mitchellh.ghostty/config 

```

