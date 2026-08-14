CREATE OR REPLACE VIEW hr_analytics.vw_dashboard_employees AS
SELECT
  -- hidden key only
  employee_id,                      

  -- Segmentation (Page 1 & 2)
  department,
  job_level,
  work_mode,
  gender,
  marital_status,
  education_level,
  CASE
    WHEN age < 30 THEN '20-29'
    WHEN age < 40 THEN '30-39'
    WHEN age < 50 THEN '40-49'
    ELSE '50+'
  END AS age_group,
  CASE
    WHEN years_at_company < 2 THEN '0-2 yrs'
    WHEN years_at_company < 5 THEN '2-5 yrs'
    WHEN years_at_company < 10 THEN '5-10 yrs'
    ELSE '10+ yrs'
  END AS tenure_band,

  -- Sentiment & Wellbeing (Page 3)
  burnout_score,
  engagement_score,
  work_life_balance_score,
  manager_support_score,
  overtime_hours_per_week,

  -- Compensation & Career Growth (Page 4)
  monthly_income,
  stock_option_level,
  salary_hike_pct,
  years_since_promotion,
  performance_rating,

  -- AI Adoption & Perceived Risk (Page 5)
  uses_ai_tools_at_work,
  perceived_ai_job_risk,

  -- Target variable, used everywhere
  attrition

FROM hr_analytics.raw_employees;