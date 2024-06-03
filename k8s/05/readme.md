# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

------

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым Git-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция](https://microk8s.io/docs/getting-started) по установке MicroK8S.
2. [Описание](https://kubernetes.io/docs/concepts/services-networking/service/) Service.
3. [Описание](https://kubernetes.io/docs/concepts/services-networking/ingress/) Ingress.
4. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

------

### Решение 1. Создать Deployment приложений backend и frontend

1. Создал отдельный Namespace hw5 (homework 5) 
2. Манифест [deploy_front](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/yml/deploy_front.yaml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/01.png?raw=true)  
3. Манифест [deploy_back](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/yml/deploy_back.yaml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/02.png?raw=true) 
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/03.png?raw=true) 
4. Манифест [service](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/yml/service.yaml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/05.png?raw=true)  
5. проверяю из пода **backend** доступ  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/06.png?raw=true)  

------

### Решение 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

------

1. Включаю ingress.enable  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/08.png?raw=true)  
2. пишу манифест [ingress](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/yml/ingress.yaml)  
3. применяю манифест  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/07.png?raw=true)  
4. Проверяю доступ к приложениям через get **microk8s kubectl get ingress -n hw5**  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/05/png/09.png?raw=true) 
5. ![markdown img]()
