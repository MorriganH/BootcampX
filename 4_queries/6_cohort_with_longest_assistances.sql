SELECT x.name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time
  FROM cohorts x
  JOIN students ON x.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
GROUP BY x.name
ORDER BY average_assistance_time DESC LIMIT 1;