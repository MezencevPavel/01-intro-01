# Описание Playbook
В yandex-cloud развёрнуты 3 виртуальные машины.  
они указаны в файлае инвентаря inventory/prod.yml  

```
clickhouse:
  hosts:
    centos-clickhouse:
      ansible_host: 84.201.134.195
vector:
  hosts:
    centos-vector:
      ansible_host: 51.250.5.253
lighthouse:
  hosts:
    centos-lighthouse:
      ansible_host: 158.160.35.248
```
Playbook разделён на 4 части.  
 
**clic.yml** - предназначен для установки clickhouse на ВМ centos-clickhouse  
**vector.yml** - предназначен для установки vector на ВМ centos-vector  
**nginx.yml** - предназначена для установки nginx на ВМ centos-lighthouse   
**light.yml** - предназначена для установки lighthouse на ВМ centos-lighthouse   


## Структура 

```
├── ansible.cfg
├── group_vars
│   ├── clickhouse/vars.yml
│   ├── lighthouse/vars.yml
│   └── vector/vars.yml
├── inventory
│   └── prod.yml
├── README.md
├── clic.yml
├── light.yml
├── nginx.yml
├── vector.yml
└── templates
    ├── lighthouse.conf.j2
    ├── nginx.conf.j2
    └── vector.toml.j2
```

## Параметры

в директории **template** находятся шаблоны конфигурации для Vector, nginx и lighthouse.  
в директории **invetory** находятится перечни хостов  
в диркектории **group_vars** находятся переменные хостов для работы playbook  


### Результат выполнения playbook clic.yml

```
PLAY [Install Clickhouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [centos-clickhouse]

TASK [Get clickhouse distrib] ******************************************************************************************************
ok: [centos-clickhouse] => (item=clickhouse-client)
ok: [centos-clickhouse] => (item=clickhouse-server)
failed: [centos-clickhouse] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "./clickhouse-common-static-22.3.3.44.noarch.rpm", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-22.3.3.44.noarch.rpm"}

TASK [Get clickhouse distrib] ******************************************************************************************************
ok: [centos-clickhouse]

TASK [Install clickhouse packages] *************************************************************************************************
ok: [centos-clickhouse]

TASK [clickhouse | start service] **************************************************************************************************
changed: [centos-clickhouse]

TASK [clickhouse | create database] ************************************************************************************************
ok: [centos-clickhouse]

PLAY RECAP *************************************************************************************************************************
centos-clickhouse          : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=1    ignored=0
```

### Результат выполнения playbook light.yml

```
PLAY [Install lighthouse] **********************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [centos-lighthouse]

TASK [lighthouse | install git] ****************************************************************************************************
ok: [centos-lighthouse]

TASK [lighthouse | get src git] ****************************************************************************************************
ok: [centos-lighthouse]

TASK [lighthouse | create dir conf] ************************************************************************************************
ok: [centos-lighthouse]

TASK [lighthouse | lighthouse conf] ************************************************************************************************
ok: [centos-lighthouse]

PLAY RECAP *************************************************************************************************************************
centos-lighthouse          : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Результат выполнения playbook nginx.yml

```
PLAY [Install Nginx] ***************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [centos-lighthouse]

TASK [NGINX | Install epel-release] ************************************************************************************************
ok: [centos-lighthouse]

TASK [NGINX | Install NGINX] *******************************************************************************************************
ok: [centos-lighthouse]

TASK [NGINX | Create general config] ***********************************************************************************************
ok: [centos-lighthouse]

PLAY RECAP *************************************************************************************************************************
centos-lighthouse          : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

### Результат выполнения playbook vector.yml

```
PLAY [Install Vector] **************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************
ok: [centos-vector]

TASK [Vector | create directory 4install] ******************************************************************************************
ok: [centos-vector]

TASK [Vector | get archive] ********************************************************************************************************
ok: [centos-vector]

TASK [Vector | unarchive] **********************************************************************************************************
ok: [centos-vector]

TASK [Vector | Create group] *******************************************************************************************************
ok: [centos-vector]

TASK [Vector | create user] ********************************************************************************************************
ok: [centos-vector]

TASK [Vector | copy bin file] ******************************************************************************************************
ok: [centos-vector]

TASK [Vector | create dir on etc] **************************************************************************************************
ok: [centos-vector]

TASK [Vector | copy conf] **********************************************************************************************************
ok: [centos-vector]

TASK [Vector | create dir on lib] **************************************************************************************************
ok: [centos-vector]

TASK [Vector | copy service file] **************************************************************************************************
ok: [centos-vector]

TASK [Vector | Start service] ******************************************************************************************************
ok: [centos-vector]

PLAY RECAP *************************************************************************************************************************
centos-vector              : ok=12   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```