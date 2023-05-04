const {  Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
LEFT JOIN assistance_requests ON teachers.id = teacher_id
LEFT JOIN students ON students.id = student_id
LEFT JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = $1
ORDER BY teachers.name;`

const cohortName = process.argv[2];
const values = [`${cohortName}`];

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(teachObj => {
      console.log(`${teachObj.cohort}: ${teachObj.teacher}`);
    })
  })
  .catch(err => console.error('query error', err.stack));