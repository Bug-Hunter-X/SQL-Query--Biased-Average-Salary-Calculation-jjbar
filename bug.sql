The following SQL query attempts to calculate the average salary of employees, but it contains a common error that leads to incorrect results:

```sql
SELECT AVG(salary) AS average_salary
FROM employees
WHERE department = 'Sales' AND salary > 100000;
```

**Error:** The `WHERE` clause filters out rows that don't meet both conditions (`department = 'Sales'` and `salary > 100000`). This can lead to a biased average, excluding employees from 'Sales' who earn less than 100000.  The average calculation will only be performed on a subset of the data, distorting the result.

**Correct SQL:** The query should either use `OR` instead of `AND` if you want to include employees from the 'Sales' department who might earn below 100000, or separate queries to get average salaries for the department with additional criteria.
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