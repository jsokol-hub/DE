# Week 15 — Kafka Fundamentals

## Цель
Понять streaming-парадигму и запустить первый Kafka pipeline.

## Теория
- Batch vs Streaming: когда что использовать
- Event-driven architecture
- Kafka core concepts:
  - Broker, Topic, Partition
  - Producer, Consumer, Consumer Group
  - Offset, Commit
  - Retention и compaction
- Kafka vs RabbitMQ vs Pulsar — краткое сравнение
- Exactly-once vs at-least-once semantics

## Практика

### Задание 1: Установка Kafka
- Запустить Kafka локально (через docker-compose или Confluent)
- Создать topic `cafe-orders`
- Проверить через kafka-console-producer/consumer

### Задание 2: Python Producer
Написать скрипт, который:
- Читает данные из CSV
- Отправляет каждую строку как JSON в Kafka topic
- Добавляет искусственную задержку (имитация real-time)

### Задание 3: Python Consumer
Написать consumer, который:
- Читает сообщения из topic
- Парсит JSON
- Выводит в лог (пока без записи в БД)

### Задание 4: Документация
Записать в `docs/theory/streaming.md`:
- Batch vs Streaming: отличия и use cases
- Основные компоненты Kafka
- Consumer Groups и партиционирование

## Результат недели
- [ ] Kafka запущен локально
- [ ] Producer отправляет сообщения
- [ ] Consumer читает и логирует
- [ ] Теоретические заметки готовы
