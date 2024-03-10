# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/01.png?raw=true) 1
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/02.png?raw=true) 2

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/3.png?raw=true) 3
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/4.png?raw=true) 4
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/5.png?raw=true) 5
2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/CICD/04/PNG/6.png?raw=true) 6
![markdown img]() 
3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.

ссылка на Declarative Pipeline - https://github.com/staratel74/ansible-role/blob/main/vector-role/Jenkinsfile

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.

* внести запись на агенте в /etc/sudoers jenkins  ALL=(ALL) NOPASSWD:ALL что бы не запрашивался пароль при sudo
* на агенте mkdir /opt/jdk && ln -s /usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.el7_9.x86_64 /opt/jdk/openjdk-11

8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.

* ссылка на роль vector-role - https://github.com/MezencevPavel/vector_role
* ссылка на Declarative Pipeline - 
* ссылка на Scripted Pipeline - 

## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.
2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
