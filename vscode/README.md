# Visual Studio Code

### 1. Add APT repo
```shell
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/microsoft.gpg /etc/apt/sources.list.d/vscode.list
```

### 2. Install VS Code
```shell
sudo apt update
sudo apt install -y code
```
