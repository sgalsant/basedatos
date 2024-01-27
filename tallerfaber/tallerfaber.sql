 drop 
 DATABASE IF EXISTS TalleresFaber;

CREATE DATABASE TalleresFaber;

USE TalleresFaber;

CREATE TABLE clientes (
CodCliente VARCHAR(5) NOT NULL,
DNI VARCHAR(10) NOT NULL,
Apellidos VARCHAR(50),
Nombre VARCHAR(25),
Direccion VARCHAR(50),
Telefono VARCHAR(9),
PRIMARY KEY (CodCliente)
)ENGINE=InnoDB;

CREATE TABLE facturas (
IdFactura INTEGER(4) NOT NULL,
FechaFactura DATE NOT NULL,
CodCliente VARCHAR(5) NOT NULL,
IdReparacion INTEGER,
PRIMARY KEY (IdFactura)
)ENGINE=InnoDB;

CREATE TABLE vehiculos (
Matricula VARCHAR(8) NOT NULL,
Marca VARCHAR(25),
Modelo VARCHAR(50),
Color VARCHAR(5),
FechaMatriculacion DATE,
CodCliente  VARCHAR(5),
PRIMARY KEY(Matricula)
)ENGINE=InnoDB;

CREATE TABLE reparaciones (
IdReparacion INTEGER NOT NULL AUTO_INCREMENT,
Matricula VARCHAR(8) NOT NULL,
FechaEntrada DATE,
Km DECIMAL(8,2),
Avería VARCHAR(200),
FechaSalida DATE,
Reparado  TINYINT(1),
Observaciones VARCHAR(250),
PRIMARY KEY(IdReparacion)
)ENGINE=InnoDB;

CREATE TABLE intervienen (
CodEmpleado VARCHAR(5),
IdReparacion INTEGER NOT NULL,
Horas DECIMAL(4,2),
PRIMARY KEY(CodEmpleado, IdReparacion)
)ENGINE=InnoDB;

CREATE TABLE empleados (
CodEmpleado VARCHAR(5) NOT NULL,
DNI VARCHAR(10) NOT NULL,
Nombre VARCHAR(25),
Apellidos VARCHAR(50),
Dirección VARCHAR(50),
Telefono VARCHAR(9),
CP VARCHAR(5),
FechaAlta DATE,
Categoria VARCHAR(50),
PRIMARY KEY(CodEmpleado)
)ENGINE=InnoDB;

CREATE TABLE incluyen (
IdRecambio VARCHAR(10) NOT NULL,
IdReparacion INTEGER NOT NULL,
Unidades SMALLINT,
PRIMARY KEY (IdRecambio, IdReparacion)
)ENGINE=InnoDB;

CREATE TABLE recambios (
IdRecambio VARCHAR(10) NOT NULL,
Descripcion VARCHAR(100),
UnidadBase VARCHAR(50),
Stock SMALLINT, 
PrecioReferencia DECIMAL(6,2),
PRIMARY KEY(IdRecambio)
)ENGINE=InnoDB;

CREATE TABLE realizan (
IdReparacion INTEGER NOT NULL,
Referencia VARCHAR(10) NOT NULL,
Horas DECIMAL(4,2),
PRIMARY KEY(IdReparacion, Referencia)
)ENGINE=InnoDB;

CREATE TABLE actuaciones (
Referencia VARCHAR(10) NOT NULL,
Descripcion VARCHAR(100),
TiempoEstimado DECIMAL(4,2),
Importe DECIMAL(6,2),
PRIMARY KEY(Referencia)
)ENGINE=InnoDB;

ALTER TABLE facturas
ADD CONSTRAINT FACT_FK_CodCli FOREIGN KEY(CodCliente )REFERENCES CLIENTES(CodCliente) 
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FACT_FK_IdRep FOREIGN KEY(IdReparacion )REFERENCES REPARACIONES(IdReparacion)
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE vehiculos
ADD CONSTRAINT VEHIC_FK_CodCli FOREIGN KEY(CodCliente )REFERENCES CLIENTES(CodCliente)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE reparaciones
ADD CONSTRAINT REPAR_FK_CodRep FOREIGN KEY(Matricula )REFERENCES VEHICULOS(Matricula)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE intervienen
ADD CONSTRAINT Inter_FK_CodEm FOREIGN KEY(CodEmpleado) REFERENCES EMPLEADOS(CodEmpleado)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT Inter_FK_IdRep FOREIGN KEY(IdReparacion) REFERENCES REPARACIONES(IdReparacion)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE incluyen
ADD CONSTRAINT Incluy_FK_IdRec FOREIGN KEY(IdRecambio) REFERENCES RECAMBIOS(IdRecambio)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT Incluy_FK_IdRep FOREIGN KEY(IdReparacion) REFERENCES REPARACIONES(IdReparacion)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE realizan
ADD CONSTRAINT Real_FK_IdRep FOREIGN KEY(IdReparacion) REFERENCES REPARACIONES(IdReparacion)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT Real_FK_Refer FOREIGN KEY(Referencia) REFERENCES ACTUACIONES(Referencia)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C3','16092436A','Fernandez','Madison','SpringfieldLane','203338119');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C4','73141619Q','Brown','Lukas','AlexanderDrive','604414673');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C5','13881812X','Krutkov','Alfons','SeventhRoad','803623501');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C6','45109081V','Watson','Jack','Victoria Road','939239084');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C7','75873577V','Hoogbandt','Anton','Stanley Street','107420439');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C8','22504563Z','Bloom','Camille','PineRoad','537348559');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C9','64379729X','Jessen','Jane','YorkRoad','448379599');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C10','85200786X','Haynes','Nigel','Grove Way','032171658');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C11','64570338Q','Reyes','Luke','CedarDrive','859780232');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C12','60942723J','Francis','Pete','KingsDrive','095240322');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C13','74329482B','Jiminez','Rachael','Alexander Drive','771134013');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C14','35513910I','Brisco','Paul','Oak Drive','114161463');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C15','01040241O','Kidd','Jonas','SouthWay','598630370');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C16','88346976S','Reyes','Truus','AlexanderStreet','402783979');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C17','46972371I','Clark','Annie','SecondDrive','213024920');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C18','78815157Q','Lee','Taylor','Fourth Street','434404343');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C19','82647321A','Morton','Lea','LondonRoad','567983858');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C20','82021534L','Linton','Joshua','FifthDrive','193836913');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C21','73064735X','Naff','Ricky','Eighth Drive','968080667');
 
 
INSERT INTO clientes (CodCliente,DNI,Apellidos,Nombre,Direccion,Telefono) VALUES ('C22','66778724N','Watson','Phil','Eighth Ave',NULL);
 



 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('623CMS','Spyker','Pakistan Rupee','negro','2000-01-01 00:00','C15');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('244ZTQ','Audi','Nakfa','rojo','2000-01-01 00:00','C15');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('545KOI','Buick','Solomon Islands Dollar','rosa',NULL,'C15');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('316VSH','DeTomaso','Armenian Dram',NULL,NULL,'C20');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('207OAM','Daihatsu','Somali Shilling','rojo',NULL,'C20');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('648LXW','Alfa Romeo','Cayman Islands Dollar','negro','2000-01-02 00:00','C15');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('049BEX','Volkswagen','Brunei Dollar','lila','2000-01-02 00:00','C15');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('1410YPZ','Mercury','Kyat','rosa','2000-01-02 00:00','C3');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('4811DUO','Vauxhall','New Kwanza','rojo','2000-01-02 00:00','C3');
 
 
