## Dotfiles Doc

> [!NOTE]
> I'd like to create a install.sh file to automate the installation process. 
> Before install read the Important topic 📕


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

