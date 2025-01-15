select m.itemName as MenuName
from Menu m
where m.menuId in (
select om.menuId 
from Menu m
join OrderMenu om
on m.menuId = om.menuId
group by om.menuId
having count(*) > 1
);