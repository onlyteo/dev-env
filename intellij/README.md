# JetBrains IntelliJ IDEA

## JetBrains Toolbox
Use JetBrains Toolbox to install IntelliJ

### 1. Install prerequisites
```shell
sudo apt install -y libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin
```

### 2. Install JetBrains Toolbox
```shell
export TOOL_VERSION=2.5.1.34629
curl -fsSL https://download.jetbrains.com/toolbox/jetbrains-toolbox-${TOOL_VERSION}.tar.gz -o /tmp/jetbrains-toolbox.tar.gz
sudo mkdir -p /opt/JetBrains/Toolbox && cd /opt/JetBrains/Toolbox/
sudo tar -xzf /tmp/jetbrains-toolbox.tar.gz
sudo ln -s jetbrains-toolbox-${TOOL_VERSION}/ default
```

### 3. Run Toolbox
```shell
/opt/JetBrains/Toolbox/default/jetbrains-toolbox
```
