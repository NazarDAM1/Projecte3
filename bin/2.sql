CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaClientsMesReserves`()
BEGIN
SELECT clients.*,count(registrencolect.dni) + (Select count(registrenindv.dni) from registrenindv where registrenindv.dni = clients.dni)as _suma FROM registrencolect, clients where registrencolect.dni = clients.dni group by registrencolect.dni order by count(registrencolect.dni) desc;

END