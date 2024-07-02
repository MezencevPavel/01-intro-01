# Домашнее задание к занятию «Установка Kubernetes»

### Цель задания

Установить кластер K8s.

### Чеклист готовности к домашнему заданию

1. Развёрнутые ВМ с ОС Ubuntu 20.04-lts.


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
2. [Документация kubespray](https://kubespray.io/).

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
2. В качестве CRI — containerd.
3. Запуск etcd производить на мастере.
4. Способ установки выбрать самостоятельно.

### Решение 1.


```
# Installing the necessary packages

sudo apt update -y
sudo apt install python3.12-venv -y
python3 -m venv venv
source venv/bin/activate
git clone https://github.com/kubernetes-sigs/kubespray
cd kubespray/
pip3 install -r requirements.txt
pip3 install ruamel.yaml

# Copy `inventory/sample` as `inventory/mycluster`

cp -rfp inventory/sample inventory/mycluster

# Update Ansible inventory file with inventory builder

declare -a IPS=(10.128.0.3 10.128.0.35 10.128.0.19 10.128.0.16 10.128.0.38) # введи ip node, (ip master-node ip master-node ip worker-node ip worker-node) сначала все master, потом worker
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
nano inventory/mycluster/hosts.yaml

# Copy private ssh key to ansible host

scp ~/.ssh/id_ed25519 qwerty@158.160.35.143:~/.ssh/
sudo chmod 600 ~/.ssh/id_ed25519

# Installing a kubespray cluster

ansible-playbook -i inventory/mycluster/hosts.yaml cluster.yml -b -v

# Install config

mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config
```
**Создал 5 ВМ**  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/12/png/01.png)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/12/png/02.png)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/12/png/03.png)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/12/png/04.png)  

