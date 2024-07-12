# ZSH Setup

### 1. Install ZSH
```bash
sudo apt install zsh
```

### 2. Install Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Add custom theme
```bash
cd ~/.oh-my-zsh/custom/themes
git clone https://github.com/romkatv/powerlevel10k.git
```

### 4. Add custom plugins
```bash
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

### 5. Modify ZSH config
Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

Update ZSH plugins in `~/.zshrc`.
```bash
plugins=(
   git
   zsh-autosuggestions
   zsh-syntax-highlighting
)
```

Restart Zsh. When starting the shell you will be presented with the config setup dialog for the powerlevel10k theme. If that does not happen then you can start it manually with `p10k configure`.

Add username and hostname to the prompt by editing the `~/.p10k.zsh` and appending the `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` variable to contain the `context` field:
```bash
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # os identifier
    context                 # username@hostname
    dir                     # current directory
    vcs                     # git status
    prompt_char             # prompt symbol
  )

```
