-----------------------------------------
-- Obligatorio Marzo 2022
-----------------------------------------
-----------------------------------------
-- Creacion de la base de datos
-----------------------------------------

create database oblMARZO2022DatosProfe;
use oblMARZO2022DatosProfe;
SET DATEFORMAT YMD; 

-- CREACION DEL ESQUEMA RELACIONAL

create table Pais(
    IdPais integer not null Primary Key,
    NombreParis varchar(50));

create table Conductor (
    Documento varchar(10) not null Primary Key,
	Nombre varchar(60) not null,
	Sexo char(1) check(Sexo in ('F','M')),
	Direccion varchar(255), 
	FechaNacimiento date,
	IdPais integer not null foreign key references Pais(IdPais));

create table ConductorTelefono (
    Documento varchar(10) not null foreign key references Conductor(Documento),
	Telefono varchar(9) not null
	Primary Key (Documento,Telefono));

create table Programa (
    Nombre varchar(60) not null Primary Key,
	Descripcion varchar(60),
	HoraInicio time,
	HoraFin time);

create table Conduce(
	Nombre varchar(60) not null foreign key references Programa(Nombre),
	Documento varchar(10) not null foreign key references Conductor(Documento),
	Primary Key (Nombre,Documento));
	
create table Usuario (
    Email varchar(60) not null Primary Key,
	Username varchar(50),
	passwordUsuario varchar(50),
	avatar varchar(255), 
	FechaRegistro date);

create table Post(
	Titulo varchar(255) not null Primary Key,
	Contenido varchar(255),
	Resumen varchar(255),
	Imagen varchar(255),
	Nombre varchar(60) not null,
	Documento varchar(10) not null,
	FechaPost date not null,
	Foreign key (Nombre,Documento) references Conduce(Nombre,Documento));	

create table Comentarios(
    IdComentario integer not null Primary Key,
    TextoComentario varchar(255),
	Email varchar(60) not null foreign key references Usuario(Email),
	Titulo varchar(255) not null foreign key references Post(Titulo),
	Fecha Datetime);

create table Privado(
    IdComentario integer not null foreign key references Comentarios(IdComentario),
    Numero integer not null unique,
	Primary Key (IdComentario));

create table Publico(
    IdComentario integer not null foreign key references Comentarios(IdComentario),
	Primary Key (IdComentario));

create table Categoria(
	Nombre varchar(255) not null Primary Key,
	Imagen varchar(255) not null unique,
	Descripcion varchar(255));
	   	  
create table Pertenece (
    NombrePadre varchar(255) not null foreign key references Categoria (Nombre),
    NombreHija varchar(255) not null foreign key references Categoria (Nombre),
    Primary Key (NombreHija));

create table Asigna (
    Titulo varchar(255) not null foreign key references Post (Titulo),
    Nombre varchar(255) not null foreign key references Categoria (Nombre),
    Primary Key (Titulo,Nombre));




insert into Pais (IdPais, NombreParis)values(1,'Uruguay');
insert into Pais (IdPais, NombreParis)values(2,'Argentina');
insert into Pais (IdPais, NombreParis)values(3,'Venezuela');
insert into Pais (IdPais, NombreParis)values(4,'Armenia');

insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('21212121','Roberto Pettinato','M','Luca Prodan 666','19551215',2);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('77777777','Mariano Grondona','M','No soy Julio 4444','19321019',2);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('99999999','Guido Kaczka','M','Está mal pero no tan 999','19780202',2);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('11211234','Alejandro Fantino','M','Anti seleccion 4321','19710926',2);

insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('62742000','Jorge Lanata','M','Av. Bolonqui 333','19600912',2);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('55996612','Verónica Piteyría','F','Bvar. Hermanos Pyte 9876','19780501',1);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('8546543','Jorge Piteyría','M','Bvar. Hermanos Pyte 6789','19750206',1);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('46001002','Lourdes Ferro','F','Ascendente en capricornio 888','19631009',1);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('44615067','Cristina Morón','F','Casi Legrand 8888','19300617',1);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('54228200','Ricardo Musso','M','Verdadero cuarteo 1234','19300617',1);
insert into Conductor (Documento, Nombre, Sexo, Direccion, FechaNacimiento, IdPais) values('60763347','Polo Troconis','M','ni idea 404','19660420',3);

