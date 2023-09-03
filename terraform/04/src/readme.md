# Домашнее задание к занятию «Продвинутые методы работы с Terraform»


------

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%201.png)

------

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%202.png)

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%203.png)

6. Сгенерируйте документацию к модулю с помощью terraform-docs.    

https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/src/doc.md
 


### Задание 3
1. Выведите список ресурсов в стейте.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%204.png)

2. Полностью удалите из стейта модуль vpc.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%205.png)
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/terraform/04/img/04%207.png)