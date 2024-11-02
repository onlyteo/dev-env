# Docker

### 1. Add APT repo
```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/ubuntu noble stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/docker.gpg /etc/apt/sources.list.d/docker.list
```

### 2. Install Docker
```shell
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 3. Add user to docker group
```shell
sudo usermod -aG docker $USER
```
