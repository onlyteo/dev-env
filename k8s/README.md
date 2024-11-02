# K8S

## K8S CLI
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux

### 1. Add APT Repo
```shell
export K8S_VERSION=v1.31
curl -fsSL https://pkgs.k8s.io/core:/stable:/${K8S_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/kubernetes.gpg] https://pkgs.k8s.io/core:/stable:/${K8S_VERSION}/deb" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/kubernetes.gpg /etc/apt/sources.list.d/kubernetes.list
```

### 2. Install K8S CLI
```shell
sudo apt update
sudo apt install -y kubectl kubens kubectx
```

## K9S
Improved CLI for Kubernetes
https://github.com/derailed/k9s

### 1. Install K9S CLI
```shell
export K9S_VERSION=v0.32.5
curl -fsSL https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_linux_amd64.deb -o /tmp/k9s.deb
sudo apt install -y /tmp/k9s.deb && rm /tmp/k9s.deb
```
