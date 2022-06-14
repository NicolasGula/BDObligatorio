-----------------------------------------
-- Obligatorio Marzo 2022
-----------------------------------------
-----------------------------------------
-- Creacion de la base de datos
-----------------------------------------

create database oblMARZO2022;
use oblMARZO2022;
drop database oblMARZO2022;
SET DATEFORMAT YDM;
use master;

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
---------------------------------------------------- PAIS -----------------------------------------------
INSERT INTO Pais VALUES (1, 'Uruguay');
INSERT INTO Pais VALUES (2, 'Brasil');
INSERT INTO Pais VALUES (3, 'Argentina');
INSERT INTO Pais VALUES (4, 'Chile');
INSERT INTO Pais VALUES (5, 'Peru');
INSERT INTO Pais VALUES (6, 'Colombia');
INSERT INTO Pais VALUES (7, 'Bolivia');
INSERT INTO Pais VALUES (8, 'Venezuela');
INSERT INTO Pais VALUES (9, 'Ecuador');
INSERT INTO Pais VALUES (10, 'Panama');

select * from Conductor
---------------------------------------------------- CONDUCTOR -----------------------------------------------
INSERT INTO Conductor VALUES ('49893452', 'Nicolas Gula', 'M', 'Propios 4567', CAST('1989/12/01' as date) ,1);
INSERT INTO Conductor VALUES ('34562341', 'Diego Rey', 'M', ' Baltasar Brum 7530',CAST('1989/12/01' as date) ,2);
INSERT INTO Conductor VALUES ('23454563', 'Nicolas Cozzo', 'M', 'Neptuno 9797',CAST('1989/12/01' as date) ,3);
INSERT INTO Conductor VALUES ('23154563', 'Gonzalo Fabregas', 'M', 'Misiones 8925',CAST('1989/12/01' as date) ,4);
INSERT INTO Conductor VALUES ('76544553', 'Nahuel Baston', 'M', 'Piedras 8851',CAST('1989/12/01' as date) ,5);
INSERT INTO Conductor VALUES ('34528907', 'Mario Sanabria', 'M', 'Gustavo Nicolich 7231',CAST('1989/12/01' as date) ,6);
INSERT INTO Conductor VALUES ('28907864', 'Michael Perez', 'M', 'Sarandí 3511',CAST('1989/12/01' as date) ,7);
INSERT INTO Conductor VALUES ('42315679', 'Brayan Dominguez', 'M', 'Ombù 6584',CAST('1989/12/01' as date) ,8);
INSERT INTO Conductor VALUES ('48907865', 'Noleia Larrosa', 'F', 'Olimpo 9384',CAST('1989/12/01' as date) ,9);
INSERT INTO Conductor VALUES ('34233454', 'Mirtha Aguilera', 'F', 'Guaviyu 2172',CAST('1989/12/01' as date) ,10);
INSERT INTO Conductor VALUES ('43452786', 'Iohjan Liscano', 'M', 'Mirasoles 8672',CAST('1989/12/01' as date) ,9);
INSERT INTO Conductor VALUES ('21342345', 'Marta Cruz', 'F', 'Republica de Chile 6700',CAST('1989/12/01' as date) ,8);
INSERT INTO Conductor VALUES ('31231232', 'Lorena Flores', 'F', 'Costanera 3648',CAST('1989/12/01' as date) ,7);
INSERT INTO Conductor VALUES ('21765873', 'Laura Andrade', 'F', 'Coronilla 7940',CAST('1989/12/01' as date) ,6);
INSERT INTO Conductor VALUES ('49009003', 'Romina Gutierrez', 'F', 'Guayabos 5465',CAST('1989/12/01' as date) ,5);
INSERT INTO Conductor VALUES ('21322342', 'Maria Noel Lopez', 'F', 'Democracia 6957',CAST('1989/12/01' as date) ,6);
INSERT INTO Conductor VALUES ('23464563', 'Carlos Tanco', 'M', 'Paso Rivero 6355',CAST('1989/12/01' as date) ,7);
INSERT INTO Conductor VALUES ('12354567', 'Gonzalo Camarotta', 'M', 'Acuña de Figeroa 9953',CAST('1989/12/01' as date) ,8);
INSERT INTO Conductor VALUES ('32344321', 'Salvador Banchero', 'M', 'Leandro Gomez 7219',CAST('1989/12/01' as date) ,9);
INSERT INTO Conductor VALUES ('23241231', 'Gonzalo Rey', 'M', 'Florianapolis 2743',CAST('1989/12/01' as date) ,2);
INSERT INTO Conductor VALUES ('43542318', 'Carla Sparza', 'F', 'Del Monte 7341',CAST('1989/12/01' as date) ,1);
INSERT INTO Conductor VALUES ('26786678', 'Penelope Cruz', 'F', ' Brisas 2703',CAST('1989/12/01' as date) ,1);
INSERT INTO Conductor VALUES ('54564567', 'Miesha Tate', 'F', 'Democracia 7015',CAST('1989/12/01' as date) ,6);
INSERT INTO Conductor VALUES ('52524262', 'Loco abreu', 'M', 'Democracia 7115',CAST('1989/12/01' as date) ,6);
INSERT INTO Conductor VALUES ('51514161', 'Mario Gibert', 'M', 'Astucia 2714',CAST('1989/12/01' as date) ,2);
INSERT INTO Conductor VALUES ('12345678', 'Mario Pergolini', 'M', 'Clemencia 2714',CAST('1989/12/01' as date) ,3);
---------------------------------------------------- CONDUCTOR TELEFONO -----------------------------------------------
INSERT INTO ConductorTelefono VALUES ('49893452' ,'098678567');
INSERT INTO ConductorTelefono VALUES ('49893452', '093234245');
INSERT INTO ConductorTelefono VALUES ('34562341', '098567394');
INSERT INTO ConductorTelefono VALUES ('23454563', '098123234');
INSERT INTO ConductorTelefono VALUES ('23154563', '092123234');
INSERT INTO ConductorTelefono VALUES ('76544553', '094234675');
INSERT INTO ConductorTelefono VALUES ('34528907', '091123123');
INSERT INTO ConductorTelefono VALUES ('28907864', '098999089');
INSERT INTO ConductorTelefono VALUES ('42315679', '093123324');
INSERT INTO ConductorTelefono VALUES ('48907865', '098093456');
INSERT INTO ConductorTelefono VALUES ('34233454', '091567555');
INSERT INTO ConductorTelefono VALUES ('43452786', '091111111');
INSERT INTO ConductorTelefono VALUES ('21342345', '092222222');
INSERT INTO ConductorTelefono VALUES ('31231232', '093333333');
INSERT INTO ConductorTelefono VALUES ('21765873', '093444444');
INSERT INTO ConductorTelefono VALUES ('49009003', '093555555');
INSERT INTO ConductorTelefono VALUES ('21322342', '096234234');
INSERT INTO ConductorTelefono VALUES ('23464563', '097456456');
INSERT INTO ConductorTelefono VALUES ('12354567', '098111222');
INSERT INTO ConductorTelefono VALUES ('32344321', '098898898');
INSERT INTO ConductorTelefono VALUES ('23241231', '098345111');
INSERT INTO ConductorTelefono VALUES ('43542318', '099900900');
INSERT INTO ConductorTelefono VALUES ('26786678', '091222222');
INSERT INTO ConductorTelefono VALUES ('54564567', '098123343');
---------------------------------------------------- PROGRAMA -----------------------------------------------
INSERT INTO Programa VALUES('No toquen nada', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'08:00', '09:00');
INSERT INTO Programa VALUES('Justicia Infinita', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'09:00', '11:00');
INSERT INTO Programa VALUES('Malos Pensamientos', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'11:00', '13:00');
INSERT INTO Programa VALUES('La hora de los deportes', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'13:00', '14:00');
INSERT INTO Programa VALUES('Musica Clasica', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'14:00', '15:00');
INSERT INTO Programa VALUES('Base de datos', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'15:00', '15:30');
INSERT INTO Programa VALUES('Machine Learning para Dummys', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'15:31', '16:00');
INSERT INTO Programa VALUES('Anonymus', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'16:00', '17:00');
INSERT INTO Programa VALUES('Enredados en el USB', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'17:00', '19:00');
INSERT INTO Programa VALUES('Tas pa la papaya', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'19:00', '22:00');
INSERT INTO Programa VALUES('Malos Pensamientos 2', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'22:00', '00:00');
INSERT INTO Programa VALUES('Musica para programar all night', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'00:00', '08:00');
INSERT INTO Programa VALUES('Programa sin comentarios', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'00:00', '02:00');
INSERT INTO Programa VALUES('Reflexionemos por la mañana', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'00:00', '02:00');
INSERT INTO Programa VALUES('CQC Radio', 
							'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
							'02:00', '04:00');
