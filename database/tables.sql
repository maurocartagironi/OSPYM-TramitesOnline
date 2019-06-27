--------------CANAL DE CONTACTO---------------

CREATE TABLE tramites_online.MOTIVOS (
    ID_MOTIVO			int				NOT NULL	IDENTITY	PRIMARY KEY,
	ETIQUETA			varchar(100)	NOT NULL,
);

CREATE TABLE tramites_online.CATEGORIAS (
    ID_CATEGORIA		int				NOT NULL	IDENTITY	PRIMARY KEY,
    ETIQUETA			varchar(100)	NOT NULL
);

CREATE TABLE tramites_online.MOTIVOS_CATEGORIAS (
	ID_MOT_CAT			int				NOT NULL	IDENTITY	PRIMARY KEY,
    ID_MOTIVO			int				NOT NULL	FOREIGN KEY REFERENCES tramites_online.MOTIVOS(ID_MOTIVO),
    ID_CATEGORIA		int				NULL		FOREIGN KEY REFERENCES tramites_online.CATEGORIAS(ID_CATEGORIA),
	CORREO				varchar(100)	NOT NULL
);

CREATE TABLE tramites_online.CONTACTOS (
    ID_CONTACTO			int				NOT NULL	IDENTITY	PRIMARY KEY,
	ID_TRAMITE			varchar(14)		NOT NULL,
	ID_AFILIADO			varchar(30)		NOT NULL,
	ID_MOTIVO			int,
	ID_CATEGORIA		int,
	NOMBRE_COMPLETO     varchar(100)	NOT NULL,
	COMENTARIO			varchar(1100),
	FECHA_CREACION		datetime       	NOT NULL 	DEFAULT 	CURRENT_TIMESTAMP,
	CORREO				varchar(255)	NOT NULL,
	TIPO				VARCHAR(30)     NOT NULL,
	ID_BENEF			varchar(30),
	NOMBRE_BENEF     	varchar(100),
	ID_ESPECIALIDAD     int,
	ID_PRESTACION       int,
	PRESTADOR       	varchar(40)	
);

--------------PLAN WEB---------------

CREATE TABLE tramites_online.PLAN_SECCIONES (
    ID_PLAN_SECCION		int				NOT NULL	IDENTITY	PRIMARY KEY,
    TITULO				varchar(100)		NOT NULL,
	SUBTITULO			varchar(300)
);


CREATE TABLE tramites_online.PLAN_ITEMS (
    ID_PLAN_ITEM		int				NOT NULL	IDENTITY	PRIMARY KEY,
	TITULO				varchar(100) NOT NULL,
    VALOR				varchar(300),
	ID_PLAN_SECCION		int FOREIGN KEY REFERENCES tramites_online.PLAN_SECCIONES(ID_PLAN_SECCION) NOT NULL,
	ID_ITEM_PADRE		int FOREIGN KEY REFERENCES tramites_online.PLAN_ITEMS(ID_PLAN_ITEM),
	ID_PLAN				VARCHAR(100) NOT NULL
);

CREATE TABLE tramites_online.CONTACTO_SEQ(
    ID INT  
);

------------- AUTORIZACION WEB -----------------

CREATE TABLE tramites_online.AUTORIZACION_SEQ(
    ID INT  
);

CREATE TABLE tramites_online.ESPECIALIDADES (
    ID_ESPECIALIDAD			int				NOT NULL	IDENTITY	PRIMARY KEY,
	ETIQUETA			varchar(100)	NOT NULL
);

CREATE TABLE tramites_online.PRESTACIONES (
    ID_PRESTACION			int				NOT NULL	IDENTITY	PRIMARY KEY,
	ETIQUETA			varchar(100)	NOT NULL
);

CREATE TABLE tramites_online.ESPEC_PREST (
	ID_ESPEC_PREST		int				NOT NULL	IDENTITY	PRIMARY KEY,
    ID_ESPECIALIDAD		int				NOT NULL	FOREIGN KEY REFERENCES tramites_online.ESPECIALIDADES(ID_ESPECIALIDAD),
    ID_PRESTACION		int				NULL		FOREIGN KEY REFERENCES tramites_online.PRESTACIONES(ID_PRESTACION),
	CORREO				varchar(100)	NOT NULL
);

CREATE TABLE tramites_online.AUTORIZACIONES_DOC (
	ID_AUTORIZACION_DOC int				NOT NULL	IDENTITY	PRIMARY KEY,
    ID_ESPEC_PREST		int				NOT NULL	FOREIGN KEY REFERENCES tramites_online.ESPEC_PREST(ID_ESPEC_PREST),
    DOCUMENTACION		varchar(300)	NULL		
);

---------EJECUTAR SEPARADO-----------

CREATE PROCEDURE tramites_online.GET_NEXT_SEQUENCE_VALUE
AS  
    BEGIN 
		DECLARE @value INT	
		BEGIN TRANSACTION
			SELECT @value = ID FROM CONTACTO_SEQ
			IF @value + 1 > 999999
				SET @value = 1;
			ELSE
				SET @value = @value + 1
			UPDATE CONTACTO_SEQ
			SET ID = @value   
		COMMIT TRANSACTION  
		SELECT @value AS ID  
	END; 

	
	CREATE PROCEDURE tramites_online.GET_NEXT_AUTORIZACION_VALUE
AS  
    BEGIN 
		DECLARE @value INT	
		BEGIN TRANSACTION
			SELECT @value = ID FROM AUTORIZACION_SEQ
			IF @value + 1 > 999999
				SET @value = 1;
			ELSE
				SET @value = @value + 1
			UPDATE AUTORIZACION_SEQ
			SET ID = @value   
		COMMIT TRANSACTION  
		SELECT @value AS ID  
	END; 