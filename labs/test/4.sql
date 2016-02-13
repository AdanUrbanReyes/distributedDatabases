delimiter $
create procedure q1(in sale int)
begin
select * from sales where SALES=sale;
end $
delimiter ;



delimiter #
create procedure q1(in noe varchar(6))
begin
select e.firstnme, p.projname
from employee e, project p, empprojact ep
where e.empno=noe
and e.empno=ep.empno
and ep.projno=p.projno;
end #
delimiter ;



delimiter #
create procedure q2(in mes char(5))
begin
select e.firstnme, e.birthdate,e.salary
from employee e, empprojac ep, act a
where e.birthdate like concat(mes,'%')
and e.empno=ep.empno
and ep.actno=a.actno;
end #
delimiter ;



delimiter #
create procedure q3(in nod varchar(3))
begin
select d.deptno, d.deptname,e.firstnme
from department d, employee e
where d.deptno=nod
and d.mgrno=e.empno;
end #
delimiter ;


delimiter #
create procedure q4(in nacimiento char(7))
begin
select e.firstnme,e.salary,p.projname
from employee e, project p, empprojact ep
where e.birthdate like concat(nacimiento,'%')
and e.empno=ep.empno
and ep.projno=p.projno;
end #
delimiter ;



delimiter #
create procedure q5(in idp varchar(6))
begin
select p.projname, e.firstnme,d.deptname
from project p, employee e, department d
where p.projno=idp
and p.respemp=e.empno
and e.workdept=d.deptno;
end #
delimiter ;


delimiter #
create procedure q6(in idd varchar(6))
begin
select d.deptname,
from
where
end #
delimiter ;



