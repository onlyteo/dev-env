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

### 6. Add custom font
```bash
mkdir -p ~/.local/share/fonts/NerdFonts/
cd ~/.local/share/fonts/NerdFonts/
curl -O "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf"
```
Choose font for terminal in Edit -> Preferences -> Appearance

### 7. Use Atlassian BitBucket Git plugin
```bash
gem install atlassian-stash
stash configure
```
Fill in:
* Username
* Password
* BitBucket URL
* Skip designating remote
* Answer 'y' to create git alias

#### Create pull request
From a feature branch
```bash
git create-pull-request origin/develop
```
Or with reviewers
```bash
git create-pull-request origin/develop @user1 @user2
```
