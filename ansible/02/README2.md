### Описание **playbook**


## подготовка к работе
с помощью docker-compose разворачиваются 2 контейнера **centos-clickhouse** и **centos-vector**
```
version: '3'
services:
  centos7-clickhouse:
    image: centos:centos7
    container_name: centos-clickhouse
    restart: unless-stopped
    entrypoint: "sleep infinity"
    networks: 
       - mynetwork

  centos7-vector:
    image: centos:centos7
    container_name: centos-vector
    restart: unless-stopped
    entrypoint: "sleep infinity"
    networks: 
      - mynetwork


networks:
  mynetwork:
    driver: bridge
```

## 1. Site.yml Site2.yml

Site.yml - Playbook для хоста centos-clickhouse
В нем последовательно идёт набор задач(task)
1. скачивание файлов rpm по url протоколу. при этом с помощью модуля **rescue** при ненахождении файлов с архитектурой **noarch** ищутся файлы с архитектурой **x86_64**

```
        - name: Get clickhouse distrib
          ansible.builtin.get_url:
            url: "https://packages.clickhouse.com/rpm/stable/{{ item }}-{{ clickhouse_version }}.noarch.rpm"
            dest: "./{{ item }}-{{ clickhouse_version }}.noarch.rpm"
          with_items: "{{ clickhouse_packages }}"
      rescue:
        - name: Get clickhouse distrib
          ansible.builtin.get_url:
            url: "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-{{ clickhouse_version }}.x86_64.rpm"
            dest: "./clickhouse-common-static-{{ clickhouse_version }}.x86_64.rpm"
```

2. установка скаченных файлов rpm c помощью модуля **yum**

```
- name: Install clickhouse packages
      become: true
      ansible.builtin.yum:
        name:
          - clickhouse-common-static-22.3.3.44.x86_64.rpm
          - clickhouse-client-22.3.3.44.noarch.rpm
          - clickhouse-server-22.3.3.44.noarch.rpm
        installroot: /
```
3. используется модуль **handlers** который после выполнения task выполняет перезагрузку сервера. 

```
  handlers:
    - name: Start clickhouse service
      become: true
      ansible.builtin.service:
        name: clickhouse-server
        state: restarted
```

4. в последюю очередь выполняется задача для создания базы данных
С помощью модуля **meta: flush_handlers** она выполняется выполняется после модуля **handlers**

```
    - name: Create database
      ansible.builtin.command: "clickhouse-client -q 'create database logs;'"
      register: create_db
      failed_when: create_db.rc != 0 and create_db.rc !=82
      changed_when: create_db.rc == 0
```


Мной был сделан отдельный Playbook site2.yml для хоста **centos-vector**

1. скачивание файлов rpm по url протоколу

```
    - name: Get package vector
      ansible.builtin.get_url:
        url: https://packages.timber.io/vector/{{ vector_version }}/vector-{{ vector_version }}-1.x86_64.rpm
        dest: ./vector-{{ vector_version }}-1.x86_64.rpm
```
2. установка скаченных файлов rpm c помощью модуля **yum**

```
    - name: Install vector package
      become: true
      ansible.builtin.yum:
        name: vector-latest-1.x86_64.rpm
```
3. создание директории для файла **conf**

```
    - name: mkdir vector
      ansible.builtin.file:
        path: /etc/vector
        state: directory
        mode: "0755"
```

4. отправка файла **conf** в вм
 
```
      become: true
      ansible.builtin.template:
        src: ./template/jinja2.j2
        dest: /etc/vector/vector.conf
        mode: "0755"
```

5.  в последнюю очередь выполняется запуск vector, он запускается в последнюю очередь с помощью **handler** 

```
notify: Start vector service
```
notify позволяет выполнить handler после выполнения всех task

```
    - name: Start clickhouse service
      become: true
      ansible.builtin.service:
        name: clickhouse-server
        state: restarted
```


## 2. inventorty/prod.yml

В файле инвентаря указывается задаются хосты docker

```
clickhouse:
  hosts:
    centos-clickhouse:
      ansible_connection: docker
vector:
  hosts:
    centos-vector:
      ansible_connection: docker

```


## 3. group_vars/vector & clickhouse

в group_vars указаны переменные используемые в Site.yml и в Site2.yml, а данном случае это версии
clickhouse - "22.3.3.44"
vector - "latest"
