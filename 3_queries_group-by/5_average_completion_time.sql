SELECT students.name AS student, AVG(duration) AS average_assignment_duration
  FROM assignment_submissions
  JOIN students ON students.id = student_id
 WHERE students.end_date IS null
GROUP BY students.name
ORDER BY average_assignment_duration DESC;