# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Обязательные задания

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/monitor_logs/02/png/01.png)

## Задание 2

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
`100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)`
- CPULA 1/5/15;
`avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100`
`avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100`
`avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[15m])) * 100`
- количество свободной оперативной памяти;
`node_memory_MemFree_bytes`
- количество места на файловой системе.
`node_filesystem_free_bytes`

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/monitor_logs/02/png/02.png)

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

![markdown img](https://github.com/MezencevPavel/devops-netology/blob/main/monitor_logs/02/png/03.png)

## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

(https://github.com/MezencevPavel/devops-netology/blob/main/monitor_logs/02/grafana.json)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
