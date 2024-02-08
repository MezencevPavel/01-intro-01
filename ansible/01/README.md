# Домашнее задание к занятию 1 «Введение в Ansible»
# New
## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

**значение 12**

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%201.png)


2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

**значение находилось в /group_vars/all/examp.yml** 

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%202.png)


3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

**воспользовался docker-compose**

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%203%20docker.png)


4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

**с ubuntu столкнулся с проблемой отсуствия phyton. зашёл в ВМ и установил вручную**

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%204.png)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

**изменены факты в /group_vars/deb и /el**

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

**корректные значения для всех хостов получены**

(![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%205.png))

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

**готово с помощью команды ansible-vault encryp**

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

**работает**

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%206.png)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

**с помощью команды ansible-doc -t connection -l можно вывести список плагинов. local: плагин локального подключения, который выполняет модули Ansible на контрольной ноде.**


10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

**был создан файл /group_vars/local/examp.yml**

```
---
some_fact: "local default fact"

```
**так же поправил prod.yml**


11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/ansible/01/img/01%208.png)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

---
