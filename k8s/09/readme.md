# Домашнее задание к занятию «Управление доступом»

### Цель задания

В тестовой среде Kubernetes нужно предоставить ограниченный доступ пользователю.

------

### Чеклист готовности к домашнему заданию

1. Установлено k8s-решение, например MicroK8S.
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым github-репозиторием.

------

### Инструменты / дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) RBAC.
2. [Пользователи и авторизация RBAC в Kubernetes](https://habr.com/ru/company/flant/blog/470503/).
3. [RBAC with Kubernetes in Minikube](https://medium.com/@HoussemDellai/rbac-with-kubernetes-in-minikube-4deed658ea7b).

------

### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.
2. Настройте конфигурационный файл kubectl для подключения.
3. Создайте роли и все необходимые настройки для пользователя.
4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).
5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.

------

### Решение 1. Создайте конфигурацию для подключения пользователя

1. создаю ключ OpenSSL  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/01.png) 
Создаю запрос на подписание сертификата  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/02.png)  
Генерирую файл сертификата  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/03.png)  
2. Создаю пользователя staff и настраиваю его на использование созданного выше ключа  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/04.png)  
Создаю новый контекст с именем staff-context и подключаю его к пользователю staff  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/05.png)  
3. пишу манифест [role](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/role.yml) и [rolebinding](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/rolebinding.yaml) и применяю их.  
переключаюсь на пользователя staff и пишу для него [deployment](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/deploy.yml) и применяю его  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/06.png)  
мы видим что пользователь может видеть только NS - hw9. -A ключик видеть всех ему недоступен.  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/07.png)  
так же он может видеть логи. 
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/09/png/08.png)  

------