INSERT INTO vehiculos (Matricula,Marca,Modelo,Color,FechaMatriculacion,CodCliente) VALUES ('6112TWY','Land Rover','Forint','negro','2000-01-03 00:00','C3');
 



 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R6','Dong Quai','y4NM2sRnxFjCqZBMiO7lmogXC1uV1rDxz',17,233);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R7','Ground Cherries','a',22,422);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R8','Cotton',NULL,23,759);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R9','BAMBOO SKEWERS','8aYlPVP5dz4ymgM56ektZyw2kJMRcxm',57,511);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R10',NULL,'aiM0GPX8r1RDj7gil8N2Ewer7AlMDxIBpHmUd7H',92,827);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R11','ELBOWS WHOLE WHEAT',NULL,8,584);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R12','COOKIE W/NUTS CHOC/DIP','NnFKZmYpuanracPu1a8VET6IoXgUu0k1ZUjvJLaFoF',69,796);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R13','Liquid Gold Styling Glaze',NULL,45,390);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R14',NULL,'biAeZzeBao0SiIv5iNBOLq',53,203);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R15','Gingko Plus 4','wnTk6GiWzG6NQ7RBDJe5YoTXk',76,473);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R16','DESSERT SLEEVES ORANGE','Mn5ipmbnQITREyx7QPBTVF0yHjInLT8iHKruNKlKDcR5zQORku',93,514);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R17','Coenzyme Q-10','FsowY1JeKIuLZGhBHfIHYa5SSwTYITQufma38fLIR1Ljq4',45,900);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R18','ORANGES MANDARIN','TzMC6fvb0j816QfHVBNw1',3,941);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R19','Cauliflower','bWsG6jfOtTelQkz5y3Ir0F0ECK4TL35YSbTo',55,947);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R20','Chromium Picolinate','h5JJzan1IB1f',7,203);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R21','HAM HOCKS','MphmhQ2r',48,836);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R22',NULL,'F6j6G5IdpifWFoNdf',NULL,604);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R23','Sweet Non-Bell Peppers','DG1eYc3WJMxJbs5Oz3ZoQ4m',NULL,986);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R24',NULL,'6iBewOHKQKY1QYOCwKbHE45DkN1t8mdhlUYhDT',49,911);
 
 
INSERT INTO recambios (IdRecambio,Descripcion,UnidadBase,Stock,PrecioReferencia) VALUES ('R25',NULL,'W',NULL,912);
 



 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A697279','This is a description 9616296',3.61,633);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A150007','Description number 8753231',8.6,524);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A556095','Description number 3901504',8.35,350);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A925382','Description number 2506443',4.9,901);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P901016','Description number 8139415',NULL,583);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P622275','This is a description 9871302',3.11,272);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A352719','Description number 8603892',4.11,235);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A678019','Description number 4980716',1.44,513);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A207285','Description number 4524260',1.67,388);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A309033','This is a description 4894579',5.21,156);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P303817','Description number 7161392',NULL,056);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A963222','Description number 2708540',2.13,NULL);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P214511','This is a description 1494119',1.32,532);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P575932','This is a description 3431480',5.33,NULL);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A221739','This is a description 4800676',1.76,881);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A877021',NULL,8.6,167);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A556666','This is a description 5290074',3.26,883);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A761114','Description number 9854447',9.28,217);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P348228','This is a description 8218741',8.71,086);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P766736','Description number 1484073',8.78,633);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A267083','Description number 7332569',4.04,809);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A271072','This is a description 1159611',2.51,845);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('P593928','Description number 5587262',1.35,281);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A400055','Description number 9425946',4.45,108);
 
 
INSERT INTO actuaciones (Referencia,Descripcion,TiempoEstimado,Importe) VALUES ('A716823','This is a description 8906332',NULL,013);
 



 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E4','68582672W','Rik','Clark','WesWay',NULL,'16740','2000-01-01 00:00','Glass Blower');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E5','47447066I','Katie','Patricelli','Fourth Ave','157414520','99330','2000-01-02 00:00','Scientific Glassblower');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E6','66686231S','Lotte','Prior',NULL,NULL,'80998','2000-01-03 00:00','Collection Manager');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E7','89404978K','Lauren','Cramer','ChurchRoad','445537323','53911','2000-01-04 00:00','Automobile Service Station Manager');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E8','81471203R','Charlie','Slocum','Cedar Way','930968445','71526','2000-01-05 00:00','Manager Purchasing');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E9','77887392J','Leontien','Markovi','GrangeWay','842544345','73016','2000-01-06 00:00','Telephone Operator Chief');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E10','89841191K','Tomasz','Shapiro','High Way',NULL,'45055','2000-01-07 00:00','Alcohol Abuse Counselor');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E11','67927180R','Leontien','Pensec','ElmStreet','882706343','80200','2000-01-08 00:00','Nursing Services Director');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E12','17458925R','Maximilian','Dulisse','NinthStreet','112684715','12453','2000-01-09 00:00','Grinder Operator Cement');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E13','27140247U','Luke','Trainor','Queens Street','658305804',NULL,'2000-01-10 00:00','Union Business Representative');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E14','09490938T','Steph','Van Dinter','FirstLane','249795370','93707','2000-01-11 00:00','Personnel Plant Manager');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E15','58518486Z','Camila','Ladaille','ThirdLane','065854456','76340','2000-01-12 00:00','Collection Clerk Banking');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E16','21826083O','Jo','Bergdahl','LondonDrive','305042858','57326','2000-01-13 00:00','Machine Operator');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E17','40978209Q','Benjamin','DeBerg','GeorgeRoad',NULL,'90402','2000-01-14 00:00','Pest Control Technician');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E18','96707103S','Lia','Ayers','SeventhDrive','719621330','24962','2000-01-15 00:00','Reservation Clerk');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E19','47562662C','Joey','Ostanik','Alexander Way','631215221','18769','2000-01-16 00:00','Engineer Stationary');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E20','67179188O','Luis','Kuehn',NULL,'831841040',NULL,'2000-01-17 00:00','Drafter Geological');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E21','64128050Z','Ed','Noteboom','Wes Way','899637155',NULL,'2000-01-18 00:00','Traffic Clerk');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E22','50680095M','Talita','Freed','YorkWay','769423014','72858','2000-01-19 00:00','Floor-Covering-Tile Layer');
 
 
