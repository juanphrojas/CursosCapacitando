CREATE DATABASE BDCursosCapacitando
GO

USE BDCursosCapacitando
GO

drop database BDCursosCapacitando
-----------------------------------------------------------------------------------------------------
----------------------------------------------TABLAS-------------------------------------------------
-----------------------------------------------------------------------------------------------------

CREATE TABLE tblTEMa(
	intCod_TEM INT IDENTITY PRIMARY KEY NOT NULL,
	strNombre_TEM VARCHAR(50) NOT NULL,
	strDescripcion_TEM VARCHAR(800) NOT NULL
	)
GO

CREATE TABLE tblCARgo(
	intCod_CAR INT IDENTITY PRIMARY KEY NOT NULL,
	strDescripcion_CAR VARCHAR(800) NOT NULL
	)
GO

CREATE TABLE tblForma_PAGo(
	intCod_FPAG INT IDENTITY PRIMARY KEY NOT NULL,
	strDescripcion_FPAG VARCHAR(800) NOT NULL
	)
GO

CREATE TABLE tblCLIente(
	intCod_CLI INT IDENTITY PRIMARY KEY NOT NULL,
	strNombre_CLI varchar(50) not null,
	strApellido_CLI varchar(50) not null,
	strNroDocumento_CLI varchar (20) not null,
	idEMP_CLI int not null
	)
GO

CREATE TABLE tblEMPleado(
	intCod_EMP INT IDENTITY PRIMARY KEY NOT NULL,
	strNombre_EMP varchar(50) not null,
	strApellido_EMP varchar(50) not null,
	strNroDocumento_EMP varchar (20) not null,
	strUsuario_EMP varchar(50) not null,
	strContrasena_EMP varchar(50) not null,
	idCAR_EMP int not null,
	realAntiguedad_EMP real not null
	)
GO


CREATE TABLE tblTITulo(
	intCod_TIT INT IDENTITY PRIMARY KEY NOT NULL,
	strDescripcion_TIT varchar(100) not null
	)
GO

CREATE TABLE tblTItulo_EMpleado(
	intCod_TIEM INT IDENTITY PRIMARY KEY NOT NULL,
	idEMP_TIEM int not null,
	idTIT_TIEM int not null,
	strUniversidad_TIEM varchar(50) not null,
	dtmFecha_TIEM datetime not null
	)
GO

CREATE TABLE tblPAGo (
	intCod_PAG INT IDENTITY PRIMARY KEY NOT NULL,
	dtmFecha_PAG datetime not null,
	idEMP_PAG int not null,
	idMAT_PAG int not null,
	idFPAG_PAG int not null,
	realMonto_PAG real not null
	)
GO

CREATE TABLE tblCURso(
	intCod_CUR INT IDENTITY PRIMARY KEY NOT NULL,
	strNombre_CUR varchar(50) not null,
	dtmFecha_CUR datetime not null,
	realCosto_CUR real not null,
	intHoras_CUR int not null,
	idEMP_CUR int not null
	)
GO

CREATE TABLE tblCUrso_TEma(
	intCod_CUTE INT IDENTITY PRIMARY KEY NOT NULL,
	idCUR_CUTE int not null,
	idTEM_CUTE int not null
	)
GO

CREATE TABLE tblMATricula(
	intCod_MAT INT IDENTITY PRIMARY KEY NOT NULL,
	idCLI_MAT int not null,
	dtmFecha_MAT datetime
	)
GO

CREATE TABLE tblPROgramacion(
	intCod_PRO INT IDENTITY PRIMARY KEY NOT NULL,
	idCUR_PRO int not null,
	idEMP_PRO int not null,
	dtmFechaInicio_PRO datetime not null,
	strEstado_PRO varchar(20) not null,
	intCupos_PRO int not null,
	idDocente_PRO int not null
	)
GO

CREATE TABLE tblDEtalle_MAtricula(
	intCod_DEMA INT IDENTITY PRIMARY KEY NOT NULL,
	idMAT_DEMA int not null,
	idEMP_DEMA int not null,
	idPRO_DEMA int not null
	)
GO


---------------------------------------------------------------------------------------------
--------------------------------------------RELACIONES---------------------------------------
---------------------------------------------------------------------------------------------

