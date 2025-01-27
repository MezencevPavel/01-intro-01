 Домашнее задание к занятию «Микросервисы: масштабирование»

Вы работаете в крупной компании, которая строит систему на основе микросервисной архитектуры.
Вам как DevOps-специалисту необходимо выдвинуть предложение по организации инфраструктуры для разработки и эксплуатации.

## Задача 1: Кластеризация

Предложите решение для обеспечения развёртывания, запуска и управления приложениями.
Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:
- поддержка контейнеров;
- обеспечивать обнаружение сервисов и маршрутизацию запросов;
- обеспечивать возможность горизонтального масштабирования;
- обеспечивать возможность автоматического масштабирования;
- обеспечивать явное разделение ресурсов, доступных извне и внутри системы;
- обеспечивать возможность конфигурировать приложения с помощью переменных среды, в том числе с возможностью безопасного хранения чувствительных данных таких как пароли, ключи доступа, ключи шифрования и т. п.

Обоснуйте свой выбор.

## Решение 1: 

Для обеспечения развертывания, запуска и управления приложениями можно использовать следующее решение:

- **Kubernetes** - это платформа для автоматизации развертывания, масштабирования и управления контейнеризированными приложениями.
- **NGINX** - это популярный веб-сервер и прокси-сервер, который часто используется для обеспечения обнаружения сервисов и маршрутизации запросов
- **Istio** - это открытая платформа для управления микросервисами, которая обеспечивает обнаружение сервисов, маршрутизацию запросов, безопасность и мониторинг.
- **Prometheus** и **Grafana** - это инструменты для мониторинга и визуализации метрик, которые помогают отслеживать производительность и нагрузку на систему.
- **Vault** - это инструмент для безопасного хранения и управления секретами, такими как пароли, ключи доступа, ключи шифрования и т.д.

Обоснование выбора:

- **Kubernetes** предоставляет мощные средства для управления контейнерами, включая горизонтальное масштабирование, автоматическое масштабирование, разделение ресурсов и конфигурирование приложений с помощью переменных среды.
- **NGINX** имеет высокую производительность и масштабируемость, что делает его подходящим для обработки большого количества запросов.
- **Istio** обеспечивает обнаружение сервисов и маршрутизацию запросов, а также обеспечивает безопасность и мониторинг микросервисов.
- **Prometheus** и **Grafana** предоставляют средства для мониторинга и визуализации метрик, что позволяет отслеживать производительность и нагрузку на систему.
- **Vault** обеспечивает безопасное хранение и управление секретами, что позволяет хранить чувствительные данные в защищенном виде.

|     Требование     |     Решение     |      Аналоги      |
|--------------------|-----------------|-------------------|
| Поддержка контейнеров  | Kubernetes  | Docker Swarm, Apache Mesos, Amazon ECS  |
| Обнаружение сервисов и маршрутизация запросов  | NGINX   | Kubernetes (kube-dns, Ingress), Consul, Envoy   |
| Горизонтальное масштабирование  | Kubernetes  | Docker Swarm, Apache Mesos, Amazon ECS  |
| Автоматическое масштабирование  | Kubernetes  | Amazon EC2 Auto Scaling, Azure Virtual Machine Scale Sets, Google Cloud Autoscaling  |
| Явное разделение ресурсов  | Kubernetes  | Calico, Cilium, Romana  |
| Конфигурирование приложений с помощью переменных среды  | Kubernetes, Vault  | Consul, AWS Secrets Manager, Azure Key Vault, Google Cloud KMS  |
| Безопасное хранение чувствительных данных  | Vault  |  Consul, AWS Secrets Manage  |
| Мониторинг и визуализация метрик  | Prometheus, Grafana  | Kibana, Chronograf, Datadog  |
