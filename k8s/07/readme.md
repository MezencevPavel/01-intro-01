# Домашнее задание к занятию «Хранение в K8s. Часть 2»

### Цель задания

В тестовой среде Kubernetes нужно создать PV и продемострировать запись и хранение файлов.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным GitHub-репозиторием.

------

### Дополнительные материалы для выполнения задания

1. [Инструкция по установке NFS в MicroK8S](https://microk8s.io/docs/nfs). 
2. [Описание Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/). 
3. [Описание динамического провижининга](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/). 
4. [Описание Multitool](https://github.com/wbitt/Network-MultiTool).

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 
4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.
2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
3. Продемонстрировать возможность чтения и записи файла изнутри пода. 
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.


------

### Решение 1

1. пишу [deployment.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/deploy.yml) и применяю его.  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/01.png)  
2. пишу [pvc.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/pvc.yml) и [pv.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/pv.yml) и применяю их.  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/02.png)  
3. после проверки подов, вижу что они в статусе **running**  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/03.png)  
4. после команды logs к поду, я вижу что multitool работает и есть доступ.  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/04.png)  


------

### решение 2
 
1. для подключения NFS требуется подключить **community** командой **microk8s enable community**
2. далее подключаю addon NFS  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/05.png)  
3. пишу манифест [deploy_ngs.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/deploy_nfs.yml) и применяю его, так же проверяю его статус и создан ли **PV**  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/06.png)  
4. пишу манифест [pvc_nfs.yml](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/pvc_nfs.yml) и применяю его. 
5. проверяю статус пода  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/07.png) 
вижу что он в статусе **running**  
6. так же проверил статус записи  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/07/PNG/08.png) 

------
