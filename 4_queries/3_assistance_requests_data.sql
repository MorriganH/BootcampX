SELECT teachers.name, students.name, assignments.name, (completed_at - started_at) AS duration
  FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  LEFT JOIN assignments ON assignments.id = assignment_id
ORDER BY (completed_at - started_at);