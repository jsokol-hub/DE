# Week 13 — Airflow Fundamentals

## Цель
Освоить базовые концепции оркестрации и запустить первый DAG.

## Теория
- Что такое оркестратор и зачем он нужен
- Airflow vs Prefect vs Dagster — краткое сравнение
- Основные концепции Airflow:
  - DAG (Directed Acyclic Graph)
  - Task, Operator
  - Schedule, Trigger
  - XCom (передача данных между тасками)
  - Connections и Variables

## Практика

### Задание 1: Установка Airflow
- Установить Airflow локально (standalone mode или через pip)
- Запустить webserver и scheduler
- Зайти в UI и изучить интерфейс

### Задание 2: Первый DAG
Создать простой DAG с 3 тасками:
```
extract >> transform >> load
```
Каждый таск — PythonOperator с print-логом.

### Задание 3: Оркестрация существующего пайплайна
- Обернуть `src/pipelines/run.py cafe` в BashOperator
- Настроить schedule (например, ежедневно)
- Добавить retry и timeout

### Задание 4: Документация
Записать в `docs/theory/orchestration.md`:
- Зачем нужен оркестратор
- Основные компоненты Airflow
- Когда использовать Airflow vs cron

## Результат недели
- [ ] Airflow установлен и работает
- [ ] Первый DAG успешно выполняется
- [ ] Существующий pipeline оркестрирован
- [ ] Теоретические заметки готовы
