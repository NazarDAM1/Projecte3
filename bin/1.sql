CREATE DEFINER=`root`@`localhost` PROCEDURE `altaClient`(in _dni text, in _nom text, in _cognom text, in _data_naix text, in _telefon text, in _correu text, in _IBAN text, in _login text,in _sexe text, in _comunicacio text)
BEGIN
DECLARE _last_id_historial INT;
insert into clients (dni,nom,cognom,data_naix,telefon,correu,IBAN,login,sexe,comunicacio) values (_dni,_nom,_cognom,_data_naix,_telefon,_correu,_IBAN,_login,_sexe,_comunicacio);
insert into historial value ();
select historial.id into _last_id_historial from historial order by id DESC LIMIT 1;
insert into alt_baix (id,dni,data_alta)value (_last_id_historial,_dni,(curdate()));
END