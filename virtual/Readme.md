# Домашнее задание к занятию 4. «Оркестрация группой Docker-контейнеров на примере Docker Compose»
## Задача 1
Создайте собственный образ любой операционной системы (например, debian-11) с помощью Packer версии 1.5.0 (инструкция).

Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.
## Ответ 1
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/virtual/05-z1.jpg)
## Задача 2
Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud
## Ответ 2
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/virtual/05-z2.jpg)
## Задача 3
С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana. Используйте Ansible-код в директории (src/ansible).

Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в docker-compose, должны быть в статусе "Up".
## Ответ 3
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/virtual/05-z3.jpg)
## Задача 4
Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
Используйте для авторизации логин и пароль из .env-file.
Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками(dashboards).
Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.
Чтобы получить зачёт, предоставьте:

скриншот работающего веб-интерфейса Grafana с текущими метриками, как на примере ниже.
## Ответ 4
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/virtual/05-z4.jpg)