INSERT INTO empleados (CodEmpleado,DNI,Nombre,Apellidos,Dirección,Telefono,CP,FechaAlta,Categoria) VALUES ('E23','62206539P','Joey','Freed',NULL,'474547514','26027','2000-01-20 00:00','Construction Helper');
 



 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (1,'6112TWY','2015-01-07 00:36',382.56,NULL,'2015-02-24 03:24',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (2,'623CMS','2015-01-07 00:36',1.06,'This is a description 8688158','2015-05-23 04:25',1,'RzgZxF4h7msbCMOQh1uwgFgP4WBHJAcD8Q2LYi47S6ruYSBzMgUyKTt2e6tDrvNxdZygXkkawDtvG4iF0SYPfekWmk56nV3KkPxxQkHGlv5qd8O5LWk3KWScplRUt0v');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (3,'545KOI',NULL,NULL,'Description number 8420464','2015-01-02 00:11',1,'cRBtp3AOoSG7vR5rlQhlDNzQgbnjuW8pmJcqKhH4afuwvQeZBMmZR00x5TNqLsfbjKjLgvj7UFLA2Xqy41ECd5JtFUkZh0ll5iWaoJYCx3');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (4,'648LXW',NULL,3782.87,'This is a description 0897997',NULL,1,'mhRsvLbVnlKuqCg1');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (5,'6112TWY',NULL,8804.14,NULL,'2015-05-23 09:10',1,'Dy8GS21IkUILCf5R');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (6,'623CMS','2015-01-18 08:15',4742.66,'This is a description 9647899','2015-02-05 06:03',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (7,'6112TWY','2015-01-11 08:38',4426.38,NULL,'2015-03-13 01:14',0,'7ZqNHVl7WgB8IFYE6nDPtmkORWFSJwhOOUwNy83kYYwUqZuhnvgKHZRybvVcVzuEMhNptRqy3tCScv5fP11xhJezQpKSQNXg5z');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (8,'4811DUO','2015-01-11 08:38',8.64,'Description number 2971364','2015-03-03 04:36',1,'QsxFMyNVuA5iSDjAEDThVqggn18ptjeY6eD4uHPdVkx8mwwt7ewSYUfgwWKcEj6xccmIFgy57B1yB3z2Rfo7Fz6MQwBov0mL41cg3QImFE3TsmKjy3fGV2C6oSieeZ0dqCtRdt1PcEfPsl8R3sSBm0Hrjt4Crk1hwPoUDyJ1g0y80wiCsIFkV8ntTa4ccRxnYgybpAzjq');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (9,'049BEX','2015-01-09 05:37',702.35,NULL,'2015-02-09 03:02',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (10,'207OAM','2015-01-29 08:46',889.83,'Description number 6056388','2015-02-11 04:08',1,'zyCMwPalV4UsrCCeGsitaEgguWPrebNE86CUApZYL5612ub7nRlZiHbSx5uheYFwBt1xK02akTshWCnoK2Q1fXs1vFhmg8k5Mf3M8oSWQ0m');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (11,'1410YPZ','2015-01-29 08:46',8080.45,'Description number 0614016',NULL,1,'WySjl1T3eRA5XV1G6lr05JBHBssT5twRJFcEMsufHiVh8IHGxgNCpj7A5yohzVE1SDUBOmd6i76PW8etS5N');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (12,'316VSH','2015-01-29 08:46',4915.67,'Description number 7886132','2015-01-14 01:56',1,'tIIThgZOqsht6Kry7XVIVo6nJHyhhx7b6PJ2rygZ4f2J8VLIBvZ5t3DrjQgDOj07f1YSgfm0vTdwRmt7pEF5CJ6cmhnQVRdzmkH0igLoDE1OEUyy5TpVQ');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (13,'244ZTQ','2015-02-11 06:57',233.34,'This is a description 9068793','2015-03-19 05:26',1,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (14,'244ZTQ','2015-01-13 06:44',742.68,'Description number 4144786','2015-05-22 04:09',0,'Yb7tP8CSNcSm2SaSanV3kdgoizMmrNnNxLhA7jA3S0uk4Qq2Z7FouE1HAL0UMLv2tlp38PUPEx8xXekscGXbzuR1s4AxJwqiv4gZYcqFCNwgiXtGpo7FhLDmHPVUEqkumFt003d5aoTdIvGC6zo8J6FV5tXb6EbKuKkoJPyocLsrIoH');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (15,'316VSH','2015-01-13 06:44',NULL,'This is a description 5736304','2015-02-04 08:49',1,'uFbZsBnfEL5I6zHF4lmgiPGuFugiuNhqPxAtGg5GOzAB86MTavDWI3ZQ0uLcvnkJ5V6k5Da48Tw6D2WTX4HBCS0zVoYuszfVRsYclk4oVxMu3wQoQzK6nS16Jkp3S0XY');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (16,'6112TWY',NULL,NULL,NULL,NULL,0,'qKWEK5g0DvaTayHqmGvWOf88toyeq2rmJIIIgIGNpx7PDwCgnUNVxlmW57VhSOrexZpX8DOnJ8N0FJ0');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (17,'207OAM',NULL,8298.78,NULL,'2015-04-17 03:29',1,'8gCTz3epOZkeyRcXDHoz6t2ILCBAjLLtEktUtUISKufaBP52yzikdZDf0vrEWCUmqCvI2iT4CU74Lf58vBSqcQbMrTqLKQA8SpGrskJS6EKHH6tMfUbFeUtcyvvaBNQMvd7xjLGStkiuM8dgPhiiJAljj8hNVZCeWpdWfvFERgkiHaQqciRuOzmPIzhwuPADyShs6pIpoQV3e6e7SJywXYQNbamzEnwKDO7ogkwgP4F5');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (18,'623CMS','2015-01-05 10:26',NULL,NULL,NULL,NULL,'gI42bnEbpDGebZ3Dz5gPO3rtkzSmNXDzFN3nhBt1YCD0HgBcL0cIyDJ5MnPECt2JrYu2vywaVWvkG');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (19,'4811DUO','2015-01-05 10:26',29541.07,'Description number 8577548','2015-03-04 02:33',1,'7rZwqUKNkyswAOr7GXnxVyK3H5bMY0AKzwywIrmpcGOUCKnXrd08ZOwJpGVGPYl0osOmdXre2');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (20,'244ZTQ','2015-01-28 09:20',4,'Description number 0952696','2015-05-09 03:31',0,'Rueb8CMecvJASojfHy03fXXEKPW5migJmyZiV5bhNUBvG3rnKFA6y0J5E33nlHvMELjxvFV7PUmOoQrNpiByPUsRyCBhnETnY1H34h0nRqYHQVFCdCMkSTPkTeo1EDxxUXrETlwj4TATsXbYix7xNO6epbc3PwNLAwbn4mWC5nOwQKtxhNnZCKywyWcjpriABGD22QrHiwMUEFJIwZxBByQ66KTi6MUwbyJ');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (21,'6112TWY','2015-01-11 04:14',244899.6,'This is a description 1956901','2015-06-09 00:36',0,'atet2VKRESf5DGgjVj6xNgu103LKv0q3uIq8Pjt1bWlQjVpL4qgvqf');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (22,'244ZTQ','2015-01-11 04:14',22.92,NULL,NULL,1,'HgctbWpnFwflg0FhGZzidIBL3OrajZD4p3IQheKqjaWzjLBTayI0QLeZ4Ij2e1rQka0c3q3iEfYSyTCMhad12xO2R6QFhZimLUJjlOObchBOb2ic5SexvY7Q1KrkuN1kniHDWlYg4YWwmYVlAAwWGBBmg0zdnmZZSZSMYaY08ngb72gh48zmJoIJIF');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (23,'244ZTQ','2015-01-11 04:14',767.98,'This is a description 6522146','2015-06-06 05:24',0,'BFBAvo6cN7nmQSCdgE72j6q7nTVwFYN8IToqOSpRZUldhzEWzKHTZqS5qWMNNCZEmQVfNOl7xPa5Hj71bPUrCWMUzWBbjeYu4CFU5LbUb18UHlM6');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (24,'316VSH','2015-01-24 06:27',29.73,NULL,'2015-04-04 05:50',NULL,'QAlTjPKrROiN3cvXUKiKDzHEtLbnl2HI4NPAqta2VIjSiYE1LXc4TKfosT5xsxJDsrULdnxTqonx5XDx11nDTTgimsrLLmOF148vsAEYfcUR0rTZ7m1gJba38xkC4TNBMqNQjIGXkLlR1SengZRPiBguN8VSgsn5o5raHNBoKc1Gv4Pawfq3ZrIEPZjfOcRUqcLhDBGLCVqfhZZD7hhVEu82AHt');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (25,'648LXW','2015-01-24 06:27',8997.26,'Description number 4102805','2015-02-04 09:15',0,'vejy0KpRh8tKhOOh87J3do6XFVKCTwpk6Facl6cStyyqjgFGTdEJJjoN1o26HOYpt4CZx1zvyFwapMGJk0l2cMPRbmqRci2HMYOQpzK8qyRpykcyTP1FhoevGMAtxX4K6PMrhY07I7R2rhGzMALIXZ2ksLDxhclNA32Fx5L8E1mhVkDUELkDWSdjERW3WP5kQ0NZnE34YTytCZEDub1ng8SOwOVlt7MeJcGcK');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (26,'545KOI','2015-01-14 05:35',194.78,'This is a description 4535700','2015-02-23 01:46',1,'qpqKycOfcXD4l06D5uw4A3Of13OAam575xFdKZVhgC4EJBJVYZLovg5QbMeaSHNhz0YTArsxRXrhl7jpx2QKKp2nufIF706WeOJzvAjbE8lr3SOPDoqc5DtNYV4RYPpqdlzBIEcQhjIOKpNA1ibixbqPB1Ir4HUey5SYDYAHG3flnvAcJQATi38H0lmSxjOhfb3zrvwQpLzLufCF6');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (27,'4811DUO','2015-01-14 05:35',4.41,'This is a description 3023700','2015-03-09 05:33',0,'EdbqI3LJ62TrAOzqFptX');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (28,'244ZTQ','2015-02-06 02:04',98.79,'This is a description 4229573','2015-05-20 00:04',NULL,'lMyU7bkWIuJxyykZml7kVy4zrxyV657lj0hz0PJrr6OTGDxOPTAzp');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (29,'545KOI','2015-02-09 02:03',412.25,'This is a description 0010574','2015-06-11 08:02',0,'aBtPXqiUQQKHfU2nJFYk5MmIX74sWaTko3b5VbYjpMxAx5264EKjPqo1PgrTeeROvRuRkD8Y2T8y2SbVYptPPUfYFVabcm0ifxYQK3NYpBdE4OV46darQFoHxEVIp');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (30,'244ZTQ','2015-02-09 02:03',NULL,'Description number 0070919','2015-05-25 05:05',0,'Zduogelmp0hqXrsea5Kpu2SZmhSLt5zaHhinZHRptnWedB1AGWBbIqp0AcbcZDyp6iEbMstRrRAh2PnNlhNoxl3SHJ2y6jQYZEHAUITOfPUXC55SyuVTajLrbDhziDJNcPNaKjT1zniZsnRLoQjuK0JAwKPI8E8UaIWCggtfCMhTNWXZHvxsmEd5PKqlLRp0ByDHCMWLSwVxNRkruX');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (31,'049BEX','2015-01-25 10:50',8.38,'Description number 6979918','2015-06-03 02:40',1,'tO1APPUnCyQPUERxOvsZ7W17Nukt3x5BWdysI6uD');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (32,'648LXW','2015-01-25 10:50',8233,'Description number 0955911','2015-04-18 02:50',0,'pl1VqHbAyoCcO2cenFjpJngSLvAc5tVEi8tGUjDxFo7EXUHz3TsDxJzWMfxjMiu5mJRfzv6WnAccNd4wzdfKyBDMxskEhnt3hQODAigzAURJQfeGZf458F84eEBJvCzboOQjDHCkhBtMCRMjIkQewaFZAtWQ3Jb1BZNKJxhAuo60AQekbTP5fQgkn20MyiGkz8iXynLYHwiUuphAahBCGOXYSANVGGEw6ScbilJs');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (33,'316VSH','2015-01-28 03:04',NULL,'This is a description 8476317','2015-05-28 09:51',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (34,'4811DUO','2015-01-28 03:04',NULL,'Description number 7978478','2015-05-17 00:30',0,'XUvbTcjdr81xmGVbSJiL43czf7pluSqdMkghNUcJQemFcvNeZS7C2FEwpHtlkrhND4jfH6rOXtbYxcyKLuu2Re8vI557ssnfiz7DcupWDtq6KQ8nKJxe8A083orF5ACtyt8SHqkR5zoa3Tz7OGD5jm3688c1K6');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (35,'244ZTQ','2015-01-28 03:04',184253.42,'Description number 1096187','2015-01-04 05:25',1,'jukgGOCmSKWTTajf7hiinTCpEzrDNcCDTxCIGubT1RGA3bZOFO6r7YxYvFwHABWweYWDsKDlI0Wq1Dl1FmuQqKcGABVahnMTfjKQxZKVGyz8sOGPFe7sVW46lvDpUYzH');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (36,'648LXW','2015-01-10 05:05',799.83,'This is a description 3595540','2015-03-25 01:46',1,'sNx0DpL7dgCqRs81sZhaQ73qTlFFJLaTBdN5dIwtjmUSdpbr4b6i3tlgy70goqsFMMhWoFE5RtIihDNMhoTY68odMsnQKXJ4g');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (37,'049BEX','2015-01-10 05:05',NULL,NULL,'2015-05-25 00:17',1,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (38,'545KOI','2015-01-10 05:05',186907.74,NULL,'2015-05-25 10:26',NULL,'5ZRSEyPIGOjbO3oy7YNSoMoaTcLUr6ZF8aVSYWS5zfDx8ZgXrJjk3zctUgBOLEmTYkdSDZi5EhysBzqYzTALcyyN0uzyRFPASYcTFqKUz1hN7aTUrzkhcOKaK6YstoNFlVtReRwCAzT8YIlPWwuRWzG8JJvZnkh5RWYi4FKVzL6kGbYqD7rn0dlsBsJTTomb4ktjtoWB5sIrVxLLI4QjbstXQ');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (39,'316VSH',NULL,44.35,'This is a description 8891379','2015-01-15 04:44',NULL,'TYmVbBPJMFrifqTxvVVuFUY0eHsGqh2KlABEVQUL12lruCRSflBsObIVP2hA6E2TOwJqh1Gpdr1WlRMfXVK3yh7u4B3kTxyJFGOKJVA1PJ5rrszF56f0PqUzuFcOe4ugST5qTCHP2yfgTQ1XvJiZ1TKBzflB4LNvuVzxcveVoa35GsBKlraziR');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (40,'4811DUO',NULL,199373.64,'This is a description 2405856','2015-01-04 07:25',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (41,'207OAM',NULL,7136.06,'This is a description 1066341','2015-06-07 10:00',1,'TXw35sBW3xLM2ff3MoFqRADGd11l86');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (42,'623CMS','2015-01-16 00:47',65,'Description number 9453092','2015-03-26 02:46',NULL,'KD8yOqnrk850wyDodpq7iXF0Uc7tgw4pUIjTmeITXhrbKDgXaxUFhwURXrLjgTU0g7xjGfAsQraj3wK4IVGTiv6jon1Enkzv7qGaCmMrLek0yyuyEUkzPWwt0FONzZ0BcewIROGbtPfAEa8ARBPUH42oeVBSkLkgQLOmJPI2CNSy5pUHFaigHENiCGbklPkIJ7LnYvwDsK5yybTEQnCirCpeyC5vrssOo7lNj2JiO3TEfXs5CO');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (43,'1410YPZ','2015-01-16 00:47',52.39,'Description number 5998011','2015-02-03 06:27',NULL,'jvJUey8TPCTJVvBJVaNFTSkRjNwAo8MHGduqIsl5Ctb7FsGl7QaJEMjjyjSmPxCr5pQHobzhWS6ZRgDLhj8IcAb1141LPfQoIcSabQs5Y27Z');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (44,'545KOI',NULL,634.05,NULL,'2015-03-30 08:30',0,'lg7lklqLuzAqQS3lHJulm8iFzxtKIYJDZ4MewlJEG5UgUswypDcwwFLh5as24GRob0AVmGbYbx5jnFoE85rkvoUL4eqO7RpQBEcb');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (45,'648LXW',NULL,730.51,NULL,NULL,0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (46,'545KOI','2015-01-15 00:00',8288.45,'This is a description 7012799','2015-03-16 05:10',NULL,'aEkzkO2ARkAKDhxzoE4gzdouV8xws3DGYPUiuAPH2pDrOjl0G2gD0Y6u3xmi0pNr0sNJhVKqo2NdntbeXaKhVKrITd8AwT382JC1z8Vr2BuAFw0y70QTnuxBVKgaSIkxRhRtCWASRQbLsRZt7srzME6AJhzG71pNSZOzw3aV2WAazJM1Ou');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (47,'1410YPZ','2015-01-15 00:00',61.12,'Description number 0677669','2015-03-15 02:42',0,'p1M0jlNjfc6ZZtsppOLZnbCAYyrImGUtJHLO0lCBvJyMQTrds');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (48,'244ZTQ','2015-01-15 00:00',81.04,'Description number 6885558','2015-04-04 03:06',0,'ZknIDk5xI6mc5pW7gv1FwLs8HvKpLdCGciCedDV5t2ami2jJyRjJorM2IjLlFn');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (49,'244ZTQ',NULL,64034.58,NULL,NULL,NULL,'DJ1dLcrgAO7rGPyUf2Q8R8PfoeXY7C0iz4Af0KALUfejnt3dOxjUVI3wfJQoxoYua66ZnhJAFxexcCXt45IntflUIhaqR3aKRA4uXc2teL7SbEQmImJqtuo54ppbQbu1q5NgYx1BZ8GHtWknaLmxKzMViGbA0chR4');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (50,'316VSH','2015-02-05 05:35',27521.91,'This is a description 1990876',NULL,NULL,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (51,'623CMS','2015-01-24 04:19',NULL,'This is a description 3803084','2015-02-15 01:11',NULL,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (52,'6112TWY','2015-02-10 07:22',NULL,NULL,NULL,0,'LUWtrIBpk8EzWuzCNGv2tct');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (53,'648LXW','2015-02-12 04:30',474.82,'This is a description 8126939',NULL,1,'AnqLvNhhUkIVxXKWfufhtAkhsmvK');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (54,'244ZTQ','2015-02-12 04:30',6912.25,'This is a description 5905121',NULL,NULL,'nB27LlXm31iEmqYclEMV3cYZO477V22GIntvNlyFPouTI1czZGk7OVxlGX06vkJA0jaBXP4yGGUeCF8mKEvHsVlk8El0SqO2mVxKioJBeZpJQ75uCQvwZ83MFj2G7wZXLjWnHJvYRu7bUFK2Nuj6zHtGP2UKTUIYF4o5cHQWG4jvKZ1vd71hp2ztFEnH34gUW8Bkdd1WuMPgfR7aDWKYPcS4SD2OUCahVDGdnid4j4K0');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (55,'244ZTQ','2015-02-12 04:30',19.01,NULL,'2015-04-26 05:40',0,'fK5Dkk4Q1RLLYUNl4bZumTW8vSnVF8fweHqQ4z1i16g7Zu5LPydPmmeFSSRbTKqHmRMYni2lrM3tQTGRwPOieMVUPnu6TQF7ivnpCWDIpuD0BdjscU8irN8deaaklJLl85Fx6dm5EGXRQxdUFqFK8SUXx87c1Gty5s');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (56,'207OAM','2015-01-14 04:17',NULL,'This is a description 6111467','2015-05-27 06:05',0,'HZqYPaRfwo0H3ifI1LsFtqiiwUKJmpXXXLgK2GC7rJWb2LitI8t');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (57,'6112TWY','2015-01-14 04:17',59343.19,'Description number 4748913','2015-05-24 01:31',0,'nDkXyWUM01qwoNW8gE5Z5sYjxnWEYThz3bckANHK8c1LTgLBts7i8D1oqmMQMMszL800hKOA3iVXytQ5jpkb1yIDBDC2LQbTXfTj3POKT0iWmfBwt1vjpKtLKhp1oRqut0rJxJ0blB07QMEb22Z3zvVSnqUkYUP86HxKjuEySJURIzl7vXrNMX2Afi53Zb3K2ThkbAgEbCj5DxPbxwq3ijmyjbyWpy');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (58,'244ZTQ','2015-01-14 04:17',187.37,'This is a description 3872988','2015-03-28 09:16',NULL,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (59,'1410YPZ',NULL,NULL,'Description number 9898418','2015-01-13 09:48',0,'w');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (60,'545KOI',NULL,NULL,'This is a description 2818805',NULL,1,'jzC77E1MvBQqxxiHa6s3Q2gygo2FN8HwRA7Ze53xqSYOOzOyru1nyKr03v0fBtXD7knnFjBJNV3sG0ngmAo8YnJVgkOW3VhTFCcvsgeap36W5dts3AgNL6EatrenCkpTnUY8VTfS0a1v30GadbC7YdX8XbfOz8iXst8PmIyFlkBQvK1JqjMRmXs6fI34LHWP6rhmKFYOnSZAv5tbwHBcXimRNmM1WTeYHaaJp6IbIrPgj');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (61,'623CMS',NULL,65.36,'This is a description 5318423',NULL,1,'xVFtosF8eqPrpB0p0xJFGY6YqL14bdt0dgpZuXvMZjSgzpu5a7lSml5PmtvvvFkMPVwKwJIpkQMcwcJFINNUp0JTgSBYb3yNrzLdbfAXsoedA');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (62,'244ZTQ','2015-01-01 04:46',2.95,'This is a description 8630681','2015-05-24 01:11',NULL,'ofSXxs0bLm8rWKraNDqSJ3swIKlpYsvAvAXmQVcLGpldOteNSRUSxxCfzZddSlQCnLWjerzbGC0dND5Ilcv3JrRsck4dgydjlxwEPvOHlIwivzgymegz5Q01cQ4JwpFoELruUTNL83BT15MmL5qXboce5WxXdwpCS3jxWSBm6W6mAdiVvyNuxznsRKq7AyPBCRFz6havl04EnG4ZNa6jg');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (63,'207OAM','2015-01-01 04:46',274.45,'This is a description 1363173','2015-05-09 10:53',1,'0Y4aAWS');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (64,'545KOI','2015-01-01 04:46',9.7,'Description number 9046173','2015-06-09 05:27',0,'DuEC8PmeQtRuGZHS2ljnDMzKPSJplJRuUUEwtY8ERuFuWxv2gn1aRqXQATmqvCHVbrr1PzI24EN3oWqLCAWGjciuL4KKbnxSjIIcxWgnanrd7MdxYzaoiCB6wRg5HT8HSOTQfXp1bkodMi7fBHmMdOi8x0b3i1FvshAigRx4DDYAoBVpcQX');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (65,'623CMS','2015-01-10 03:56',42.79,'This is a description 3693511','2015-04-25 00:07',1,'m5kfQJOhP0wTpnRPqJqKRQhok40vPR4G67mn3VLjQBjxniZJwJ7rL68x2vNTAyx5sYeiaQHbpIXsQj5wWDv1KJT8koWsjWpd2cWF4qXvMQK1H8zUONi4T6');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (66,'1410YPZ','2015-01-10 03:56',83414.9,'Description number 8612016','2015-02-04 07:08',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (67,'244ZTQ','2015-01-10 03:56',31.28,'Description number 3763748',NULL,0,'3OEDZY7oOPsi5g');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (68,'244ZTQ','2015-02-12 08:19',6851.07,'Description number 7653226','2015-04-23 02:13',0,'wVKL1Pu52CiqEIL26vxuWkhxqkWaoq85ahTGmqkW4eauSd7Hm7v7KyYKw6PU1QprkooMkcG1houBlayx0Zgg3Oo66xR7EIOevJYsMNpaEE7ALBVN4dWVWuq2M3YL4HDRsgjywUoOUu63p2ZMtqfrzqWDrNgwzUCLbkJTcEnTJXYj5OO1P6W7rWjTg0QuXsx3nQVN5RhXOBjaYvMsOeCqNYLpmQyhToS');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (69,'6112TWY','2015-01-19 03:03',20.79,'This is a description 1315496','2015-02-20 08:49',0,'sVwRQSMXaWVQAqSX1jVFEyJ2iNkAj84F5kCXhk6OTVnH8T37xOse8dSqMRr4DK7YolK8WoVupzj0SkXhaHLnB65nUkkgRCzjXsnggKq84UXqJezFbp6DS6GECGwghJdWboBBsgQMLlaqcImHAnN8cR7UkWlmarOopkmcdYohI');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (70,'244ZTQ','2015-01-19 03:03',47.64,NULL,'2015-02-15 08:56',1,'8xDe1BDyKRec1QtFJBJuEbcG');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (71,'316VSH','2015-01-16 01:12',2976.01,NULL,'2015-05-10 10:32',NULL,'A02rxM64nRDRm2oBtvmUnYJn2bceTi6dMUz5HrlCQdHY6Aemae45jcbunJOjtNU12E0IjP0b4ICQ2g6N1n54jbwhQPJPKgyqnJp6NtmJ75bnmI6kGSAtMCBJKlWmekVEpqvBeHy7xq8Fuf2NiUOAvafDUzOzy4D6eMavWwsNbItT14cz8LejeS6O0lX1f8xwovXnEucdaAocufJEoWHQwDexkoMChzbeDWBxQE');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (72,'207OAM','2015-02-01 04:40',NULL,'Description number 6703271',NULL,1,'Jta1FOiOwSMfvkqhNcGYy2OMCYEt2JXuMnExhZz7fjSXpE7VtdhdeQundfpNPyAEEsXDfAeD2t2IPVlt0tPySyxH02x');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (73,'648LXW','2015-02-01 04:40',271.97,'This is a description 9943928','2015-01-25 09:45',1,'RjTMY1w22VOy25J5WfbaDRLhgmQbD5QbvFvJ');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (74,'648LXW','2015-01-30 00:35',8.45,'This is a description 1411242',NULL,1,'E4O423yWDIUSTqc37TmhpIttHNqVwhxrd6l85vfkSU26DQP1yH0JMvUGxmulK3npgEIeqgkkbnUgDta0Myy7e8O71cOPLwZsKu365JIEWHTLsfV4rTIuyiuIftqCwaQEIcibi');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (75,'648LXW','2015-01-30 00:35',NULL,'Description number 2589141','2015-01-11 06:46',0,'LdI57hWTuPm5qC8g6cZxDWZZUmNG1LknGvhefX0J0Oj6ug0hBwsgtMDxSuNbmSsIb8ijQp72ItOwfIBiL8wnqaXRwGxgtzdAtqp');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (76,'207OAM','2015-02-04 08:50',940.4,'Description number 1862826','2015-03-29 06:36',0,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (77,'545KOI','2015-02-02 09:09',9.21,NULL,'2015-02-23 10:28',NULL,'yR2XUxFzWrdst6CdkXjDnFaAZdfCTqlLKBFnYBxBCq01Z17NFyuB3nxTBSQMHMUzPvTcHnrPlNicPpwTejDzJUgvWnijVA73iPmHhLJE7O2FT2YmkViqCPEGXnlAliGteTUEIXtqIxNkepQrIVyKlRSAFOL0ziyDmVaN82qPPWhxzMjulwflWOsu0qBSWfdKFN42r3gjYxdxqX4O');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (78,'316VSH','2015-02-13 07:28',9.49,'Description number 4346878','2015-03-17 08:37',0,'vPSOi0D3DcPxkN0xez8KqacFsGu6TcxqrCA7qhjhF4XEFariEsb5kd6RgZeTR31dDE');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (79,'623CMS','2015-02-13 07:28',33.99,'Description number 3231629',NULL,1,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (80,'545KOI','2015-02-13 07:28',NULL,'Description number 6349371','2015-03-24 10:58',1,'F50xvYxPZsuCsOVHC1fVQbuQRiuBHRuMJToBF6vVpKdMyVay6sffRb0d77BoTyTW6bvwnLBMU7mxrcTneEc2q2LreLl4o3osCBPUkU8HQusZAjGmuOVsXr');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (81,'049BEX','2015-01-10 09:55',5.76,NULL,'2015-03-22 06:46',0,'GmgiPFdDMvman7TjrSQekbFYGMjZZLOjI8nUP2UNYXoFGcAn4eXp8Y6FHYOVeOrmmaP5RZSbaugAtQf1juHbuAyKWAyB20jyTcJlCo8IqOOOl3OeOFxNN0d7aTHgbcZvtcPlBp8iZgbblr');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (82,'623CMS','2015-01-10 09:55',98.21,'This is a description 1645784','2015-03-04 03:29',0,'JyEonNaBQOpz2LJJfJIvatGof34CFumuC88shBNobPvcZU3kNgKkh8d1Zw0Rh24FWJSoNg8SrnbWs81j8eLwUQdKJePh');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (83,'545KOI',NULL,84849.86,'Description number 1550257','2015-02-06 07:20',1,'Siz7qb78PDY1Pftmj3BYv3Jwk0zqkAsVNsGNeRYzDQqA5KJuexUHLA2NpzOInp8m7Oo4x1C1Lig1p5J4eOAP5HrTRV57xjee1f5aZ38OVlGLGimAgjYL6OS5oz5Jz7Guy7QaLUfZt3zc6TDBc17xafBRdfKhPlOq7QygdjRhes4sUETa');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (84,'6112TWY','2015-02-12 03:31',NULL,'This is a description 4348160','2015-03-03 04:35',1,'3QIg6N0fRK0Igjzf8Y3JqyOc1yRBgOedS3KOLdzEqnZqZXDCJ3ZeHGrUUyFZZNahaTlS4DbwPAvRJxHYVqOztLtrIyJNYiYgpMeMuHQSspRAY8BwPfeLvwVZQRticv6AiLeAIC6JbIZb3e8tQudcUpPofjislVr8J5CjvsDvpVFbVo0GFkTjgU0EmweqK7wgWnoub8fTyTFImkG8DQCT8nkGu');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (85,'6112TWY','2015-02-12 03:31',64003.32,NULL,'2015-02-20 06:12',1,'LzfwqMPvMA2pDRYZeefkdjt2iDqUysbHvVEXzXG4LWKLiPDJamG7UeDv3aFO2OwW4CTPG2UbvzfOy6V5rQaItNGFsb6a7pyV0kLxAVnRMGy3dBnxmvP');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (86,'623CMS','2015-02-12 03:31',70078.58,'This is a description 8549848','2015-03-22 07:48',1,'3AoOkonKfW6YnV5dOjhKfjRuWIrWNRJqjOQ7PARxXweyGyAzjilXVuXGv27QqzmwgVRgv53vbZD27wvtdl8AXgi1Xc0TDXIGI3JdbJJ8jmo86OlR0sJBTcWech0pKDLB6PMKofytoW21R6tCXgo6u8XyzI7bYusUhPiU1KnasViRKB7nQwQIYTdKmZiFIJVifKumDsuOpq4he868Qaiecruk03uVSfyrG5ZwdTNgl');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (87,'545KOI',NULL,NULL,'Description number 3330807','2015-01-28 09:25',1,'Qgn8pxxMby');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (88,'244ZTQ','2015-01-20 08:12',8.21,'This is a description 4253009','2015-02-01 07:48',1,'djGBA0isEZHnO4YBEf0D22hnivhnWo8FsZCpjHhAGWgSetilDNhX5peGNBxijJFADswcmHJHGFegOOe28IS33jPZ1JJxz5WM8ZbkBKuUcRcQkwAyK7x0i2CrIQL2ttZ6A7os2Miz7iapTKDrBarLD7OeObOni8nuJ3NOZzQzaSkgAFUYfDHqeS1j7MovdkVtmegzyAZN7qjlaUaKXxmQHiDxlyirfjBpZzQDjvZjVlmN4C');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (89,'244ZTQ',NULL,1408.93,'Description number 6198261','2015-01-25 00:17',0,'JECE6UgP4wm1RK6rkq01CjVxB');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (90,'623CMS',NULL,3.24,'This is a description 4720530','2015-01-13 10:15',1,'6unCthsYOKAfnaMaZUj');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (91,'623CMS','2015-02-06 09:12',73.78,NULL,'2015-06-08 03:21',1,'ZvHYY27KIv08jyjUxYdibg56vIEIOMP66KxUXKJru6FCapu1nKckI26Nmzgz8xCBp0Dv0Hs5wKZfykmYyO1iNNVVWqY4z20qfLsldgvWPhwoqTaEzdcM');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (92,'623CMS','2015-02-06 09:12',65198.63,'This is a description 6199544','2015-04-17 00:32',1,'FV0bovkJZ8s2SWoU2Pt14DJ4wWmP2p4pNG5jmjUfrheB1iFYT1MGyAGAnohhVXrII2eIZbjcMdy6cqJBUkSS2rJG1uQ2fIKyT0mxsNmmsh0ZW52fcGwX566Zq8DO24TDlvAyQ20MSCSmJRzojz5RTESOLngpGtYP');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (93,'207OAM','2015-01-08 06:47',NULL,NULL,'2015-03-27 00:44',1,'W5N4b2mnYNb5dHZwjpb4DI8WEw1362xBc6NGJ7uMPLhk5btXW7vVsz7mXFVnZK4BbkBXCoq1arCCCT5AOHWUKSJEZtTLHIkac1wgpXAJGXioXuaFYAS4HPg7Gv');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (94,'1410YPZ','2015-01-08 06:47',NULL,'Description number 6979617','2015-06-13 00:20',1,'xMh124zEo2lIEVwPnPXtBZ3TJXDOxBEQQKvhvJ1w85zVaopZjHwRx4wPm4hOUnGTq51CWAhkbESGh3lfImRaoxB0rruhlfj7E64TgGmWqkr1lQ1jOVuEDQRF6zHclXFwP1MR5kknvzfKE1HE6EyJktp7j5poLnSumQpNMjJ0NGb4TxqDLXMsHR4JexnbcWm3v8FAzBTjYUYBKCSMsS5lTxMnte');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (95,'623CMS','2015-01-08 06:47',74.15,'Description number 8448423',NULL,NULL,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (96,'1410YPZ','2015-01-28 06:11',7.29,'This is a description 8888098','2015-02-03 02:38',1,'ut7A3lZw4QksW3rcJNeTB5TOvfSfozolGXOvsqUoXIAmJKgjXVauF05yYaSa4wyTkH33HTsuAOVbwkPptVCDGxLcmFvPOsgEbCiNVNkKMWosx2G83dyrwsn3uC4DQA4JDxw58uBZJ88SwxefMK6Y6x2hbIRgQSvt86wjZUi3uB1s8ryZJc1mGCTB1Km88sD7GAseYb71VnTuGwu2PRqlmI4834sdwNL');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (97,'545KOI','2015-01-28 06:11',NULL,'This is a description 6805220','2015-03-20 03:56',1,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (98,'244ZTQ','2015-01-21 03:07',36672.33,'Description number 7126307',NULL,1,NULL);
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (99,'244ZTQ','2015-01-21 03:07',38379.01,NULL,'2015-03-03 03:30',1,'vxpOLnXtWgEPcwiftyIn6txZQvvlyCd4IPkJn5oFygDQSP1z7MB2zZfnX6OnYlvb0zOz74');
 
 
INSERT INTO reparaciones (IdReparacion,Matricula,FechaEntrada,Km,Avería,FechaSalida,Reparado,Observaciones) VALUES (100,'207OAM','2015-02-15 00:21',176.47,'Description number 3916138','2015-03-12 03:23',1,'pYjFbkQjy5sOXn7ihp2gAOPiGjjFdAOsXQXBGqNGBHyRxOAIeJcQg1kvSGkhr8MQWjtVsdk0XDgwRBD5Un6GZ1ylJ2ZoshOmdflzDWI0MSBGQLa64GWqv');
 



 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (1,'2010-09-15','C20',79);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (2,'2005-04-07','C9',92);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (3,'2007-12-03','C9',92);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (4,'2005-09-14','C9',92);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (5,'2014-02-10','C5',59);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (6,'2007-12-25 10:58','C22',59);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (7,'2011-05-29 08:18','C22',59);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (8,'2012-04-08 02:33','C10',100);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (9,'2006-07-26 01:09','C18',100);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (10,'2006-04-21 07:26','C18',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (11,'2013-12-27 09:48','C18',91);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (12,'2005-06-30 00:06','C19',91);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (13,'2013-11-30 02:28','C19',58);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (14,'2007-03-10 09:09','C10',81);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (15,'2001-06-10 01:08','C4',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (16,'2007-07-02 03:12','C4',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (17,'2002-05-09 01:33','C4',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (18,'2006-04-10 09:24','C20',34);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (19,'2014-11-27 02:58','C20',34);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (20,'2010-05-23 04:26','C3',68);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (21,'2012-10-19 05:14','C3',68);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (22,'2002-05-04 05:06','C22',84);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (23,'2008-03-26 00:36','C22',84);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (24,'2005-08-23 08:44','C22',84);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (25,'2002-10-14 03:31','C19',32);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (26,'2000-07-29 03:50','C19',32);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (27,'2000-09-30 04:47','C19',31);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (28,'2002-03-17 06:56','C9',31);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (29,'2006-10-27','C9',89);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (30,'2001-01-08','C13',81);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (31,'2003-10-19','C13',81);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (32,'2011-12-20','C13',81);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (33,'2013-01-23','C10',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (34,'2002-10-09','C10',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (35,'2006-05-09','C12',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (36,'2013-08-10','C5',11);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (37,'2012-07-08','C10',11);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (38,'2001-03-22','C10',11);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (39,'2002-12-13','C4',87);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (40,'2014-07-15','C4',87);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (41,'2001-12-23','C4',87);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (42,'2012-11-06 04:56','C20',35);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (43,'2007-01-22 06:58','C20',88);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (44,'2000-12-28 03:40','C5',88);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (45,'2003-09-12 07:14','C17',83);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (46,'2008-10-01 06:23','C16',83);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (47,'2009-09-11','C16',83);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (48,'2004-12-18 06:46','C22',37);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (49,'2007-11-12 00:28','C8',37);
 
 
INSERT INTO facturas (IdFactura,FechaFactura,CodCliente,IdReparacion) VALUES (50,'2006-10-14 03:07','C8',43);
 



 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E22',77,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E4',51,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E16',71,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E8',96,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E9',80,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E5',40,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',9,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',64,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',72,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',29,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',14,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E5',30,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E19',35,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E14',79,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E19',79,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',69,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E13',95,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',70,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E5',31,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E7',3,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E16',63,5);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E19',92,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',18,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',36,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E12',3,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E6',9,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',22,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E7',56,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E23',55,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E22',91,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E17',23,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',27,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',42,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',17,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E8',26,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',60,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E23',84,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',73,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E16',66,5);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E4',66,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',15,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E19',75,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',66,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',63,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E23',52,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E15',37,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E17',64,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E13',3,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E19',2,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E6',45,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E16',33,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E8',57,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E6',13,5);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',92,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',31,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E4',79,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E13',13,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E22',14,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',87,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E20',21,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E15',65,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',7,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E15',22,5);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E7',22,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',62,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',20,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',88,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E20',99,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E13',36,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E23',60,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E15',36,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E22',71,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E12',33,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E4',56,4);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',95,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E22',4,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E13',96,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E6',55,5);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E21',73,7);
 
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E12',64,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E7',59,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',37,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E18',66,1);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',57,8);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E9',26,3);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E6',49,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',22,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E14',29,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',82,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E11',23,2);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E8',92,7);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',89,6);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E16',27,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E8',71,0);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E10',45,9);
 
 
INSERT INTO intervienen (CodEmpleado,IdReparacion,Horas) VALUES ('E14',33,8);
 



 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R22',38,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R17',22,1);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',75,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R21',39,5);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',88,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',59,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R18',49,4);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',7,9);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',36,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R16',89,9);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R21',26,3);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R23',58,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',70,3);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R7',37,10);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R8',38,3);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R6',14,3);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R24',93,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',55,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R22',37,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',31,2);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R20',91,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R8',65,5);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R10',62,10);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',57,3);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',26,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R25',72,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',74,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R16',19,5);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',34,9);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R7',41,2);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R8',59,2);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R12',97,4);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',30,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R19',5,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',8,1);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R20',42,4);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R23',42,4);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R23',51,2);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R23',19,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R21',78,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R17',33,1);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',99,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R13',73,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R6',23,1);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R14',84,9);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R21',79,8);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R15',87,7);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R18',51,6);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R8',32,2);
 
 
