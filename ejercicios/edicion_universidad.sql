-- Ejercicios de edición de datos en la base de datos de universidad

-- Ejercicio 1: añadir al profesor Santiago Galván del departamento de informática que imparte la asignatura de bases de datos de grado superior
start transaction;
-- ...
commit;

-- Ejercicio 2: Añadir un alumno/alumna con tus datos y que está cursando la asignatura de bases de datos

-- Ejercicio 3: Modifica la ciudad del profesor santiago a Ingenio
-- incluir en el update limit 1 como salvaguarda para modificar los datos de un único profesor

-- ejercicio 4: Cambia la matrícula de todos los alumnos/as de cálculo a la asignatura de "algebra lineal
--  y matemática discreta

-- ejercicio 5: Cambia todos los profesores asignados a la asignatura de cálculo a la asignatura de "algebra lineal
--  y matemática discreta


-- ejercicio 6: Elimina la asignatura de "algebra linea y matemática discreta". 

-- ejercicio 7: Matricula a todos los alumnos/as nacidos a partir de 1998 en la asignatura de bases de datos


-- obtiene el último id generado automáticamente y lo guarda en una variable llamada @id
select @id:= last_insert_id();

-- obteiene el último id insertado en la tabla persona y lo guarda en la variable @id
select @id:=max(id) from persona;