ALTER TABLE tblEMPleado  ADD FOREIGN KEY (idCAR_EMP) REFERENCES tblCARgo (intCod_CAR);
ALTER TABLE tblCLIente  ADD FOREIGN KEY (idEMP_CLI) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblCURso  ADD FOREIGN KEY (idEMP_CUR) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblCUrso_TEma  ADD FOREIGN KEY (idCUR_CUTE) REFERENCES tblCURso (intCod_CUR);
ALTER TABLE tblCUrso_TEma  ADD FOREIGN KEY (idTEM_CUTE) REFERENCES tblTEMa (intCod_TEM);
ALTER TABLE tblTItulo_EMpleado  ADD FOREIGN KEY (idEMP_TIEM) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblTItulo_EMpleado  ADD FOREIGN KEY (idTIT_TIEM) REFERENCES tblTITulo (intCod_TIT);
ALTER TABLE tblPROgramacion  ADD FOREIGN KEY (idCUR_PRO) REFERENCES tblCURso (intCod_CUR);
ALTER TABLE tblPROgramacion  ADD FOREIGN KEY (idEMP_PRO) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblPROgramacion  ADD FOREIGN KEY (idDocente_PRO) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblPAGo  ADD FOREIGN KEY (idEMP_PAG) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblPAGo  ADD FOREIGN KEY (idMAT_PAG) REFERENCES tblMATricula (intCod_MAT);
ALTER TABLE tblPAGo  ADD FOREIGN KEY (idFPAG_PAG) REFERENCES tblForma_PAGo (intCod_FPAG);
ALTER TABLE tblDEtalle_MAtricula  ADD FOREIGN KEY (idMAT_DEMA) REFERENCES tblMATricula (intCod_MAT);
ALTER TABLE tblDEtalle_MAtricula  ADD FOREIGN KEY (idEMP_DEMA) REFERENCES tblEMPleado (intCod_EMP);
ALTER TABLE tblDEtalle_MAtricula  ADD FOREIGN KEY (idPRO_DEMA) REFERENCES tblPROgramacion (intCod_PRO);
ALTER TABLE tblMATricula  ADD FOREIGN KEY (idCLI_MAT) REFERENCES tblCLIente (intCod_CLI);
go



---------------------------------------------------------------------------------------------------------------------
------------------------------------------------------INSERTS--------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

insert into tblCARgo values ('Docente'),('Asistencia');
insert into tblForma_PAGo values ('Efectivo'),('Debito'),('Credito');
insert into tblEMPleado values ('Fulano','De Tal','788122133','fulanodetal','fulanodetal',1,1);
insert into tblEMPleado values ('Tales','y Retales','744100200','talesyretale','talesyretales',1,10);
insert into tblEMPleado values ('Perano','Sultano','855711933','peranosultano','peranosultano',2,5);
insert into tblCLIente values ('Memo','Santo','123456789',2);
insert into tblCLIente values ('Ladra','America','753951852',2);
insert into tblCLIente values ('Cuanta','Vega','147852369',2);
insert into tblTITulo values ('Ing.Sistemas'),('Matematico'),('Sociologo');
insert into tblTItulo_EMpleado values(1,1,'Javeriana',getdate());
insert into tblTItulo_EMpleado values(2,2,'UdeA',getdate());
insert into tblCURso values('Programacion',getdate(),1000000,240,3);
insert into tblCURso values('Matematicas basicas',getdate(),500000,300,3);
insert into tblCURso values('Diseño Web',getdate(),1500000,300,3);
insert into tblTEMa values('Intro Logica','Conocimientos basicos sobre logica de programacion');
insert into tblTEMa values('Progracion estructurada','Aplicacion de la logica en procesos estructurados');
insert into tblTEMa values('Funciones','Distribucion de procesos');
insert into tblTEMa values('Factorizacion','Aplicacion del algebra para la factorizacion');
insert into tblTEMa values('Trigonometria','Identidades y funciones trigonometricas');
insert into tblTEMa values('Matrices','Algebra matricial y operaciones con matrices');
insert into tblTEMa values('Illustrator','Conocimientos basicos sobre vectorizacion de elementos');
insert into tblTEMa values('Teoria del color','Conocimientos basicos sobre la teoria del color');
insert into tblTEMa values('Composision vectorial','Conocimientos basicos sobre composicion vectorial');
insert into tblCUrso_TEma values (1,1),(1,2),(1,3);
insert into tblCUrso_TEma values (2,4),(2,5),(2,6);
insert into tblCUrso_TEma values (3,7),(3,8),(3,9);
insert into tblMATricula values (1,GETDATE()),(2,GETDATE()),(3,GETDATE());
insert into tblPROgramacion values (1,3,GETDATE(),1,20,1);
insert into tblPROgramacion values (2,3,GETDATE(),2,30,1);
insert into tblPROgramacion values (3,3,GETDATE(),1,10,1);
insert into tblDEtalle_MAtricula values(1,3,1);
insert into tblDEtalle_MAtricula values(2,3,2);
insert into tblDEtalle_MAtricula values(3,3,3);
insert into tblPAGo values (GETDATE(),3,1,1,1000000);
insert into tblPAGo values (GETDATE(),3,2,1,500000);
insert into tblPAGo values (GETDATE(),3,3,1,1500000);
go

