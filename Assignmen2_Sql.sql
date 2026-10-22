SELECT first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE first_name = 'Rodney'
      AND last_name = 'Weaver'
);


-------------


SELECT
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;

-------------

SELECT first_name, last_name, salary
FROM employees
WHERE salary > 8700;

-------------

SELECT
    employees.first_name,
    employees.last_name
FROM employees
JOIN departments
    ON employees.emp_id = departments.emp_id
WHERE departments.dept_name = 'Operations';

-------------

SELECT
    employees.first_name,
    employees.last_name
FROM employees
JOIN departments
    ON employees.emp_id = departments.emp_id
WHERE departments.dept_name = 'Technology';

-------------

SELECT AVG(salary) AS average_female_salary
FROM employees
WHERE gender = 'Female';

-------------

SELECT
    departments.dept_name,
    AVG(employees.salary) AS average_salary
FROM employees
JOIN departments
    ON employees.emp_id = departments.emp_id
GROUP BY departments.dept_name;

-------------

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = (SELECT MIN(hire_date) FROM employees)
   OR hire_date = (SELECT MAX(hire_date) FROM employees);

-------------

SELECT
    employees.hire_date,
    departments.dept_name
FROM employees
JOIN departments
    ON employees.emp_id = departments.emp_id
WHERE employees.salary = (
    SELECT MAX(salary)
    FROM employees
);

-------------

SELECT
    employees.hire_date,
    departments.dept_name
FROM employees
JOIN departments
    ON employees.emp_id = departments.emp_id
WHERE employees.salary = (
    SELECT MIN(salary)
    FROM employees
);



