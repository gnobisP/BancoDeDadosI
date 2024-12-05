
-- 3
select E.first_name, E.last_name, D.Department_name
from aluno.EMPLOYEES E join aluno.DEPARTMENTS D
on E.Department_id = D.Department_id;

-- 4
select E.first_name, E.last_name, NULL AS Department_name
from aluno.EMPLOYEES E
where E.Department_ID is null 
union
select E.first_name, E.last_name, D.Department_name
from aluno.EMPLOYEES E join aluno.DEPARTMENTS D
on E.Department_id = D.Department_id;


--5
select E.first_name, E.last_name, H.JOB_ID, H.Start_date, H.End_date
from ALUNO.JOB_HISTORY H join aluno.EMPLOYEES E on 
H.EMPLOYEE_ID = E.EMPLOYEE_ID;

--6
select E.first_name, E.last_name, H.JOB_ID, J.JOB_TITLE, H.Start_date
from aluno.JOB_HISTORY H join aluno.EMPLOYEES E ON
H.EMPLOYEE_ID = E.EMPLOYEE_ID join JOBS J on J.JOB_ID = H.JOB_ID;

--7
select JOB_ID
from aluno.EMPLOYEES
where department_id in (select Department_ID
                        from aluno.DEPARTMENTS D       
                        where D.LOCATION_ID = (select LOCATION_ID
                                                                    from aluno.LOCATIONS
                                                                    where city = 'Seattle'));

--8
select E.JOB_ID
from aluno.EMPLOYEES E
join aluno.DEPARTMENTS D
  on E.DEPARTMENT_ID = D.DEPARTMENT_ID
join aluno.LOCATIONS L
  on D.LOCATION_ID = L.LOCATION_ID
where L.city = 'Seattle';
