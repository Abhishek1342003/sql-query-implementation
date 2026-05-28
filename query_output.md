# Query Outputs and Validation

## Query 1

### Purpose
List all active students.

### Sample Output

| student_id | name | email |
|------------|------|--------|
| 101 | Rahul | rahul@gmail.com |

### Validation Note
Only students with status 'Active' are displayed.

---

## Query 2

### Purpose
Find invalid emails.

### Validation Note
Records with NULL emails or missing '@' are correctly detected.

---

## Query 3

### Purpose
Easy and Medium problems.

### Validation Note
Hard problems are excluded.

---

## Query 4

### Purpose
Latest 20 submissions.

### Validation Note
Rows are sorted in descending order of submission time.

---

## Query 5

### Purpose
Unsuccessful submissions.

### Validation Note
Successful submissions are excluded.

---

## Query 6

### Purpose
Submission details using JOIN.

### Validation Note
Student and problem information correctly matches submission IDs.

---

## Query 7

### Purpose
Students and enrollments using LEFT JOIN.

### Validation Note
Students without enrollment are still displayed.

---

## Query 8

### Purpose
Course-wise student count.

### Validation Note
Courses with no students show count as 0.

---

## Query 9

### Purpose
Test case result details.

### Validation Note
Submission records correctly map with test results.

---

## Query 10

### Purpose
Students enrolled but inactive.

### Validation Note
Students without submissions are correctly filtered.

---

## Query 11

### Purpose
Submission count by status.

### Validation Note
Counts match database records.

---

## Query 12

### Purpose
Average score per problem.

### Validation Note
Average is correctly calculated from all submissions.

---

## Query 13

### Purpose
Students with high submissions.

### Validation Note
HAVING clause filters grouped results correctly.

---

## Query 14

### Purpose
Low success rate problems.

### Validation Note
Problems with mostly failed submissions are included.

---

## Query 15

### Purpose
Top attempted problems.

### Validation Note
Results are ordered by attempts descending.

---

## Query 16

### Purpose
Above-average students.

### Validation Note
Subquery correctly calculates global average.

---

## Query 17

### Purpose
Problems never attempted.

### Validation Note
Problem IDs do not exist in submissions table.

---

## Query 18

### Purpose
Enrolled but no submissions.

### Validation Note
Students exist in enrollments but not in submissions.

---

## Query 19

### Purpose
Students using Python and Java.

### Validation Note
COUNT(DISTINCT language) confirms both languages used.

---

## Query 20

### Purpose
Second highest score.

### Validation Note
Highest score excluded before MAX calculation.