insert into ConductorTelefono ( Documento, Telefono) values ('54228200','099456789');
insert into ConductorTelefono ( Documento, Telefono) values ('54228200','099987654');
insert into ConductorTelefono ( Documento, Telefono) values ('11211234','091123456');
insert into ConductorTelefono ( Documento, Telefono) values ('77777777','092354698');
insert into ConductorTelefono ( Documento, Telefono) values ('21212121','092354698');

insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('Segunda Pelota','Programa deportivo','16:00','17:30');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('Animales Salvajes','Sin desc','00:00','01:30');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('Noticiero','claro, para noticias','08:00','09:00');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('A puro rock','música de verdad','00:00','23:59');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('AgiteDJ','se aceptan ideas','00:00','03:59');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('La Mesa de los Galanes','Perdonen','09:00','11:00');
insert into Programa (Nombre, Descripcion, HoraInicio, HoraFin) values('La Negra Pop','Rock and roll del bueno','19:00','21:00');

insert into Conduce(Nombre, Documento) values('Segunda Pelota','21212121');
insert into Conduce(Nombre, Documento) values('Segunda Pelota','11211234');
insert into Conduce(Nombre, Documento) values('AgiteDJ','44615067');
insert into Conduce(Nombre, Documento) values('La Mesa de los Galanes','11211234');
insert into Conduce(Nombre, Documento) values('La Mesa de los Galanes','77777777');
insert into Conduce(Nombre, Documento) values('A puro rock','54228200');
insert into Conduce(Nombre, Documento) values('A puro rock','21212121');
insert into Conduce(Nombre, Documento) values('Noticiero','62742000');
insert into Conduce(Nombre, Documento) values('Animales Salvajes','99999999');
insert into Conduce(Nombre, Documento) values('La Negra Pop','60763347');


insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('lgateshill0@bing.com','jtobin0','SMOdvxOEkd','http://dummyimage.com/219x100.png/dddddd/000000','1/11/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('tgouldstone1@amazon.com','lportlock1','Ow5lwL','http://dummyimage.com/147x100.png/cc0000/ffffff','7/20/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('dlassell2@sun.com','pleverton2','LP1RZYWR3','http://dummyimage.com/234x100.png/ff4444/ffffff','9/2/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('aputtick3@shop-pro.jp','wjaher3','fjSy9LY','http://dummyimage.com/112x100.png/dddddd/000000','10/9/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('dblaiklock4@g.co','meteoro23','AGd7DYc4eH7m','http://dummyimage.com/116x100.png/cc0000/ffffff','10/7/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('bcolborn5@studiopress.com','dfergie5','UK0Iw1JAO','http://dummyimage.com/248x100.png/ff4444/ffffff','11/16/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('amaclaughlin6@sciencedirect.com','rpartkya6','GAul7mOLFPnO','http://dummyimage.com/224x100.png/cc0000/ffffff','2/1/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('mduer7@blogtalkradio.com','cglinde7','Al0XpwByqwg1','http://dummyimage.com/157x100.png/dddddd/000000','3/2/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('bheare8@amazon.co.uk','hkrollman8','6KAQiKG','http://dummyimage.com/191x100.png/cc0000/ffffff','9/27/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('kearie9@sohu.com','pantowski9','6JFCsFOBZj8c','http://dummyimage.com/216x100.png/cc0000/ffffff','12/6/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('hmcgrorya@nsw.gov.au','sfrida','ZHyttn','http://dummyimage.com/248x100.png/cc0000/ffffff','7/25/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('tchaffinb@geocities.jp','hemmettb','8J7jOUr9JV0','http://dummyimage.com/229x100.png/cc0000/ffffff','7/13/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('vcrathernc@engadget.com','shilbournec','23Bq5tfvaE','http://dummyimage.com/140x100.png/ff4444/ffffff','10/16/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('ccrooksd@jugem.jp','rdomleod','jEGeeWwkWl3','http://dummyimage.com/234x100.png/5fa2dd/ffffff','6/21/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('tleebettere@delicious.com','jmcilveene','UC1Opkn','http://dummyimage.com/171x100.png/ff4444/ffffff','2/3/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('kfidellif@naver.com','alefwichf','aTfvhGIIy','http://dummyimage.com/131x100.png/dddddd/0000','2/17/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('cpusillg@comcast.net','rszymanowiczg','D0JgUp','http://dummyimage.com/127x100.png/cc0000/ffffff','5/18/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('lmitchinerh@businesswire.com','buddenh','VBT7G4cR','http://dummyimage.com/128x100.png/ff4444/ffffff','3/12/2022');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('smccreadyi@angelfire.com','bpischoffi','xZpuM6K','http://dummyimage.com/216x100.png/cc0000/ffffff','6/5/2021');
insert into Usuario (Email, Username, passwordUsuario,avatar, FechaRegistro) values('bweskerj@dyndns.org','owaleranj','iathkfYl','http://dummyimage.com/213x100.png/5fa2dd/ffffff','11/7/2021');

insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Hablemos sin saber', 'El día de hoy hablemos sin saber. Oyentes cuentennos sobre el obligatorio. Los leeremos en vivo','Post sobre el obligatorio realizado por segunda pelota','http://dummyimage.com/213x100.png/5fa2dd/ffffff','Segunda Pelota','21212121','2022-02-05');	
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Reflexionemos por la mañana','¿Con qué canción, como para romper todo, empezarías un casamiento?','#OpinionFija','http://dummyimage.com/213x100.png/5fa2dd/ffffff','Segunda Pelota','11211234','2022-01-20');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('OpinionFija-Ciudadanos ilustres','Si tuvieras que elegir tres ciudadanos ilustres de Montevideo, ¿cuáles serían?','#OpinionFija-CIudadanos Ilustres','http://dummyimage.com/213x100.png/5fa2dd/ffffff','Segunda Pelota','11211234','2022-03-10');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Plenas que enamoran','¿Que tema enamora más?','Post sobre plenas que enamoran','http://dummyimage.com/213x100.png/5fa2dd/ffffff','AgiteDJ','44615067','2022-05-30');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('La Mesa a Playa del Carmen','Toda la información esté en http://qualitytravel.uy Escribinos a lamesa@qualitytravel.uy y reservá tu lugar. Cupos limitados. Escriban y participen de un sorteo.','Post sobre viaje a Playa del Carmen','http://dummyimage.com/213x100.png/5fa2dd/ffffff','La Mesa de los Galanes','11211234','2022-04-15');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Equipo Galáctico','Jorge nos deleité con una imitación de Iñaki, Julio se enfureció y Ricardo inició su campaña para ir a Playa del Carmen.','Post sobre el programa de hoy','http://dummyimage.com/213x100.png/5fa2dd/ffffff','La Mesa de los Galanes','11211234','2022-04-25');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Tema Libre: los invitados que no se van nunca de tu casa','¿Por qué en invierno los hombres se ponen una remera de manga corta debajo del buzo y no de manga larga?','Tema Libre','http://dummyimage.com/213x100.png/5fa2dd/ffffff','La Mesa de los Galanes','77777777','2022-05-08');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Ricoteros VS soderos','¿Por qué elegir uno?','Tema Libre','http://dummyimage.com/213x100.png/5fa2dd/ffffff','A puro rock','54228200','2022-03-05');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('La Historia de Luca','Luca Prodan de Italia, a Inglaterra, para terminar su vida en Argentina','Post sobre el lider de SUMO','http://dummyimage.com/213x100.png/5fa2dd/ffffff','A puro rock','54228200','2022-05-22');
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Hablemos sobre el cuarteto','Claramente el cuarteto de Nos, no del estilo musical','Charla sobre el Cuarteto de Nos','http://dummyimage.com/213x100.png/5fa2dd/ffffff','A puro rock','54228200',SYSDATETIME());
insert into Post (Titulo, Contenido, Resumen, Imagen, Nombre, Documento, FechaPost) values ('Mejor Guitarrista','Debatamos, ¿Quién es el mejor guitarrista de la historia?','Debate sobre el mejor guitarrista','http://dummyimage.com/213x100.png/5fa2dd/ffffff','A puro rock','21212121',SYSDATETIME());

insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (1,'Este obli es lo más','tgouldstone1@amazon.com','Hablemos sin saber',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (2,'Facilito','aputtick3@shop-pro.jp','Hablemos sin saber',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (3,'BD es la ley','dblaiklock4@g.co','Hablemos sin saber',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (4,'Perdón en realidad al final fue difícil','aputtick3@shop-pro.jp','Hablemos sin saber',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (5,'Bitcoin: Un Sistema de Efectivo Electrónico Usuario-a-Usuario','aputtick3@shop-pro.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (6,'Lo que se necesita es un sistema de pagos electrónicos basado en pruebas criptogríficas en vez de confianza, permitiéndole a dos partes interesadas en realizar transacciones directamente sin la necesidad de un tercero confiable','aputtick3@shop-pro.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (7,'El comercio en el Internet ha venido a depender exclusivamente de instituciones financieras las cuales sirven como terceros confiables para el procesamiento de pagos electrónicos.','mduer7@blogtalkradio.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (8,'Alguna de Gerardo Seguro.','mduer7@blogtalkradio.com','Plenas que enamoran',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (9,'La Cita','vcrathernc@engadget.com','Plenas que enamoran',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (10,'Plena, ¿Qué es eso?','hmcgrorya@nsw.gov.au','Plenas que enamoran',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (11,'Yooo quiero','hmcgrorya@nsw.gov.au','La Mesa a Playa del Carmen',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (12,'Participo!','mduer7@blogtalkradio.com','La Mesa a Playa del Carmen',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (13,'Seguro gano!','tleebettere@delicious.com','La Mesa a Playa del Carmen',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (14,'puedo participar?','kfidellif@naver.com','La Mesa a Playa del Carmen',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (15,'Seguro que los redondos','kfidellif@naver.com','Ricoteros VS soderos',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (16,'El pogo más grande del mundo','hmcgrorya@nsw.gov.au','Ricoteros VS soderos',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (17,'Nada más lindo que la música ligera','lmitchinerh@businesswire.com','Ricoteros VS soderos',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (18,'jimi hendrix por lejos','lmitchinerh@businesswire.com','Mejor Guitarrista',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (19,'Nada mas lindo ver a slash en la guitarra','smccreadyi@angelfire.com','Mejor Guitarrista',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (20,'Transacciones completamente norevertibles no son realmente posibles.','smccreadyi@angelfire.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (21,'Dado que las instituciones financieras no pueden evitar mediar disputas.','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (22,'El costo de la mediación incrementa costos de transacción','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (23,'limitando el tamño mínimo práctico por transacción y eliminando la posibilidad de pequeñas transacciones casuales','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (24,'Hay un costo más amplio en la pórdida de la habilidad de hacer pagos no-reversibles por servicios no-reversibles. ','aputtick3@shop-pro.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (25,'Con la posibilidad de revertir, la necesidad de confianza se expande. Los comerciantes deben tener cuidado de sus clientes','aputtick3@shop-pro.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (26,'Molestándolos pidiendo más información de la que se necesitaría de otro modo','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (27,'Un cierto porcentaje de fraude es aceptable como inevitable','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (28,'Estos costos e incertidumbres de pagos pueden ser evitadas en persona utilizando dinero físico','hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (29,'pero no existe un mecanismo para hacer pagos por un canal de comunicación sin un tercero confiable','tchaffinb@geocities.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (30,'Lo que se necesita es un sistema de pagos electrónicos basado en pruebas criptográficas en vez de confianza','tchaffinb@geocities.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (31,'Permitiéndole a dos partes interesadas en realizar transacciones directamente sin la necesidad de un tercero confiable','vcrathernc@engadget.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (32,'Las transacciones que son computacionalmente poco factibles de revertir protegerían a los vendedores de fraude','vcrathernc@engadget.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (33,'mecanismos de depósitos de fideicomisos de rutina podrían ser fácilmente implementados para proteger a los compradores','ccrooksd@jugem.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (34,'En este trabajo, proponemos una solución al problema del doble-gasto utilizando un servidor de marcas de tiempo','ccrooksd@jugem.jp','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (35,'Usuario-a-usuario distribuido para generar una prueba computacional del orden cronológico de las transacciones','kfidellif@naver.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (36,'El sistema es seguro mientras que nodos honestos controlen colectivamente','cpusillg@comcast.net','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (37,'Más poder de procesamiento (CPU) que cualquier grupo de nodos atacantes en cooperación','kearie9@sohu.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (38,'El problema claro es que el beneficiario no puede verificar si uno de los dueños no se hizo un doble-gasto de la moneda','kearie9@sohu.com','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios (IdComentario, TextoComentario, Email,Titulo,Fecha) values (39,'Una solución común es introducir una autoridad','kearie9@sohu.com','Reflexionemos por la mañana',SYSDATETIME());

insert into Privado (IdComentario, Numero) values(1,101);
insert into Privado (IdComentario, Numero) values(5,102);
insert into Privado (IdComentario, Numero) values(6,103);
insert into Privado (IdComentario, Numero) values(7,104);
insert into Privado (IdComentario, Numero) values(9,105);
insert into Privado (IdComentario, Numero) values(17,106);

insert into Publico(IdComentario)values(2);
insert into Publico(IdComentario)values(3);
insert into Publico(IdComentario)values(4);
insert into Publico(IdComentario)values(8);
insert into Publico(IdComentario)values(10);
insert into Publico(IdComentario)values(11);
insert into Publico(IdComentario)values(12);
insert into Publico(IdComentario)values(13);
insert into Publico(IdComentario)values(14);
insert into Publico(IdComentario)values(15);
insert into Publico(IdComentario)values(16);
insert into Publico(IdComentario)values(18);
insert into Publico(IdComentario)values(19);

insert into Categoria(Nombre, Imagen,Descripcion)values('Música','http://dummyimage.com/213x100.png/5fa2dd/ffffff','Género general de música');
insert into Categoria(Nombre, Imagen,Descripcion)values('Rock','http://dummyimage.com/131x100.png/dddddd/000000','Categoría general de rock');
insert into Categoria(Nombre, Imagen,Descripcion)values('Pop','http://dummyimage.com/216x100.png/cc0000/ffffff','Categoría general de Pop');
insert into Categoria(Nombre, Imagen,Descripcion)values('Plena','http://dummyimage.com/128x100.png/ff4444/ffffff','Categoría general de Plena');
insert into Categoria(Nombre, Imagen,Descripcion)values('Noticias','http://dummyimage.com/127x100.png/cc0000/ffffff','Contiene todo lo relacionado a noticias');
insert into Categoria(Nombre, Imagen,Descripcion)values('Humor','http://dummyimage.com/171x100.png/ff4444/ffffff','Por decir algo');
insert into Categoria(Nombre, Imagen,Descripcion)values('Rock Alternativo','http://dummyimage.com/234x100.png/5fa2dd/ffffff','Sub cat de Rock');

insert into Pertenece (NombrePadre, NombreHija) values('Música','Rock');
insert into Pertenece values('Música','Pop');
insert into Pertenece values('Música','Plena');
insert into Pertenece values('Rock','Rock Alternativo');

insert into Asigna (Titulo,Nombre) values('Hablemos sin saber','Humor');
insert into Asigna (Titulo,Nombre) values('Reflexionemos por la mañana','Humor');
insert into Asigna (Titulo,Nombre) values('OpinionFija-Ciudadanos ilustres','Humor');
insert into Asigna (Titulo,Nombre) values('Plenas que enamoran','Música');
insert into Asigna (Titulo,Nombre) values('Plenas que enamoran','Plena');
insert into Asigna (Titulo,Nombre) values('La Mesa a Playa del Carmen','Noticias');
insert into Asigna (Titulo,Nombre) values('Equipo Galáctico','Noticias');
insert into Asigna (Titulo,Nombre) values('Tema Libre: los invitados que no se van nunca de tu casa','Humor');
insert into Asigna (Titulo,Nombre) values('Ricoteros VS soderos','Música');
insert into Asigna (Titulo,Nombre) values('Ricoteros VS soderos','Rock');
insert into Asigna (Titulo,Nombre) values('La Historia de Luca','Música');
insert into Asigna (Titulo,Nombre) values('La Historia de Luca','Rock');
insert into Asigna (Titulo,Nombre) values('La Historia de Luca','Rock Alternativo');
insert into Asigna (Titulo,Nombre) values('Hablemos sobre el cuarteto','Música');
insert into Asigna (Titulo,Nombre) values('Hablemos sobre el cuarteto','Rock');
insert into Asigna (Titulo,Nombre) values('Hablemos sobre el cuarteto','Rock Alternativo');
insert into Asigna (Titulo,Nombre) values('Mejor Guitarrista','Música');
insert into Asigna (Titulo,Nombre) values('Mejor Guitarrista','Rock');



insert into Programa values('Reflexionemos por la mañana','Ahora si va a traer datos','06:00','08:00');
insert into Conduce values('Reflexionemos por la mañana','11211234');

update post set Nombre='Reflexionemos por la mañana' where Titulo='Reflexionemos por la mañana';

insert into Comentarios values(40,'Ser o no ser esa es la cuestion', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(41,'Me gusta el frio, pero no tanto Sorteo', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(42,'El invierno esta pegando duro', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(43,'El pasado no puede ser cambiado, el futuro esta en tus manos', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(44,'Sorteo Alguien mas considera que 20 fue mucho?', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(45,'Este es un comentario muy profundo', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(46,'Otro mas Sorteo profundo para reflexionar', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(47,'Ser o no ser esa es la cuestion', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(48,'OMG faltan mas comentarios', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(49,'En serio, pro tip nunca mas poner mas de 5', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(50,'A veces aquello que no podemos comprender, comienza a tener sentido con el tiempo.(o cuando estudiamos)', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(51,'Si los comentarios le sacaron una sonrisa valieron la pena escribirlos. Aunque mas valeran si entienden porque los creamos', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(52,'Vamos queda poco', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(53,'OMG termine?', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(54,'ups faltaba uno', 'hmcgrorya@nsw.gov.au','Reflexionemos por la mañana',SYSDATETIME());
insert into Comentarios values(55,'Ahora tocan los Sorteos', 'dblaiklock4@g.co','La Historia de Luca',SYSDATETIME());
insert into Comentarios values(56,'Sorteos varios', 'tchaffinb@geocities.jp','La Historia de Luca',SYSDATETIME());
insert into Comentarios values(57,'Habia una vez un Sorteo muy loco', 'dblaiklock4@g.co','Hablemos sobre el cuarteto',SYSDATETIME());

ALTER TABLE post NOCHECK CONSTRAINT ALL
UPDATE POST SET Documento='77777777'WHERE Titulo='La Historia de Luca'
ALTER TABLE post CHECK CONSTRAINT ALL

insert into conduce values('A puro rock','77777777');
insert into Privado values(44,110);
insert into Privado values(46,108);
insert into Privado values(55,109);
insert into Privado values(56,107);
insert into Privado values(57,111);



---------------------------------------------------- CONSULTAS --------------------------------------------------

--1)Listar los nombres de los conductores con la mayor cantidad de posteos escritos en los programas que conducen.

SELECT c.nombre AS Nombre_Conductor
from post p, conductor c
where p.Documento = c.Documento
group by p.nombre, c.nombre
having count(p.Documento) = (SELECT MAX(a.Cantidad_de_posts)
							FROM (SELECT p2.nombre AS Nom_Programa, c.nombre AS Nom_Conductor ,COUNT(p2.documento) as Cantidad_de_posts
							from post p2, conductor c
							where p2.Documento = c.Documento and p2.Nombre = p.Nombre
							group by p2.nombre, c.nombre) a)

							--Esta consulta muestra el Conductor con mas posts escritos en los programas que conducen. NO
							--el conductor con mas posts escritos.
							--Para verlo mejor se puede anadir esta linea luego del primer SELECT
							-- COUNT(p.documento) AS Cantidad_Posts, p.nombre AS Nombre_Programa


--2. Mostrar todos los datos de los usuarios con más de 20 comentarios en el último mes para el programa “Reflexionemos por la manana”.

--PRIMER SELECT: MUESTRA TODOS LOS DATOS DE LOS USUARIOS QUE CUMPLAN LAS CONDICIONES DE LAS DOS SUBQUERYS
select *
from Usuario	
where email in (select a.email
						--SEGUNDO SELECT: MUESTRA LOS USUARIOS QUE TIENEN MAS DE 20 COMENTARIOS
						--TERCER SELECT : MUESTRA A TODOS LOS USUARIOS QUE COMENTARON EN LOS POST DEL PROGRAMA “Reflexionemos por la manana”
				from (select c.email, count(c.email) as cant_comentarios, p.Nombre 
						from Comentarios c 
						inner join post p on c.Titulo = p.Titulo
						inner join Programa pro on pro.Nombre = p.Nombre 
						and p.Nombre = 'Reflexionemos por la mañana'
						and c.fecha > DATEADD(month, -1, GETDATE())
						group by c.Email, p.Nombre) a
						group by a.email
						having sum(a.cant_comentarios) > 20)





--3. Listar todos los datos de los programas que no realizaron ningún posteo en el último año.

--PRIMER SELECT: MUESTRA LOS PROGRAMAS QUE NO SE ENCUENTRAN ENTRE LOS QUE POSTEARON EN EL ULTIMO ANIO
select  *
from Programa
where Nombre not in (select p.Nombre AS Nombre_Programa --SEGUNDO SELECT: MUESTRA LOS PROGRAMAS QUE POSTEARON EN EL ULTIMO ANIO
					from post p 
					inner join Programa pro on pro.Nombre = p.Nombre 
					and p.FechaPost > DATEADD(year, -1, GETDATE())
					group by p.Nombre);








--4)Mostrar el nombre del conductor y el nombre del programa que realizaron posteos pero no tienen ningún comentario realizado por los usuarios. 

select con.nombre, pro.Nombre
from post p	, programa pro, conductor con					
where pro.nombre = p.nombre and con.Documento = p.Documento 
and p.Titulo not in (select p.titulo
					from Comentarios c
					where p.Titulo = c.Titulo);





/*5. Listar el nombre del programa, el título del post, el nombre de la categoría y el texto de
los comentarios que contengan la palabra “Sorteo”, únicamente de los comentarios
privados y de la categoría de Música. Ordenar el resultado por el numero de los
comentarios privados de forma descendente.*/

SELECT pro.Nombre, pos.Titulo, cat.Nombre,Com.TextoComentario
FROM programa pro, post pos, categoria cat, Comentarios com, asigna a, Privado pri
WHERE pro.nombre = pos.Nombre 
and pos.Titulo = a.Titulo 
and cat.Nombre = a.Nombre
and pos.Titulo = com.Titulo
and com.IdComentario = pri.IdComentario
and com.TextoComentario like '%sorteo%'
and cat.Nombre = 'Música'
group by pro.Nombre,  cat.Nombre, com.IdComentario ,pos.Titulo, Com.TextoComentario, pri.Numero
order by pri.Numero desc 








/*6. Listar los comentarios, la fecha en que se realizó, en que programa y el nombre del
conductor de los comentarios realizados por el username “meteoro23” para aquellos
conductores que nacieron en Argentina.*/

--CON INNER JOIN
select c.TextoComentario, c.Fecha, pro.Nombre AS Nombre_Programa, con.Nombre AS Nombre_Conductor
from Post p
inner join Comentarios c on p.Titulo = c.Titulo
inner join Usuario u on c.Email = u.Email and u.Username = 'meteoro23'
inner join Pais pa on pa.NombreParis = 'Argentina'
inner join Programa pro on pro.Nombre = p.Nombre 
inner join Conductor con on con.IdPais = pa.IdPais and p.Documento = con.Documento


/*7. Mostrar el nombre y descripción de las categorías que tengan la máxima cantidad de
posteos realizados.*/ 

select c.nombre, c.Descripcion
from asigna a, categoria c , post p
where c.Nombre = a.Nombre
and a.Titulo = p.Titulo
group by c.Nombre, c.Descripcion
having count(p.Titulo) = (select max(a.max_cant_post_realizados) -- Aca indica cual es la maxima cantidad de post que tiene una sola categoria
							from (select c.nombre, count(p.Titulo) as max_cant_post_realizados --En este select muestra la categoria y la cantida de posts de dicha categoria
							from asigna a, categoria c , post p
							where c.Nombre = a.Nombre
							and a.Titulo = p.Titulo
							group by c.Nombre) a)















select c.TextoComentario, c.Fecha,  pro.Nombre, con.Nombre
from post p, Comentarios c, usuario u, Conductor con, pais pa, programa pro
where p.Titulo = c.Titulo
and c.Email = u.Email
and u.Username = 'meteoro23'
and p.Documento = con.Documento
and pa.IdPais = con.IdPais
and pa.NombreParis = 'Argentina'
and pro.Nombre = p.Nombre

select c.nombre, c.Descripcion
from asigna a, categoria c , post p
where c.Nombre = a.Nombre
and a.Titulo = p.Titulo
group by c.Nombre, c.Descripcion
having count(p.Titulo) = (select max(a.max_cant_post_realizados) -- Aca indica cual es la maxima cantidad de post que tiene una sola categoria
							from (select c.nombre, count(p.Titulo) as max_cant_post_realizados --En este select muestra la categoria y la cantida de posts de dicha categoria
							from asigna a, categoria c , post p
							where c.Nombre = a.Nombre
							and a.Titulo = p.Titulo
							group by c.Nombre) a)
 
