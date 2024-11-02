# Kong Insomnia REST Client

### 1. Add APT repo
```shell
curl -fsSL https://packages.konghq.com/public/insomnia/gpg.474B9148D779222B.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/insomnia.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/insomnia.gpg] https://packages.konghq.com/public/insomnia/deb/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/insomnia.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/insomnia.gpg /etc/apt/sources.list.d/insomnia.list
```

### 2. Install Insomnia
```shell
sudo apt-get update
sudo apt-get install -y insomnia
```
