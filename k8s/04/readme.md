# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к приложению, установленному в предыдущем ДЗ и состоящему из двух контейнеров, по разным портам в разные контейнеры как внутри кластера, так и снаружи.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Описание Service.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

------

### Решение 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера  

1. Создаю **namespace** : hw4 (homework 4)  
2. kubectl apply -f [deployment.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/yml/deployment.yaml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/01.png?raw=true)   
3. пишу манифест [service.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/yml/service.yaml) для доступа внутрь кластера  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/02.png?raw=true)
4. пишу манифест отдельный [multitool.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/yml/multitool.yaml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/03.png?raw=true)  
проверяю доступ  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/04.png?raw=true) 
5. проверю доступность подов по доменному имени сервиса  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/05.png?raw=true)

------

### Решение 2. Создать Service и обеспечить доступ к приложениям снаружи кластера  

1. Создаю отдельный [Service](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/yml/service-nodeport.yml)   
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/06.png?raw=true)  
c внешними портами **30007** и **30008**   
2. С помощью curl проверю, доступны ли приложения из подов по внешним портам:  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/04/png/07.png?raw=true)  


------