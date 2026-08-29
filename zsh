---
syntax: bash
tags: [zsh, shell]
---
# To check the installed Zsh version (macOS includes Zsh):
zsh --version

# To install Zsh with Homebrew on macOS or Linux:
brew install zsh

# To install Zsh on Debian or Ubuntu:
sudo apt install zsh

# To install Oh My Zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# To install syntax highlighting and autosuggestions for Oh My Zsh:
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Add the plugins to the list in ~/.zshrc (syntax highlighting should be last):
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# To install Powerlevel10k for Oh My Zsh:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Set the theme in ~/.zshrc:
ZSH_THEME="powerlevel10k/powerlevel10k"

# To install the recommended Meslo Nerd Font on macOS:
brew install --cask font-meslo-for-powerlevel10k

# To reload Zsh and run the Powerlevel10k configuration wizard:
exec zsh
p10k configure
