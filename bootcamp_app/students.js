const {  Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const input = process.argv.slice(2);

pool.query(`
SELECT students.id, students.name AS student, cohorts.name AS cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '${input[0]}%'
LIMIT ${input[1] || 5};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    })
  })
  .catch(err => console.error('query error', err.stack));