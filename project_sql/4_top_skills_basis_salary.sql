SELECT sd.skills,
  ROUND(AVG(salary_year_avg), 2) as avg_salary
FROM job_postings_fact as j
  INNER JOIN skills_job_dim as s on s.job_id = j.job_id
  INNER JOIN skills_dim as sd on sd.skill_id = s.skill_id
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg is NOT NULL
GROUP BY sd.skills
ORDER BY avg_salary DESC
LIMIT 25
  /*
   
   Key Insights:
   Top Skill by Salary:
   
   svn stands out with a massive salary average of $400,000, which is far above the others.
   
   This may be an outlier or due to very few postings — worth validating if data size is small.
   
   Emerging High-Tech Skills:
   
   solidity ($179k) and golang ($155k) are among the top, indicating that blockchain and modern backend development skills are highly valued even for analysts with hybrid roles.
   
   AI/ML-Focused Skills:
   
   mxnet, keras, pytorch, tensorflow, and hugging face are all ML/deep learning libraries.
   
   These suggest a rising demand for data analysts with machine learning capabilities.
   
   Cloud & DevOps Tools:
   
   terraform, vmware, ansible, gitlab, puppet, bitbucket are all related to infrastructure automation and cloud environments, indicating a DevOps + Data convergence.
   
   Data Engineering/ETL Tools:
   
   kafka, airflow, cassandra, scala are prominent — shows high-paying jobs are demanding analysts who understand pipelines and streaming systems.
   
   Data-Specific Skills:
   
   dplyr (R), notion, and couchbase show that even niche data wrangling tools or knowledge of specific NoSQL databases can command a premium.
   
   */