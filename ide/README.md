# IDEs

### 1. Install IntelliJ IDEA
```bash
```

### 2. Install VS Code
```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft-packages.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/microsoft-packages.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
```

### 3. Install Sublime Text
```bash
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sublimehq.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublimetext.list > /dev/null
```

### 4. Install Insomnia REST Client
```bash
curl -fsSL https://packages.konghq.com/public/insomnia/gpg.474B9148D779222B.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/insomnia.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/insomnia.gpg] https://packages.konghq.com/public/insomnia/deb/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/insomnia.list > /dev/null
```
