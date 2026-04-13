# Week 16 — Streaming Pipeline & Portfolio Finish

## Цель
Построить полный streaming pipeline и подготовить портфолио.

## Практика

### Задание 1: Consumer → PostgreSQL
Доработать consumer:
- Валидация входящих сообщений
- Запись в `staging.cafe_sales_stream` (новая таблица)
- Обработка ошибок и retry
- Graceful shutdown

### Задание 2: Batch + Stream архитектура
Документировать Lambda/Kappa архитектуру:
- Batch path: CSV → Python ETL → staging → dbt → marts
- Stream path: Kafka → Consumer → staging_stream
- Как они дополняют друг друга

### Задание 3: Airflow + Kafka мониторинг
- DAG для проверки lag consumer group
- Алерт если lag превышает порог

### Задание 4: Portfolio Review
Обновить README.md:
- Архитектурная диаграмма (batch + stream)
- Описание технологий
- Инструкция по запуску
- Что демонстрирует проект

### Задание 5: Interview Prep
Подготовить ответы на типичные вопросы:
- Расскажи про свой проект
- Почему выбрал такую архитектуру?
- Как бы масштабировал?
- Что бы улучшил?

## Результат недели
- [ ] Streaming pipeline записывает в PostgreSQL
- [ ] Документация по архитектуре
- [ ] README обновлен
- [ ] Готовность к собеседованию

## Phase 4 Complete Checklist
- [ ] Airflow: DAGs, scheduling, error handling
- [ ] Kafka: producer, consumer, topics
- [ ] Integration: ETL + dbt + streaming
- [ ] Portfolio: документация, диаграммы, README
