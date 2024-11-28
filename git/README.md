# Git Setup

## Git CLI

### 1. Install Git CLI
```shell
sudo apt install -y git
```

### 2. Content of .gitconfig
```ini
[user]
    name = Teo
    email = onlyteo@live.com
[alias]
    a = add
    aa = add --all
    co = checkout
    cob = checkout -b
    ci = commit
    cia = commit --amend
    cian = commit --amend --no-edit
    cim = commit -m
    cl = clone
    br = branch
    bru = branch -u origin/\"$(git rev-parse --abbrev-ref HEAD)\"
    st = status
    sts = status -s
    nice = log --all --graph --decorate --oneline
    lol = log --all --graph --decorate --date=format:\"%Y-%m-%d %H:%M:%S\" --pretty=format:\"%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(cyan)[%an <%ae> (%cn <%ce>) %cd]%Creset\" --abbrev-commit
    undo = checkout -- .
    unstage = reset --
[core]
    autocrlf = input
    longpaths = true
    excludesfile = ~/.gitignore_global
[push]
    default = simple
    autoSetupRemote = true
[fetch]
    prune = true
```
### 3. Content of .gitignore_global
```shell
application-onlyteo*.yml
docker-compose.onlyteo.yml
logback-onlyteo.xml
```

## Git Delta
Diff tool for Git.
https://github.com/dandavison/delta

### 1. Install
```shell
sudo apt install -y git-delta
```

### 2. Update .gitconfig
```ini
[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true    # use n and N to move between diff sections
    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true
[merge]
    conflictstyle = zdiff3
```

## GitHub CLI

### 1. Add APT repo
```shell
export K8S_VERSION=v1.31
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/github-cli.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/github-cli.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/github-cli.gpg /etc/apt/sources.list.d/github-cli.list
```

### 2. Install GitHub CLI
```shell
sudo apt update
sudo apt install -y gh
```
