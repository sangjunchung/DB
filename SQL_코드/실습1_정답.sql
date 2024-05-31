-- 실습2
SELECT
    emp_name,
    dept_code
FROM
    employee
WHERE
    dept_code != 'D5';

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    salary < 3000000;

SELECT
    emp_name,
    job_code
FROM
    employee
WHERE
    job_code != 'J3';

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus != 0.1;

SELECT
    emp_name,
    manager_id
FROM
    employee
WHERE
    manager_id != 200;

SELECT
    emp_name,
    email
FROM
    employee
WHERE
    email IS NULL;

SELECT
    emp_name,
    phone
FROM
    employee
WHERE
    phone IS NULL;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus IS NULL;

SELECT
    emp_name,
    manager_id
FROM
    employee
WHERE
    manager_id IS NULL;

SELECT
    emp_name,
    ent_date
FROM
    employee
WHERE
    ent_date IS NULL;

SELECT
    emp_name,
    email
FROM
    employee
WHERE
    email IS NOT NULL;

SELECT
    emp_name,
    phone
FROM
    employee
WHERE
    phone IS NOT NULL;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus IS NOT NULL;

SELECT
    emp_name,
    manager_id
FROM
    employee
WHERE
    manager_id IS NOT NULL;

SELECT
    emp_name,
    ent_date
FROM
    employee
WHERE
    ent_date IS NOT NULL;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    salary BETWEEN 2000000 AND 3000000;

SELECT
    emp_name,
    hire_date
FROM
    employee
WHERE
    hire_date BETWEEN TO_DATE('2000-01-01', 'YYYY-MM-DD') AND TO_DATE('2010-12-31', 'YYYY-MM-DD');

SELECT
    emp_name,
    emp_id
FROM
    employee
WHERE
    emp_id BETWEEN 210 AND 220;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus BETWEEN 0.1 AND 0.3;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    sal_level BETWEEN 'S3' AND 'S5';

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    salary NOT BETWEEN 2000000 AND 3000000;

SELECT
    emp_name,
    hire_date
FROM
    employee
WHERE
    hire_date NOT BETWEEN TO_DATE('2000-01-01', 'YYYY-MM-DD') AND TO_DATE('2010-12-31', 'YYYY-MM-DD');

SELECT
    emp_name,
    emp_id
FROM
    employee
WHERE
    emp_id NOT BETWEEN 210 AND 220;

SELECT
    emp_name,
    bonus
FROM
    employee
WHERE
    bonus NOT BETWEEN 0.1 AND 0.3;

SELECT
    emp_name,
    salary
FROM
    employee
WHERE
    sal_level NOT BETWEEN 'S3' AND 'S5';