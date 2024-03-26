select * from employees;
select (sum(salary)) from EMPLOYEES group by rollup(department_id, job_id);

select * from SYS.DBA_TABLES WHERE OWNER = 'HMART';
SELECT * FROM TAB;
SELECT * FROM SYS.DBA_TAB_COLUMNS WHERE OWNER = 'HMART' AND TABLE_NAME = '고객';
DESCRIBE HMART.고객;

-- SYS.DBA_USERS; SYS.DBA_TABLES; SYS.DBA_TAB_COLUMNS;

SELECT DISTINCT SALARY FROM(SELECT * FROM HR.EMPLOYEES ORDER BY SALARY DESC) WHERE ROWNUM <= 3;

SELECT * FROM BIGDATA SAMPLE(0.02) ORDER BY "Emp ID" asc;

select 주문고객, 주문제품, sum(수량)
from 주문
group by cube(주문고객, 주문제품);

with 구매수량(고객ID, 주문수량) as (select 주문고객, sum(수량) from 주문 group by 주문고객)
select * from 구매수량 order by 주문수량 desc;

with 일차(고객ID, 주문량) as (Select 주문고객, sum(수량) from 주문 group by 주문고객), 이차(부분합) as (select sum(주문량) from 일차), 삼차(평균) as (select 부분합 / count(select * from 주문) from 이차)
select * from 삼차;

select * from employees;

with 직원CTE(employee_id, job_id, department_id, manager_id, position_level) 
as 
(
(select employee_id, job_id, department_id, manager_id, 0 from employees where manager_id is null) 
union all
(select employees.employee_id, employees.job_id, employees.department_id, employees.manager_id, 직원CTE.position_level + 1 from employees, 직원CTE where employees.manager_id = 직원CTE.employee_id)
)
select * from 직원CTE;
