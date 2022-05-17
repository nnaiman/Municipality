create view teachtax as
(
select *
from teacher s
where s.id in (select perid from taxes group by perid having count(*) > 3))