---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------STORES PRECEDURES-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------
-------------------------------CLIENTE-----------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_CLIente_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_CLI as Clave,
						strNroDocumento_CLI as Cedula,
						strNombre_CLI as NombreCiente,
						strApellido_CLI as ApellidoCLiente,
						strNombre_EMP as NombreEmpleado,
						strApellido_EMP as ApellidoEmplado
			FROM tblCLIente inner join tblEMPleado on idEMP_CLI = intCod_EMP
			ORDER BY strNombre_CLI
		END
GO

CREATE PROCEDURE USP_CLIente_BuscarGrid
@Codigo int
AS
BEGIN
	begin
		SELECT intCod_CUR as ClaveCurso,
				strNombre_CUR as Curso,
				realCosto_CUR as CostoCurso,
				intHoras_CUR as HorasCurso,
				CONVERT (varchar(10), dtmFechaInicio_PRO, 103) as FechaInicio,
				strEstado_PRO as Estado,
				strNombre_EMP as NombreDocente,
				strApellido_EMP as ApellidoDocente,
				CONVERT (varchar(10), dtmFecha_MAT, 103) as FechaMatricula				
		FROM tblCURso inner join tblPROgramacion on idCUR_PRO = intCod_CUR
		inner join tblDEtalle_MAtricula on idPRO_DEMA = intCod_PRO
		inner join tblMATricula on idMAT_DEMA = intCod_MAT
		inner join tblCLIente on idCLI_MAT = intCod_CLI
		inner join tblEMPleado on idDocente_PRO = intCod_EMP
		WHERE intCod_CLI = @Codigo
	end

END
GO

CREATE PROCEDURE USP_CLIente_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_CLI as Clave,
						strNroDocumento_CLI as Cedula,
						strNombre_CLI as NombreCiente,
						strApellido_CLI as ApellidoCLiente,
						idEMP_CLI as Empleado
			FROM tblCLIente WHERE intCod_CLI = @Codigo
			EXEC USP_CLIente_BuscarGrid @Codigo
  END
GO

--exec USP_CLIente_BuscarXCodigo 1;

CREATE PROCEDURE USP_CLIente_Grabar
	@Cedula varchar(20),
	@Nombre Varchar(50),
	@Apellido Varchar(50),
	@idEmpleado int
AS
	BEGIN
	if exists (select strNroDocumento_CLI from tblCLIente where strNroDocumento_CLI = @Cedula) 
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		insert into tblCLIente values (@Nombre,@Apellido,@Cedula,@idEmpleado);
		if (@@ERROR > 0 )
			begin 
				rollback transaction tx
				select 0 as Rpta
				return 
				end
			commit transaction tx
		SELECT @@IDENTITY as Rpta
		return
	
	
	END
GO

CREATE PROCEDURE USP_CLIente_Modificar
	@Codigo int,
	@Cedula varchar(20),
	@Nombre Varchar(60),
	@Apellido Varchar(50),
	@idEmpleado int
