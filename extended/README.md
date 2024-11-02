# Extended

## Extra CLI tools
```shell
sudo apt install -y jq yq fx px bat autojump duf dust
```

## fx
JSON viewer and processor
https://github.com/antonmedv/fx

## px
Alternative to the `ps`, `top` and `pstree` commands.
https://github.com/walles/px

## bat
Alternative to the `cat` or `less` command.
https://github.com/sharkdp/bat

## autojump
Alternative to the `cd` command.
https://github.com/wting/autojump

## duf
Alternative to the `df` command.
https://github.com/muesli/duf

## dust
Alternative to the `du` command.
https://github.com/bootandy/dust

## eza
Alternative to the `ls` command.
https://github.com/eza-community/eza

### 1. Add APT repo
```shell
curl -fsSL https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/gierens.gpg
echo "deb [signed-by=/etc/apt/trusted.gpg.d/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/gierens.gpg /etc/apt/sources.list.d/gierens.list
```

### 2. Install eza
```shell
sudo apt update
sudo apt install -y eza
```
