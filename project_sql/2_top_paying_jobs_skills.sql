WITH cte as (
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
)
SELECT cte.job_id,
  cte.job_title,
  cte.company_name,
  sd.skills
from cte
  INNER JOIN skills_job_dim as s on s.job_id = cte.job_id
  INNER JOIN skills_dim as sd on sd.skill_id = s.skill_id
  /*
   
   🔝 Top 10 In-Demand Skills for Data Analyst / High-Paying Jobs
   Skill	Count
   SQL	8
   Python	7
   Tableau	6
   R	4
   Snowflake	3
   Pandas	3
   Excel	3
   Azure	2
   Bitbucket	2
   Go	2
   
   🧠 Insight:
   
   Core skills like SQL, Python, and Tableau are consistently required.
   
   Even tools like Excel and R still hold importance in some jobs.
   
   */