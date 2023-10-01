# site.yml

Playbook для установки vector, lighthouse и clickhouse.  
  
Хосты указаны в инвентаре /inventory  
  
В requiremets.yml указаны репозитории с ролями для установки  
  
```
---
- src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
  scm: git
  version: "1.13"
  name: clickhouse
- src: git@github.com:MezencevPavel/vector_role.git
  scm: git
  version: "1.13"
  name: vector
- src: git@github.com:MezencevPavel/lighthouse_role.git
  scm: git
  version: "1.13"
  name: lighthouse

```