INSERT INTO incluyen (IdRecambio,IdReparacion,Unidades) VALUES ('R16',77,10);
 



 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (4,'P214511',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (8,'A556666',1);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (5,'A556095',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (5,'P348228',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (27,'P593928',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (59,'P901016',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (42,'P901016',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (6,'P622275',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (71,'A716823',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (28,'A716823',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (9,'A221739',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (10,'P593928',1);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (20,'A221739',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (84,'A556666',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (57,'A400055',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (11,'P593928',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (99,'P901016',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (55,'P303817',1);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (93,'A678019',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (79,'A400055',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (9,'A716823',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (9,'P622275',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (54,'A697279',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (33,'A150007',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (15,'P901016',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (40,'A267083',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (1,'P766736',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (56,'A556666',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (45,'A309033',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (76,'P766736',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (12,'A761114',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (98,'A221739',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (92,'A761114',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (56,'P214511',1);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (10,'A556666',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (56,'A267083',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (65,'A963222',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (35,'A271072',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (9,'P593928',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (46,'A150007',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (95,'A221739',2);
 
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (1,'A697279',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (41,'P901016',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (88,'P593928',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (100,'A556095',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (10,'A150007',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (38,'P348228',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (67,'P348228',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (8,'A309033',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (89,'P622275',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (87,'P766736',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (90,'A678019',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (60,'A207285',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (36,'A697279',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (92,'A150007',6);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (22,'A697279',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (82,'P622275',0);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (68,'A221739',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (52,'A150007',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (18,'A697279',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (68,'P622275',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (52,'A761114',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (31,'P348228',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (35,'P575932',8);
 
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (50,'A352719',1);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (83,'P593928',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (65,'A556095',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (90,'A925382',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (43,'P766736',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (93,'P303817',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (45,'A761114',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (27,'A716823',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (37,'A400055',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (37,'A925382',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (75,'A221739',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (7,'A221739',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (33,'P593928',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (50,'P303817',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (30,'P901016',5);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (14,'A963222',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (98,'P348228',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (35,'A221739',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (51,'A877021',4);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (70,'A678019',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (98,'A271072',9);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (45,'A271072',8);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (21,'A556666',6);
 
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (76,'A678019',3);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (78,'A271072',7);
 
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (91,'A400055',2);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (12,'A150007',7);
 
 
INSERT INTO realizan (IdReparacion,Referencia,Horas) VALUES (11,'A271072',2);
 
 


