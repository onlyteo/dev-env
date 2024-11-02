# Sublime Text Editor

### 1. Add APT repo
```shell
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sublimehq.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublimetext.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/sublimehq.gpg /etc/apt/sources.list.d/sublimetext.list
```

### 2. Install Sublime Text Editor
```shell
sudo apt update
sudo apt install -y sublime-text
```
