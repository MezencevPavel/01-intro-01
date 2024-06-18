# Домашнее задание к занятию «Конфигурация приложений»

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8s).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым GitHub-репозиторием.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
2. Решить возникшую проблему с помощью ConfigMap.
3. Продемонстрировать, что pod стартовал и оба конейнера работают.
4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.
2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.
4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Решение 1. 
  
1. Пишу и применяю [Deployment](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/1/deploy.yml) приложения  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/01.png)  
как мы видим контейнер стоит в статусе **ContainerCreating** т.к. используется один и тот же порт, а **configmap** ещё не написан.  
2. Пишу и применяю [configmap](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/1/configmap.yml)  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/02.png)  
Оба контейнера в статусе **running**, что говорит о том что конфликт портов решён с помощью **configmap**  
3. Пишу и применяю [service](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/1/srv.yml)  
4. с помощью команды проверяю вывод **curl** 
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/03.png) 
  
------
  
### Решение 2. 
  
1. Пишу [Deployment](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/2/deploy.yml) с Nginx  
2. Прописываю [configmap](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/2/configmap.yml) c index.html  
3. Пишу сертифекат SSL  
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/04.png) 
4. создаю [Sercret](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/2/service.yml) для использования сертификата
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/05.png) 
5. Создаю [Ingress](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/2/ingress.yml) и необходимый [Service](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/2/service.yml), подключаю к нему SSL.  
6. проверяю доступ командой **openssl s_client -connect myingress.com:443**
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/k8s/08/PNG/06.png) 

------