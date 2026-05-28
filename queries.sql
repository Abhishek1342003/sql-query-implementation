-- 1. List all active students with student ID, name, email, batch, and admission date
SELECT student_id, name, email, batch, admission_date
FROM students
WHERE status = 'active';

-- 2. Find students whose email is missing or appears invalid
SELECT student_id, name, email
FROM students
WHERE email IS NULL
   OR email NOT LIKE '%_@_%._%';

-- 3. List all problems with difficulty level Easy or Medium
SELECT problem_id, title, difficulty
FROM problems
WHERE difficulty IN ('Easy', 'Medium');

-- 4. Display the latest 20 submissions based on submission timestamp
SELECT submission_id, student_id, problem_id, language, status, score, submitted_at
FROM submissions
ORDER BY submitted_at DESC
LIMIT 20;

-- 5. Find submissions where the status is not successful
SELECT submission_id, student_id, problem_id, language, status, score, submitted_at
FROM submissions
WHERE status <> 'successful';

-- 6. Display each submission with student name, problem title, language, status, score, and submitted time
SELECT s.submission_id, st.name AS student_name, p.title AS problem_title,
       s.language, s.status, s.score, s.submitted_at
FROM submissions s
JOIN students st ON s.student_id = st.student_id
JOIN problems p ON s.problem_id = p.problem_id;

-- 7. Display all students and their enrollments, including students who are not enrolled in any course
SELECT st.student_id, st.name, e.course_id
FROM students st
LEFT JOIN enrollments e ON st.student_id = e.student_id;

-- 8. Display all courses with the number of enrolled students
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 9. Display test-case results for each submission, including problem title and student name
SELECT s.submission_id, st.name AS student_name, p.title AS problem_title,
       t.test_case_id, t.result
FROM test_case_results t
JOIN submissions s ON t.submission_id = s.submission_id
JOIN students st ON s.student_id = st.student_id
JOIN problems p ON s.problem_id = p.problem_id;

-- 10. Find students who are enrolled in a course but have not submitted any solution for that course
SELECT DISTINCT st.student_id, st.name
FROM students st
JOIN enrollments e ON st.student_id = e.student_id
LEFT JOIN submissions s ON st.student_id = s.student_id
LEFT JOIN problems p ON s.problem_id = p.problem_id
LEFT JOIN course_problems cp ON p.problem_id = cp.problem_id AND e.course_id = cp.course_id
WHERE cp.problem_id IS NULL;

-- 11. Count submissions by status
SELECT status, COUNT(*) AS submission_count
FROM submissions
GROUP BY status;

-- 12. Calculate average score per problem
SELECT p.problem_id, p.title, AVG(s.score) AS avg_score
FROM problems p
LEFT JOIN submissions s ON p.problem_id = s.problem_id
GROUP BY p.problem_id, p.title;

-- 13. Find students with more than a chosen number of submissions
SELECT st.student_id, st.name, COUNT(s.submission_id) AS submission_count
FROM students st
JOIN submissions s ON st.student_id = s.student_id
GROUP BY st.student_id, st.name
HAVING COUNT(s.submission_id) > 10;

-- 14. Find problems where the success rate is below 40%
SELECT p.problem_id, p.title,
       SUM(CASE WHEN s.status = 'successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.submission_id) AS success_rate
FROM problems p
JOIN submissions s ON p.problem_id = s.problem_id
GROUP BY p.problem_id, p.title
HAVING SUM(CASE WHEN s.status = 'successful' THEN 1 ELSE 0 END) * 100.0 / COUNT(s.submission_id) < 40;

-- 15. Find the top 10 most attempted problems
SELECT p.problem_id, p.title, COUNT(s.submission_id) AS attempts
FROM problems p
JOIN submissions s ON p.problem_id = s.problem_id
GROUP BY p.problem_id, p.title
ORDER BY attempts DESC
LIMIT 10;

-- 16. Find students whose average score is greater than the overall average score
SELECT st.student_id, st.name, AVG(s.score) AS avg_score
FROM students st
JOIN submissions s ON st.student_id = s.student_id
GROUP BY st.student_id, st.name
HAVING AVG(s.score) > (SELECT AVG(score) FROM submissions);

-- 17. Find problems that have never been attempted
SELECT p.problem_id, p.title
FROM problems p
LEFT JOIN submissions s ON p.problem_id = s.problem_id
WHERE s.submission_id IS NULL;

-- 18. Find students who have enrolled but never submitted any solution
SELECT st.student_id, st.name
FROM students st
JOIN enrollments e ON st.student_id = e.student_id
LEFT JOIN submissions s ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

-- 19. Find students who submitted solutions in both Python and Java
SELECT st.student_id, st.name
FROM students st
JOIN submissions s ON st.student_id = s.student_id
WHERE s.language IN ('Python', 'Java')
GROUP BY st.student_id, st.name
HAVING COUNT(DISTINCT s.language) = 2;

-- 20. Find the second-highest score for a selected problem
SELECT MAX(score) AS second_highest_score
FROM submissions
WHERE problem_id = 1
  AND score < (
      SELECT MAX(score)
      FROM submissions
      WHERE problem_id = 1
  );
