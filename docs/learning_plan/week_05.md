# Week 5

## Main goal
Window functions until automatic + start refactoring duplicated code.

## Sunday — Git deep dive
Git repo already exists. Goal: go beyond add/commit/push.

Practice these workflows:
- Branching: create a feature branch, work on it, merge back to main
  - `git checkout -b feature/refactor-pipeline` → work → commit → `git checkout main` → `git merge feature/refactor-pipeline`
- See the difference: `git diff`, `git diff --staged`, `git log --oneline --graph`
- Undo mistakes: `git stash` (save work temporarily), `git reset HEAD~1` (undo last commit, keep changes)
- `.gitignore` review: make sure .env, __pycache__, .pytest_cache are excluded
- Write meaningful commit messages: what changed and why, not just "update"

Key concepts to understand:
- Working directory → staging area → commit (the three states)
- What HEAD means
- Difference between merge and rebase (know it conceptually, use merge for now)
- When and why to use branches

Use this week's refactoring tasks to practice: one branch per task, merge when done.

## Tuesday — Python refactoring
- Both pipelines (sales, cafe) are copy-paste with different column names
- Extract the common pattern: one generic pipeline that takes config (file path, table name, column list, cleaning rules)
- Start with extract and load — they are nearly identical
- Goal: run both pipelines through one shared code path

## Wednesday — Window functions deep practice
Write `sql/practice/window_functions.sql` with 10 queries on cafe_sales data:
- ROW_NUMBER: top-N per group (top 2 drinks per branch)
- RANK vs DENSE_RANK: what happens with ties
- LAG / LEAD: previous and next row comparisons
- SUM / AVG / COUNT as window functions (running, per-partition)
- NTILE: split data into buckets
- Practice different PARTITION BY + ORDER BY combinations

Key focus: always ask "what does PARTITION BY define? what does ORDER BY define?"

## Thursday — Python refactoring continued
- Refactor transform: extract cleaning rules into small functions
- Handle edge cases: empty CSV, missing columns
- Add tests for edge cases

## Definition of done
- 10 window function queries exist and run
- At least extract + load are shared between pipelines
- Edge case tests exist
