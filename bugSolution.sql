The corrected SQL queries are:

```sql
--Option 1: Include all 'Sales' department employees
SELECT AVG(salary) AS average_salary
FROM employees
WHERE department = 'Sales';

--Option 2: Include employees earning more than 100000
SELECT AVG(salary) AS average_salary
FROM employees
WHERE salary > 100000;

--Option 3: Separate average calculations for different conditions
SELECT AVG(CASE WHEN department = 'Sales' THEN salary END) AS avg_sales_salary,
       AVG(CASE WHEN salary > 100000 THEN salary END) AS avg_high_salary
FROM employees;
```

These solutions avoid the bias introduced by the incorrect use of `AND` in the original query. Option 1 calculates the average for the 'Sales' department regardless of salary. Option 2 calculates the average for all employees earning above 100000.  Option 3 provides separate averages for 'Sales' employees and those with salaries above 100000.