SELECT job_id,
  job_title,
  c.name as company_name,
  job_location,
  job_schedule_type,
  salary_year_avg,
  job_posted_date
FROM job_postings_fact
  LEFT JOIN company_dim as c on c.company_id = job_postings_fact.company_id
WHERE job_work_from_home = TRUE
  AND job_title_short = 'Data Analyst'
  AND salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10