---------------------------------------------------- CONDUCE -----------------------------------------------
INSERT INTO Conduce VALUES ('No toquen nada', '49893452');
INSERT INTO Conduce VALUES ('No toquen nada', '34562341');
INSERT INTO Conduce VALUES ('No toquen nada', '23454563')
INSERT INTO Conduce VALUES ('Justicia Infinita', '23464563');
INSERT INTO Conduce VALUES ('Justicia Infinita', '12354567');
INSERT INTO Conduce VALUES ('Justicia Infinita', '32344321');
INSERT INTO Conduce VALUES ('Malos Pensamientos', '23154563');
INSERT INTO Conduce VALUES ('Malos Pensamientos', '76544553');
INSERT INTO Conduce VALUES ('Malos Pensamientos', '34528907');
INSERT INTO Conduce VALUES ('La hora de los deportes', '28907864');
INSERT INTO Conduce VALUES ('La hora de los deportes', '42315679');
INSERT INTO Conduce VALUES ('La hora de los deportes', '48907865');
INSERT INTO Conduce VALUES ('Musica Clasica', '34233454');
INSERT INTO Conduce VALUES ('Base de datos', '43452786');
INSERT INTO Conduce VALUES ('Base de datos', '21342345');
INSERT INTO Conduce VALUES ('Base de datos', '31231232');
INSERT INTO Conduce VALUES ('Base de datos', '21765873');
INSERT INTO Conduce VALUES ('Machine Learning para Dummys', '49009003');
INSERT INTO Conduce VALUES ('Machine Learning para Dummys', '21322342');
INSERT INTO Conduce VALUES ('Anonymus', '23241231');
INSERT INTO Conduce VALUES ('Enredados en el USB', '43542318');
INSERT INTO Conduce VALUES ('Tas pa la papaya', '26786678');
INSERT INTO Conduce VALUES ('Malos Pensamientos 2', '54564567');
INSERT INTO Conduce VALUES ('Programa sin comentarios', '52524262');
INSERT INTO Conduce VALUES ('Reflexionemos por la mañana', '51514161')
INSERT INTO Conduce VALUES ('CQC Radio', '12345678')

