-- �� ���� ������ ����.

select * from employees;
select (sum(salary)) from EMPLOYEES group by rollup(department_id, job_id);

select * from SYS.DBA_TABLES WHERE OWNER = 'HMART';
SELECT * FROM TAB;
SELECT * FROM SYS.DBA_TAB_COLUMNS WHERE OWNER = 'HMART' AND TABLE_NAME = '��';
DESCRIBE HMART.��;

-- SYS.DBA_USERS; SYS.DBA_TABLES; SYS.DBA_TAB_COLUMNS;

SELECT DISTINCT SALARY FROM(SELECT * FROM HR.EMPLOYEES ORDER BY SALARY DESC) WHERE ROWNUM <= 3;

SELECT * FROM BIGDATA SAMPLE(0.02) ORDER BY "Emp ID" asc;

select �ֹ���, �ֹ���ǰ, sum(����)
from �ֹ�
group by cube(�ֹ���, �ֹ���ǰ);

with ���ż���(��ID, �ֹ�����) as (select �ֹ���, sum(����) from �ֹ� group by �ֹ���)
select * from ���ż��� order by �ֹ����� desc;

with ����(��ID, �ֹ���) as (Select �ֹ���, sum(����) from �ֹ� group by �ֹ���), ����(�κ���) as (select sum(�ֹ���) from ����), ����(���) as (select �κ��� / count(select * from �ֹ�) from ����)
select * from ����;

select * from employees;

with ����CTE(employee_id, job_id, department_id, manager_id, position_level) 
as 
(
(select employee_id, job_id, department_id, manager_id, 0 from employees where manager_id is null) 
union all
(select employees.employee_id, employees.job_id, employees.department_id, employees.manager_id, ����CTE.position_level + 1 from employees, ����CTE where employees.manager_id = ����CTE.employee_id)
)
select * from ����CTE;