AS
BEGIN
	if not exists (select intCod_CLI from tblCLIente where intCod_CLI = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblCLIente
			set strNroDocumento_CLI = @Cedula,
				strNombre_CLI=@Nombre,
				strApellido_CLI = @Apellido,
				idEMP_CLI=@idEmpleado
			where intCod_CLI = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @@IDENTITY as  Rpta
			return
END
GO

-------------------------------------------------------------------------
-------------------------------EMPLEADO----------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_EMPleado_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_EMP as Clave,
						strNroDocumento_EMP as Cedula,
						strNombre_EMP as NombreCiente,
						strApellido_EMP as ApellidoCLiente,
						strDescripcion_CAR as Cargo,
						strUsuario_EMP as Usuario,
						realAntiguedad_EMP as Antiguedad
			FROM tblEMPleado inner join tblCARgo on idCAR_EMP = intCod_CAR
			ORDER BY strNombre_EMP
		END
GO

CREATE PROCEDURE USP_EMPleado_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_EMP as Clave,
						strNroDocumento_EMP as Cedula,
						strNombre_EMP as NombreCiente,
						strApellido_EMP as ApellidoCLiente,
						idCAR_EMP as Cargo,
						strUsuario_EMP as Usuario,
						realAntiguedad_EMP as Antiguedad
			FROM tblEMPleado WHERE intCod_EMP = @Codigo
  END
GO

--exec USP_EMPleado_BuscarXCodigo 1;

CREATE PROCEDURE USP_EMPleado_Grabar
	@Cedula varchar(20),
	@Nombre Varchar(50),
	@Apellido Varchar(50),
	@Ususario varchar(50),
	@Contraseña varchar(50),
	@idCargo int,
	@Antiguedad real
AS
	BEGIN
	if exists (select strNroDocumento_EMP from tblEMPleado where strNroDocumento_EMP = @Cedula) 
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		insert into tblEMPleado values (@Nombre,@Apellido,@Cedula,@Ususario,@Contraseña,@idCargo,@Antiguedad);
		if (@@ERROR > 0 )
			begin 
				rollback transaction tx
				select 0 as Rpta
				return 
				end
			commit transaction tx
		SELECT @@IDENTITY as Rpta
		return
	
	
	END
GO

CREATE PROCEDURE USP_EMPleado_Modificar
	@Codigo int,
	@Cedula varchar(20),
	@Nombre Varchar(50),
	@Apellido Varchar(50),
	@Ususario varchar(50),
	@Contraseña varchar(50),
	@idCargo int,
	@Antiguedad real
AS
BEGIN
	if not exists (select intCod_EMP from tblEMPleado where intCod_EMP = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblEMPleado
			set strNroDocumento_EMP = @Cedula,
				strNombre_EMP=@Nombre,
				strApellido_EMP = @Apellido,
				strUsuario_EMP = @Ususario,
				strContrasena_EMP = @Contraseña,
				idCAR_EMP = @idCargo,
				realAntiguedad_EMP = @Antiguedad
			where intCod_EMP = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @@IDENTITY as  Rpta
			return
END
GO

-------------------------------------------------------------------------
----------------------------------TEMA-----------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_TEMa_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_TEM as Clave,
						strNombre_TEM as Tema,
						strDescripcion_TEM as Descripcion

			FROM tblTEMa
			ORDER BY strDescripcion_TEM
		END
GO

CREATE PROCEDURE USP_TEMa_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_TEM as Clave,
						strNombre_TEM as Tema,
						strDescripcion_TEM as Descripcion

			FROM tblTEMa WHERE intCod_TEM = @Codigo
  END
GO

--exec USP_TEMa_BuscarXCodigo 1;

CREATE PROCEDURE USP_TEMa_Grabar
	@Nombre Varchar(50),
	@Desccripcion Varchar(800)
AS
	BEGIN
	if exists (select strNombre_TEM from tblTEMa where strNombre_TEM = @Nombre) 
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		insert into tblTEMa values (@Nombre,@Desccripcion)
		if (@@ERROR > 0 )
			begin 
				rollback transaction tx
				select 0 as Rpta
				return 
				end
			commit transaction tx
		SELECT @@IDENTITY as Rpta
		return
	
	
	END
GO

CREATE PROCEDURE USP_TEMa_Modificar
	@Codigo int,
	@Nombre Varchar(50),
	@Desccripcion Varchar(800)
AS
BEGIN
	if not exists (select intCod_TEM from tblTEMa where intCod_TEM = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblTEMa
			set  strNombre_TEM= @Nombre,
				strDescripcion_TEM=@Desccripcion
			where intCod_TEM = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @@IDENTITY as  Rpta
			return
END
GO