# Week 14 — Airflow + dbt Integration

## Цель
Научиться оркестрировать dbt через Airflow и строить сложные DAG-и.

## Теория
- Паттерны интеграции dbt с Airflow:
  - BashOperator (`dbt run`, `dbt test`)
  - dbt Cloud API
  - cosmos (dbt-core + Airflow)
- Task dependencies и branching
- Sensors (ожидание внешних событий)
- Task Groups (организация сложных DAG-ов)

## Практика

### Задание 1: DAG для dbt
Создать DAG с последовательностью:
```
dbt_run_staging >> dbt_run_marts >> dbt_test >> notify_success
```

### Задание 2: Добавить ETL перед dbt
Расширить DAG:
```
extract_data >> load_to_staging >> dbt_run >> dbt_test
```
Использовать TaskGroup для группировки dbt-тасков.

### Задание 3: Обработка ошибок
- Добавить on_failure_callback
- Настроить email/slack алерты (или просто логирование)
- Добавить sensor для проверки наличия исходного файла

### Задание 4: Практика с XCom
- Передать количество загруженных строк между тасками
- Использовать это значение в условном branching

## Результат недели
- [ ] DAG с полным ETL + dbt циклом
- [ ] Task Groups для организации
- [ ] Обработка ошибок настроена
- [ ] XCom используется для передачи данных
