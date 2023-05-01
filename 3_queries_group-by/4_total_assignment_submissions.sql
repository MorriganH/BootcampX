SELECT cohorts.name AS cohort, COUNT(*) AS total_submissions
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.id
ORDER BY total_submissions DESC;