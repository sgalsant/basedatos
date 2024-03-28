\connect bdcines;

create view cines.entradas_ex as
SELECT
	c.nombre as cine,
	f.fecha_hora as fecha_hora,
	s.nombre as sala,
	p.titulos -> 'es' as pelicula,
	cl.nombre as cliente,
	e.precio as precio,
    ARRAY_AGG(a.numero) AS asientos
FROM
    cines.entradas e
	   INNER JOIN cines.clientes cl using (cliente_id)
	   INNER JOIN cines.funciones f using (funcion_id)   
	   INNER JOIN cines.salas s using (sala_id)
	   INNER JOIN cines.cines c using (cine_id)
	   INNER JOIN cines.peliculas p using (pelicula_id)
	   INNER JOIN cines.asientos a using (entrada_id)
GROUP BY
	cine, fecha_hora, sala, pelicula, cliente, precio;




-- Una vista con todos los datos de las funciones, incluyendo un array de asientos reservados

CREATE VIEW cines.funciones_ex AS
SELECT
	c.nombre as cine,
	s.nombre as sala,
	f.fecha_hora as fecha_hora,
	p.titulos -> 'es' as pelicula,
	s.capacidad as capacidad,
    ARRAY_AGG(a.numero) AS asientos_reservados,
	capacidad - ARRAY_LENGTH(ARRAY_AGG(a.numero), 1) as numero_asientos_libres
FROM
	funciones f
		inner join cines.salas s using (sala_id)
		inner join cines.cines c using (cine_id)
	    inner join cines.peliculas p using (pelicula_id)
    	left JOIN cines.asientos a using (funcion_id)
GROUP BY
    c.nombre,
	s.nombre,
	f.fecha_hora,
	pelicula,
	s.capacidad