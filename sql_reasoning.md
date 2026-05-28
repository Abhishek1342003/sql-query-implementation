# SQL Reasoning Answers

## 1. LEFT JOIN vs INNER JOIN

Query Used:
Students and Enrollments

LEFT JOIN is used because all students should appear even if they are not enrolled in any course.

INNER JOIN would remove students without enrollments.

---

## 2. HAVING vs WHERE

Query Used:
Students with More than 10 Submissions

HAVING is required because filtering happens after grouping.

Example:

```sql
HAVING COUNT(submission_id) > 10
```

WHERE cannot filter aggregate values.

---

## 3. Use of Subquery

Query Used:
Students Above Average Score

The subquery calculates overall average score.

Outer query compares each student's average against it.

---

## 4. Duplicate Record Problem

Query Used:
Course Student Count

Duplicate enrollments can increase counts incorrectly.

Solution:

```sql
COUNT(DISTINCT student_id)
```

---

## 5. Edge Case Considered

Query Used:
Invalid Email Detection

Handled:
- NULL values
- Incorrect email formats

Example:

```sql
WHERE email IS NULL
OR email NOT LIKE '%@%.%'
```
