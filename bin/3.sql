CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarActivitatsMesReservades`()
BEGIN
select _activitats,_aforament,_count from(
select activitats.nom as _activitats, (100-((100/sales.aforament)* count(registrencolect.id_activitat))) as _aforament, count(registrencolect.id_activitat) as _count from registrencolect, clients, sales,activitats 
where clients.dni = registrencolect.dni and registrencolect.id_activitat = activitats.id
and sales.id = activitats.id_sala and registrencolect.data_act = (curdate()) group by activitats.id 
union
select activitats.nom as _activitats, (100-((100/sales.aforament)* count(registrenindv.id_activitat))) as _aforament, count(registrenindv.id_activitat) as _count  from registrenindv, clients, sales,activitats
where clients.dni = registrenindv.dni and registrenindv.id_activitat = activitats.id
and sales.id = activitats.id_sala and registrenindv.data_act = (curdate()) group by activitats.id) a
order by _count desc
;
END