---------------------------------------------------- USUARIO -----------------------------------------------
INSERT INTO Usuario VALUES ('usuario1@gmail.com', 'usuario1', 'soyelusuario1','https://i.pravatar.cc/200', CAST('2018/12/05' as date));
INSERT INTO Usuario VALUES ('usuario2@gmail.com', 'usuario2', 'soyelusuario2','https://i.pravatar.cc/100', CAST( '2016/12/02' AS DATE));
INSERT INTO Usuario VALUES ('usuario3@gmail.com', 'usuario3', 'soyelusuario3','https://i.pravatar.cc/300', CAST('2020/05/03'  AS DATE));
INSERT INTO Usuario VALUES ('usuario4@gmail.com', 'usuario4', 'soyelusuario4','https://i.pravatar.cc/400', CAST('2021/06/02' AS DATE));
INSERT INTO Usuario VALUES ('usuario5@gmail.com', 'usuario5', 'soyelusuario5','https://i.pravatar.cc/600',CAST('2019/11/01' AS DATE) );
INSERT INTO Usuario VALUES ('usuario6@gmail.com', 'usuario6', 'soyelusuario6','https://i.pravatar.cc/200', CAST('2021/12/04' AS DATE));
INSERT INTO Usuario VALUES ('usuario7@gmail.com', 'usuario7', 'soyelusuario7','https://i.pravatar.cc/200', CAST('2018/10/06' AS DATE));
INSERT INTO Usuario VALUES ('usuario8@gmail.com', 'usuario8', 'soyelusuario8','https://i.pravatar.cc/200', CAST('2016/06/02' AS DATE));
INSERT INTO Usuario VALUES ('usuario9@gmail.com', 'usuario9', 'soyelusuario9','https://i.pravatar.cc/200', CAST('2012/04/08' AS DATE));
INSERT INTO Usuario VALUES ('usuario10@gmail.com', 'usuario10', 'soyelusuario10','https://i.pravatar.cc/200',CAST('2013/03/03' AS DATE) );
INSERT INTO Usuario VALUES ('usuario11@gmail.com', 'usuario11', 'soyelusuario11','https://i.pravatar.cc/200', CAST('2015/03/05' AS DATE));
INSERT INTO Usuario VALUES ('usuario12@gmail.com', 'usuario12', 'soyelusuario12','https://i.pravatar.cc/200',CAST('2017/01/03' AS DATE));
INSERT INTO Usuario VALUES ('usuario13@gmail.com', 'usuario13', 'soyelusuario13','https://i.pravatar.cc/200',CAST('2017/07/02' AS DATE) );
INSERT INTO Usuario VALUES ('usuario14@gmail.com', 'usuario14', 'soyelusuario14','https://i.pravatar.cc/200',CAST('2021/06/02' AS DATE));
INSERT INTO Usuario VALUES ('usuario15@gmail.com', 'usuario15', 'soyelusuario15','https://i.pravatar.cc/200',CAST('2015/11/01' AS DATE) );
INSERT INTO Usuario VALUES ('usuario16@gmail.com', 'usuario16', 'soyelusuario16','https://i.pravatar.cc/200',CAST('2012/10/01' AS DATE) );
INSERT INTO Usuario VALUES ('usuario17@gmail.com', 'usuario17', 'soyelusuario17','https://i.pravatar.cc/200',CAST('2021/12/01' AS DATE) );
INSERT INTO Usuario VALUES ('usuario18@gmail.com', 'usuario18', 'soyelusuario18','https://i.pravatar.cc/200',CAST('2011/03/05' AS DATE) );
INSERT INTO Usuario VALUES ('usuario19@gmail.com', 'usuario19', 'soyelusuario19','https://i.pravatar.cc/300',CAST('2012/06/04' AS DATE) );
INSERT INTO Usuario VALUES ('usuario20@gmail.com', 'usuario20', 'soyelusuario20','https://i.pravatar.cc/600',CAST('2012/04/06' AS DATE) );
INSERT INTO Usuario VALUES ('usuario21@gmail.com', 'usuario21', 'soyelusuario21','https://i.pravatar.cc/100',CAST('2013/03/07' AS DATE) );
INSERT INTO Usuario VALUES ('usuario22@gmail.com', 'usuario22', 'soyelusuario22','https://i.pravatar.cc/200',CAST('2014/06/08' AS DATE) );
INSERT INTO Usuario VALUES ('usuario23@gmail.com', 'usuario23', 'soyelusuario23','https://i.pravatar.cc/300', CAST('2015/02/09' AS DATE));
INSERT INTO Usuario VALUES ('usuario24@gmail.com', 'usuario24', 'soyelusuario24','https://i.pravatar.cc/400',CAST('2019/01/02' AS DATE) );
INSERT INTO Usuario VALUES ('usuario25@gmail.com', 'usuario25', 'soyelusuario25','https://i.pravatar.cc/100', CAST('2021/02/03' AS DATE));
INSERT INTO Usuario VALUES ('meteoro23@gmail.com', 'meteoro23', 'soyelusuariometeoro23','https://i.pravatar.cc/100', CAST('2021/02/03' AS DATE));
---------------------------------------------------- POST -----------------------------------------------
INSERT INTO Post VALUES('Post 1', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen1.jpg','No toquen nada', '49893452', '2021/02/02' );
INSERT INTO Post VALUES('Post 2', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen2.jpg','No toquen nada', '49893452','2019/12/06');
INSERT INTO Post VALUES('Post 3', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen3.jpg','No toquen nada', '49893452','2017/05/03');
INSERT INTO Post VALUES('Post 4', 'Lorem ipsum bla blabla', 'Bla bla', 'imageN4.jpg','No toquen nada', '34562341', '2020/10/07');
INSERT INTO Post VALUES('Post 5', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen5.jpg','No toquen nada', '34562341', '2020/12/02');
INSERT INTO Post VALUES('Post 6', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen6.jpg', 'No toquen nada', '34562341', '2019/03/09');
INSERT INTO Post VALUES('Post 7', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen7.jpg','Justicia Infinita', '23464563', '2018/01/03');
INSERT INTO Post VALUES('Post 8', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen8.jpg','Justicia Infinita', '23464563', '2017/02/11');
INSERT INTO Post VALUES('Post 9', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen9.jpg','Malos Pensamientos', '23154563', '2016/12/02');
INSERT INTO Post VALUES('Post 10', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen10.jpg','Malos Pensamientos', '23154563', '2020/11/06');
INSERT INTO Post VALUES('Post 11', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen11.jpg','Malos Pensamientos', '23154563', '2022/06/02');
INSERT INTO Post VALUES('Post 12', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen12.jpg','Malos Pensamientos', '34528907', '2022/12/02');
INSERT INTO Post VALUES('Post 13', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen13.jpg','Malos Pensamientos', '34528907', '2021/10/10');
INSERT INTO Post VALUES('Post 14', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen14.jpg','La hora de los deportes', '28907864', '2018/04/04');
INSERT INTO Post VALUES('Post 15', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen15.jpg','La hora de los deportes', '28907864', '2014/07/09');
INSERT INTO Post VALUES('Post 16', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen16.jpg','La hora de los deportes', '28907864', '2017/06/04');
INSERT INTO Post VALUES('Post 17', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen17.jpg','La hora de los deportes', '28907864', '2019/05/04');
INSERT INTO Post VALUES('Post 18', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen18.jpg','La hora de los deportes', '28907864', '2020/04/19');
INSERT INTO Post VALUES('Post 19', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen19.jpg','Musica Clasica', '34233454', '2020/03/06');
INSERT INTO Post VALUES('Post 20', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen20.jpg','Base de datos', '43452786','2020/02/12');
INSERT INTO Post VALUES('Post 21', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen21.jpg','Base de datos', '43452786', '2019/01/12');
INSERT INTO Post VALUES('Post 22', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen22.jpg','Base de datos', '43452786', '2018/12/11');
INSERT INTO Post VALUES('Post 23', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen23.jpg','Base de datos', '43452786','2020/11/10');
INSERT INTO Post VALUES('Post 24', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen24.jpg','Base de datos', '43452786', '2015/10/12');
INSERT INTO Post VALUES('Post 25', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen25.jpg','Base de datos', '43452786', '2019/09/12');
INSERT INTO Post VALUES('Post 26', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen26.jpg','Base de datos', '43452786','2020/08/03');
INSERT INTO Post VALUES('Post 27', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen27.jpg','Base de datos', '43452786', '2020/07/03');
INSERT INTO Post VALUES('Post 28', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen28.jpg','Machine Learning para Dummys', '49009003', '2019/06/11');
INSERT INTO Post VALUES('Post 29', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen33.jpg','Anonymus', '23241231', '2020/05/11');
INSERT INTO Post VALUES('Post 30', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen34.jpg','Anonymus', '23241231', '2020/04/12');
INSERT INTO Post VALUES('Post 31', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen38.jpg','Enredados en el USB', '43542318','2021/03/02');
INSERT INTO Post VALUES('Post 32', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen42.jpg','Tas pa la papaya', '26786678','2021/02/12');
INSERT INTO Post VALUES('Post 33', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen49.jpg','Malos Pensamientos 2', '54564567','2021/01/02');
INSERT INTO Post VALUES('Post 34', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen49.jpg','Programa sin comentarios', '52524262','2022/01/05');
INSERT INTO Post VALUES('Post 35', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Reflexionemos por la mañana', '51514161','2022/05/29');
INSERT INTO Post VALUES('Post 36', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Reflexionemos por la mañana', '51514161','2022/05/29');

INSERT INTO Post VALUES('Post 37', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2012/05/29');
INSERT INTO Post VALUES('Post 38', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2013/05/29');
INSERT INTO Post VALUES('Post 39', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2015/05/29');
INSERT INTO Post VALUES('Post 40', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2017/05/29');
INSERT INTO Post VALUES('Post 41', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2013/05/29');
INSERT INTO Post VALUES('Post 42', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2013/05/29');
INSERT INTO Post VALUES('Post 43', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','Base de datos', '43452786','2013/05/29');

INSERT INTO Post VALUES('Post 44', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 45', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 46', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 47', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 48', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 49', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');
INSERT INTO Post VALUES('Post 50', 'Lorem ipsum bla blabla', 'Bla bla', 'imagen450.jpg','CQC Radio', '12345678','2013/05/29');

---------------------------------------------------- COMENTARIOS -----------------------------------------------
INSERT INTO Comentarios VALUES(1, 'Hola soy el comentario 1', 'usuario1@gmail.com', 'Post 1','05/01/2021');
INSERT INTO Comentarios VALUES(2, 'Hola soy el comentario 2', 'usuario25@gmail.com', 'Post 33', '12/12/2021');
INSERT INTO Comentarios VALUES(3, 'Hola soy el comentario 3', 'usuario6@gmail.com', 'Post 8', '08/02/2022');
INSERT INTO Comentarios VALUES(4, 'Hola soy el comentario 4', 'usuario14@gmail.com', 'Post 4', '12/03/2019');
INSERT INTO Comentarios VALUES(5, 'Hola soy el comentario 5', 'usuario23@gmail.com', 'Post 12','01/01/2021');
INSERT INTO Comentarios VALUES(6, 'Hola soy el comentario 6', 'usuario12@gmail.com', 'Post 13', '03/04/2017');
INSERT INTO Comentarios VALUES(7, 'Hola soy el comentario 7', 'usuario19@gmail.com', 'Post 22','05/01/2021');
INSERT INTO Comentarios VALUES(8, 'Hola soy el comentario 8', 'usuario23@gmail.com', 'Post 23','03/12/2021');
INSERT INTO Comentarios VALUES(9, 'Hola soy el comentario 9', 'usuario20@gmail.com', 'Post 19','07/01/2022');
INSERT INTO Comentarios VALUES(10, 'Hola soy el comentario 10', 'usuario2@gmail.com', 'Post 32','12/02/2022');
INSERT INTO Comentarios VALUES(11, 'Hola soy el comentario 11', 'usuario23@gmail.com', 'Post 1','03/12/2021');
INSERT INTO Comentarios VALUES(12, 'Hola soy el comentario 12', 'usuario22@gmail.com', 'Post 5','13/01/2022');
INSERT INTO Comentarios VALUES(13, 'Hola soy el comentario 13', 'usuario12@gmail.com', 'Post 4','12/02/2019');
INSERT INTO Comentarios VALUES(14, 'Hola soy el comentario 14', 'usuario17@gmail.com', 'Post 3','03/01/2022');
INSERT INTO Comentarios VALUES(15, 'Hola soy el comentario 15', 'usuario6@gmail.com', 'Post 4','12/02/2019');
INSERT INTO Comentarios VALUES(16, 'Hola soy el comentario 16', 'usuario7@gmail.com', 'Post 8','05/01/2021');
INSERT INTO Comentarios VALUES(17, 'Hola soy el comentario 17', 'usuario3@gmail.com', 'Post 13','03/12/2021');
INSERT INTO Comentarios VALUES(18, 'Hola soy el comentario 18', 'usuario1@gmail.com', 'Post 25','12/02/2022');
INSERT INTO Comentarios VALUES(19, 'Hola soy el comentario 19', 'usuario2@gmail.com', 'Post 32','12/01/2022');
INSERT INTO Comentarios VALUES(20, 'Hola soy el comentario 20', 'usuario8@gmail.com', 'Post 4','05/01/2021');
INSERT INTO Comentarios VALUES(21, 'Hola soy el comentario 21', 'usuario13@gmail.com', 'Post 23','05/02/2022');
INSERT INTO Comentarios VALUES(22, 'Hola soy el comentario 22', 'usuario2@gmail.com', 'Post 31','06/02/2022');
INSERT INTO Comentarios VALUES(23, 'Hola soy el comentario 23', 'usuario15@gmail.com', 'Post 23','03/12/2021');
INSERT INTO Comentarios VALUES(24, 'Hola soy el comentario 24', 'usuario16@gmail.com', 'Post 18','12/02/2022');
INSERT INTO Comentarios VALUES(25, 'Hola soy el comentario 25', 'usuario12@gmail.com', 'Post 12','05/01/2021');
INSERT INTO Comentarios VALUES(26, 'Hola soy el comentario 26', 'usuario11@gmail.com', 'Post 3','02/02/2022');
INSERT INTO Comentarios VALUES(27, 'Hola soy el comentario 27', 'usuario10@gmail.com', 'Post 4','02/02/2022');
INSERT INTO Comentarios VALUES(28, 'Hola soy el comentario 28', 'usuario19@gmail.com', 'Post 15','03/12/2021');
INSERT INTO Comentarios VALUES(29, 'Hola soy el comentario 29', 'usuario19@gmail.com', 'Post 18','03/12/2021');
INSERT INTO Comentarios VALUES(30, 'Hola soy el comentario 30', 'usuario18@gmail.com', 'Post 19','12/01/2022');
INSERT INTO Comentarios VALUES(31, 'Hola soy el comentario 31', 'usuario12@gmail.com', 'Post 20','05/01/2021');
INSERT INTO Comentarios VALUES(32, 'Hola soy el comentario 32', 'usuario11@gmail.com', 'Post 12','07/02/2022');
INSERT INTO Comentarios VALUES(33, 'Hola soy el comentario 33', 'usuario13@gmail.com', 'Post 30','11/02/2022');
INSERT INTO Comentarios VALUES(34, 'Hola soy el comentario 34', 'usuario15@gmail.com', 'Post 21','05/01/2021');
INSERT INTO Comentarios VALUES(35, 'Hola soy el comentario 35', 'usuario1@gmail.com', 'Post 23','11/01/2022');
INSERT INTO Comentarios VALUES(36, 'Hola soy el comentario 36', 'usuario2@gmail.com', 'Post 32','11/02/2022');
INSERT INTO Comentarios VALUES(37, 'Hola soy el comentario 37', 'usuario7@gmail.com', 'Post 31','03/12/2021');
INSERT INTO Comentarios VALUES(38, 'Hola soy el comentario 38', 'usuario6@gmail.com', 'Post 31','23/01/2022');
INSERT INTO Comentarios VALUES(39, 'Hola soy el comentario 39', 'usuario2@gmail.com', 'Post 15','05/01/2021');
INSERT INTO Comentarios VALUES(40, 'Hola soy el comentario 40', 'usuario9@gmail.com', 'Post 1','03/12/2021');
INSERT INTO Comentarios VALUES(41, 'Hola soy el comentario 41', 'usuario7@gmail.com', 'Post 2','08/02/2022');
INSERT INTO Comentarios VALUES(42, 'Hola soy el comentario 42', 'usuario6@gmail.com', 'Post 3','05/01/2021');
INSERT INTO Comentarios VALUES(43, 'Hola soy el comentario 43', 'usuario7@gmail.com', 'Post 31','02/05/2022');
INSERT INTO Comentarios VALUES(44, 'Hola soy el comentario 44', 'usuario6@gmail.com', 'Post 31','03/05/2022');
INSERT INTO Comentarios VALUES(45, 'Hola soy el comentario 45', 'usuario2@gmail.com', 'Post 15','05/05/2021');
INSERT INTO Comentarios VALUES(46, 'Hola soy el comentario 46', 'usuario9@gmail.com', 'Post 1','03/05/2022');
INSERT INTO Comentarios VALUES(47, 'Hola soy el comentario 47', 'usuario7@gmail.com', 'Post 2','09/05/2022');
INSERT INTO Comentarios VALUES(48, 'Hola soy el comentario 48', 'usuario6@gmail.com', 'Post 3','05/05/2021');
INSERT INTO Comentarios VALUES(49, 'Hola soy el comentario 49', 'usuario9@gmail.com', 'Post 1','04/05/2022');
INSERT INTO Comentarios VALUES(50, 'Hola soy el comentario 50', 'usuario9@gmail.com', 'Post 1','05/05/2022');
INSERT INTO Comentarios VALUES(51, 'Hola soy el comentario 51', 'usuario9@gmail.com', 'Post 1','06/05/2022');
INSERT INTO Comentarios VALUES(52, 'Hola soy el comentario 52', 'usuario7@gmail.com', 'Post 2','02/05/2022');
INSERT INTO Comentarios VALUES(53, 'Hola soy el comentario 53', 'usuario7@gmail.com', 'Post 2','02/05/2022');
INSERT INTO Comentarios VALUES(54, 'Hola soy el comentario 54', 'usuario7@gmail.com', 'Post 2','04/05/2022');

INSERT INTO Comentarios VALUES(55, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','14/05/2022');
INSERT INTO Comentarios VALUES(56, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','14/05/2022');
INSERT INTO Comentarios VALUES(57, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','14/05/2022');
INSERT INTO Comentarios VALUES(58, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','14/05/2022');
INSERT INTO Comentarios VALUES(59, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','14/05/2022');
INSERT INTO Comentarios VALUES(60, 'Hola soy el comentario ', 'usuario5@gmail.com', 'Post 2','24/05/2022');
INSERT INTO Comentarios VALUES(61, 'Hola soy el comentario ', 'usuario3@gmail.com', 'Post 2','24/05/2022');
INSERT INTO Comentarios VALUES(62, 'Hola soy el comentario ', 'usuario3@gmail.com', 'Post 2','24/05/2022');
INSERT INTO Comentarios VALUES(63, 'Hola soy el comentario ', 'usuario3@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(64, 'Hola soy el comentario', 'usuario3@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(65, 'Hola soy el comentario', 'usuario3@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(66, 'Hola soy el comentario', 'usuario3@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(67, 'Hola soy el comentario', 'usuario3@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(68, 'Hola soy el comentario', 'usuario2@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(69, 'Hola soy el comentario', 'usuario2@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(80, 'Hola soy el comentario', 'usuario2@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(81, 'Hola soy el comentario', 'usuario2@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(82, 'Hola soy el comentario', 'usuario2@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(83, 'Hola soy el comentario', 'usuario1@gmail.com', 'Post 2','04/05/2022');
INSERT INTO Comentarios VALUES(84, 'Hola soy el comentario', 'usuario1@gmail.com', 'Post 35','25/05/2022');
INSERT INTO Comentarios VALUES(85, 'Hola soy el comentario', 'usuario1@gmail.com', 'Post 35','26/05/2022');
INSERT INTO Comentarios VALUES(86, 'Hola soy el comentario', 'usuario1@gmail.com', 'Post 35','27/05/2022');
INSERT INTO Comentarios VALUES(87, 'Hola soy el comentario ', 'usuario6@gmail.com', 'Post 35','28/05/2022');
INSERT INTO Comentarios VALUES(88, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','29/05/2022');
INSERT INTO Comentarios VALUES(89, 'Hola soy el comentario ', 'usuario6@gmail.com', 'Post 35','30/05/2022');
INSERT INTO Comentarios VALUES(90, 'Hola soy el comentario ', 'usuario6@gmail.com', 'Post 35','31/05/2022');
INSERT INTO Comentarios VALUES(91, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','31/05/2022');
INSERT INTO Comentarios VALUES(92, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','31/05/2022');
INSERT INTO Comentarios VALUES(93, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(94, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(95, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(96, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(97, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(98, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(99, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(100, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(101, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(102, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(103, 'Hola soy el comentario', 'usuario6@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(104, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(105, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(106, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(107, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','24/05/2022');
INSERT INTO Comentarios VALUES(108, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','30/05/2022');
INSERT INTO Comentarios VALUES(109, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','30/05/2022');
INSERT INTO Comentarios VALUES(110, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','30/05/2022');
INSERT INTO Comentarios VALUES(111, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 35','30/05/2022');
INSERT INTO Comentarios VALUES(112, 'Hola soy el comentario ', 'usuario7@gmail.com', 'Post 36','30/05/2022');
INSERT INTO Comentarios VALUES(113, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','30/05/2022');
INSERT INTO Comentarios VALUES(114, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','30/05/2022');
INSERT INTO Comentarios VALUES(115, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','30/05/2022');
INSERT INTO Comentarios VALUES(116, 'Hola soy el comentario ', 'usuario7@gmail.com', 'Post 36','30/05/2022');
INSERT INTO Comentarios VALUES(117, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','29/05/2022');
INSERT INTO Comentarios VALUES(118, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','29/05/2022');
INSERT INTO Comentarios VALUES(119, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','29/05/2022');
INSERT INTO Comentarios VALUES(120, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','29/05/2022');
INSERT INTO Comentarios VALUES(121, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','31/05/2022');
INSERT INTO Comentarios VALUES(122, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','31/05/2022');
INSERT INTO Comentarios VALUES(123, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','31/05/2022');
INSERT INTO Comentarios VALUES(124, 'Hola soy el comentario', 'usuario7@gmail.com', 'Post 36','31/05/2022');
select * from Comentarios
INSERT INTO Comentarios VALUES(125, 'Hola sorteo comentario', 'usuario7@gmail.com', 'Post 37','31/05/2016');
INSERT INTO Comentarios VALUES(126, 'Hola soy el sorteo', 'usuario7@gmail.com', 'Post 38','31/05/2014');
INSERT INTO Comentarios VALUES(127, 'Buscas la palabra sorteo', 'usuario7@gmail.com', 'Post 39','31/05/2016');
INSERT INTO Comentarios VALUES(128, 'Aqui sorteo', 'usuario7@gmail.com', 'Post 40','31/05/2012');
INSERT INTO Comentarios VALUES(129, 'Sorteo presentandose', 'usuario7@gmail.com', 'Post 41','31/05/2011');
INSERT INTO Comentarios VALUES(130, 'Hola soy sorteo', 'usuario7@gmail.com', 'Post 42','31/05/2014');
INSERT INTO Comentarios VALUES(131, 'El profe nos va a poner 25 en este obligatorio......aca va la palabra sorteo', 'usuario7@gmail.com', 'Post 43','31/05/2016');

INSERT INTO Comentarios VALUES(132, 'Aqui mas sorteo', 'usuario7@gmail.com', 'Post 39','31/05/2016');
INSERT INTO Comentarios VALUES(133, 'este obli es un sorteo', 'usuario7@gmail.com', 'Post 39','31/05/2016');
INSERT INTO Comentarios VALUES(134, 'sorteo, sorteo....tremendo obli salio, nos sacamos 25 de seguro', 'usuario7@gmail.com', 'Post 37','31/05/2016');

INSERT INTO Comentarios VALUES(135, 'Hola soy un comentario', 'meteoro23@gmail.com', 'Post 44','31/05/2012');
INSERT INTO Comentarios VALUES(136, 'Hola soy otro comentario', 'meteoro23@gmail.com', 'Post 45','31/05/2013');
INSERT INTO Comentarios VALUES(137, 'Hola comentario', 'meteoro23@gmail.com', 'Post 46','31/05/2014');
INSERT INTO Comentarios VALUES(138, 'Holaaaaaaaa','meteoro23@gmail.com', 'Post 46','31/05/2015');
INSERT INTO Comentarios VALUES(139, 'Hola meteoro!!!', 'meteoro23@gmail.com', 'Post 46','31/05/2016');
INSERT INTO Comentarios VALUES(140, 'Hola', 'meteoro23@gmail.com', 'Post 47','31/05/2017');
INSERT INTO Comentarios VALUES(141, 'Hola profe', 'meteoro23@gmail.com', 'Post 47','31/05/2018');
INSERT INTO Comentarios VALUES(142, 'Hola ...ponenos un 25 nicooooo!!!', 'meteoro23@gmail.com', 'Post 48','31/05/2020');
INSERT INTO Comentarios VALUES(143, 'Hola soy el comentario', 'meteoro23@gmail.com', 'Post 49','31/05/2021');
INSERT INTO Comentarios VALUES(144, 'Hola soy el COEMNTARIO NUMERO 1', 'meteoro23@gmail.com', 'Post 50','31/05/2013');
INSERT INTO Comentarios VALUES(145, 'Hola soy el mejor', 'meteoro23@gmail.com', 'Post 15','31/05/2013');


---------------------------------------------------- PRIVADO -----------------------------------------------
INSERT INTO Privado VALUES(2,123);
INSERT INTO Privado VALUES(6,124);
INSERT INTO Privado VALUES(7,125);
INSERT INTO Privado VALUES(8,126);
INSERT INTO Privado VALUES(15,127);
INSERT INTO Privado VALUES(16,128);
INSERT INTO Privado VALUES(17, 129);
INSERT INTO Privado VALUES(18, 130);
INSERT INTO Privado VALUES(27, 131);
INSERT INTO Privado VALUES(28,132);

INSERT INTO Privado VALUES(125, 30);
INSERT INTO Privado VALUES(126, 31);
INSERT INTO Privado VALUES(127, 32);
INSERT INTO Privado VALUES(128, 33);

INSERT INTO Privado VALUES(132, 45);
INSERT INTO Privado VALUES(133, 46);
INSERT INTO Privado VALUES(134, 48);
---------------------------------------------------- PUBLICO -----------------------------------------------
INSERT INTO Publico VALUES(1);
INSERT INTO Publico VALUES(3);
INSERT INTO Publico VALUES(4);
INSERT INTO Publico VALUES(5);
INSERT INTO Publico VALUES(9);
INSERT INTO Publico VALUES(10);
INSERT INTO Publico VALUES(11);
INSERT INTO Publico VALUES(12);
INSERT INTO Publico VALUES(13);
INSERT INTO Publico VALUES(14);
INSERT INTO Publico VALUES(19);
INSERT INTO Publico VALUES(20);
INSERT INTO Publico VALUES(21);
INSERT INTO Publico VALUES(22);
INSERT INTO Publico VALUES(23);
INSERT INTO Publico VALUES(24);
INSERT INTO Publico VALUES(25);
INSERT INTO Publico VALUES(26);
INSERT INTO Publico VALUES(29);

INSERT INTO Publico VALUES(129);
INSERT INTO Publico VALUES(130);
INSERT INTO Publico VALUES(131);
---------------------------------------------------- CATEGORIA -----------------------------------------------
INSERT INTO Categoria VALUES('Rock', 'https://dummyimage.com/213x100.png/5fa2dd/ffffff' ,'Pasan musica');
INSERT INTO Categoria VALUES('Humor', 'https://dummyimage.com/211x100.png/5fa2dd/ffffff' ,'Cuentan chistes');
INSERT INTO Categoria VALUES('Noticias', 'https://dummyimage.com/223x100.png/5fa2dd/ffffff','Pasan noticias');
INSERT INTO Categoria VALUES('Clasica', 'https://dummyimage.com/214x100.png/5fa2dd/ffffff','Pasan musica clasica');
INSERT INTO Categoria VALUES('Tertulia', 'https://dummyimage.com/215x100.png/5fa2dd/ffffff','Hablan mucho');
INSERT INTO Categoria VALUES('Pop', 'https://dummyimage.com/216x100.png/5fa2dd/ffffff','Pasan musica pop');
INSERT INTO Categoria VALUES('Música', 'https://dummyimage.com/217x100.png/5fa2dd/ffffff' ,'Pasan musica');
---------------------------------------------------- PERTENECE -----------------------------------------------
INSERT INTO Pertenece VALUES('Música', 'Rock');
INSERT INTO Pertenece VALUES('Música', 'Clasica');
INSERT INTO Pertenece VALUES('Música', 'Pop');
INSERT INTO Pertenece VALUES('Tertulia', 'Humor');
INSERT INTO Pertenece VALUES('Tertulia', 'Noticias');
---------------------------------------------------- ASIGNA --------------------------------------------------
INSERT INTO Asigna VALUES('Post 1', 'Tertulia');
INSERT INTO Asigna VALUES('Post 2', 'Humor');
INSERT INTO Asigna VALUES('Post 3', 'Tertulia');
INSERT INTO Asigna VALUES('Post 4', 'Noticias');
INSERT INTO Asigna VALUES('Post 5', 'Clasica');
INSERT INTO Asigna VALUES('Post 6', 'Humor');
INSERT INTO Asigna VALUES('Post 7', 'Humor');
INSERT INTO Asigna VALUES('Post 8', 'Pop');
INSERT INTO Asigna VALUES('Post 9', 'Noticias');
INSERT INTO Asigna VALUES('Post 10', 'Humor');
INSERT INTO Asigna VALUES('Post 11', 'Humor');
INSERT INTO Asigna VALUES('Post 12', 'Rock');
INSERT INTO Asigna VALUES('Post 37', 'Música');
INSERT INTO Asigna VALUES('Post 38', 'Música');
INSERT INTO Asigna VALUES('Post 39', 'Música');
INSERT INTO Asigna VALUES('Post 40', 'Rock');
INSERT INTO Asigna VALUES('Post 41', 'Rock');
INSERT INTO Asigna VALUES('Post 42', 'Música');
INSERT INTO Asigna VALUES('Post 43', 'Rock');

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