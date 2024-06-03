create table organizador (
id_organizador bigint auto_increment
, nombreorazonsocial varchar(100)  
, rfc varChar(13) 
, contacto varchar(100) 
, url varchar(100) 
, correo varchar(100) 
, telefono varchar(10) 
, direccion varchar(100) 
,constraint pkOrganizador primary key (id_organizador)
);

create table categoria(
id_categoria BIGINT AUTO_INCREMENT
, descripcion VARCHAR (100) 
, CONSTRAINT pkCategoria PRIMARY KEY (id_categoria)
);

create table actividad(
id_actividad bigint auto_increment
, descripcion varchar(100) 
, constraint pKActividad primary key (id_actividad)
);

create table participante(
id_participante bigint auto_increment 
, nombrecompleto varchar(100)
, curp varchar(18)
, institucionprocedencia varchar(100)
, cuenta varchar (100)
, password varchar(100)
, constraint pKParticipante primary key(id_participante)
);

create table ponente(
id_ponente bigint auto_increment
, nombreCompleto varchar (100)
, sexo char check(sexo like 'H' or 'M')
, foto varchar(100)
, cv varchar(100)
, nivelacademico varchar(20)
, cuenta varchar(100)
, password varchar(100)
, correo varchar(100)
, constraint pKPonente primary key (id_ponente)
);

create table evento(
id_evento bigint auto_increment
, titulo varchar(100)
, descripcion varchar(100)
, fechainicio date  
, fechafin date
, observaciones varchar(100)
, logotipo varchar(100)
, eslogan varchar(100)
, lugar varchar(100)
, incioregistro date
, cierreregistro date
, id_categoria bigint 
, id_organizador bigint
, constraint pKEvento primary key(id_evento)
, constraint fKCategoria foreign key(id_categoria)
references categoria(id_categoria)
, constraint fKOrganizador foreign key(id_organizador)
references organizador(id_organizador) 
);

create table horario(
id_horario bigint
, id_catalogo bigint
, constraint fKCatalogo foreign key (id_catalogo)
references catalogo(id_catalogo)
, id_ponente bigint
, constraint fKPonente foreign key (id_ponente)
references ponente(id_ponente)
, constraint pKHorario primary key (id_horario)
);

create table horariodetalle(  
id_horariodetalle bigint auto_increment
, horario_id bigint
, CONSTRAINT fKHorariodetalle FOREIGN KEY (horario_id)
references horario(id_horario)
, fecha date
, horainicio date
, horafin date
, lugar varchar(100)
,constraint pKHorariodetalle PRIMARY KEY (id_horariodetalle)
);

create table participantehorario (
id_participantehorario bigint auto_increment
, id_participante bigint 
, constraint fKParticipante foreign key (id_participante)
references participante(id_participante)
, id_horario bigint 
, constraint fKHorario foreign key(id_horario)
references horario(id_horario)
, fecharegistro date
, constraint pKParticipantehorario primary key(id_participantehorario)
);

create table catalogo (
id_catalogo bigint auto_increment 
, titulo varchar(100) 
, id_actividad bigint
, id_evento bigint
, costo int
, totalhoras int  
, cupolimite int 
, constraint pKCatalogo primary key(id_catalogo)
, constraint fKActividad foreign key(id_actividad)
references actividad(id_actividad)
, constraint fKEvento foreign key(id_evento)
references evento(id_evento)
);

create table pago(
id_pago bigint auto_increment 
, fechapago date 
, participante_id bigint 
,constraint fKParticipante foreign key(participante_id) 
references participante(id_participante)
, constraint pKPago primary key(id_pago)
);

create table detallepago( 
id_detallepago bigint auto_increment
,pago_id bigint 
,constraint fKPago foreign key(pago_id)
references pago(id_pago)
,catalogo_id bigint
,constraint fKCatalogoo foreign key(catalogo_id)
references catalogo(id_catalogo)
,importe int 
,constraint pKDetallepago primary key(id_detallepago)
);

