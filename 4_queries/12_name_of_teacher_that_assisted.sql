SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
  FROM teachers
  LEFT JOIN assistance_requests ON teachers.id = teacher_id
  LEFT JOIN students ON students.id = student_id
  LEFT JOIN cohorts ON cohorts.id = cohort_id
 WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;