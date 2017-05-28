CREATE DATABASE BDCursosCapacitando
GO

USE BDCursosCapacitando
GO


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
			select @Codigo as  Rpta
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
			select @Codigo as  Rpta
			return
END
GO

CREATE PROCEDURE USP_EMPleado_LlenarComboDocente

AS
BEGIN
	
	SELECT intCod_EMP as Clave, strApellido_EMP+' '+strNombre_EMP as Dato

	from tblEMPleado where idCAR_EMP = 1
	order by strApellido_EMP
	
END
GO

CREATE PROCEDURE USP_EMPleado_LlenarComboCargo

AS
BEGIN
	
	SELECT intCod_CAR as Clave, strDescripcion_CAR as Dato

	from tblCARgo
	order by strDescripcion_CAR
	
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
			select @Codigo as  Rpta
			return
END
GO

CREATE PROCEDURE USP_TEMa_LlenarCombo

AS
BEGIN
	
	SELECT intCod_TEM as Clave, strNombre_TEM as Dato

	from tblTEMa
	order by strNombre_TEM
	
END
GO
-------------------------------------------------------------------------
----------------------------------CURSO----------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_CURso_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_CUR as Clave,
					strNombre_CUR as Curso,
					CONVERT (varchar(10), dtmFecha_CUR, 103) as FechaCreacion,
					realCosto_CUR as Costo,
					intHoras_CUR as Horas,
					strNombre_EMP as NombreEmpleado,
					strApellido_EMP as ApellidoEmpleado
			FROM tblCURso inner join tblEMPleado on idEMP_CUR = intCod_EMP
			ORDER BY strNombre_CUR
		END
GO

CREATE PROCEDURE USP_CURso_BuscarGrid
@Codigo int
AS
BEGIN
	begin
		SELECT intCod_TEM as ClaveTema,
				strNombre_TEM as Tema,
				strDescripcion_TEM as DescripcionTema
		FROM tblTEMa inner join tblCUrso_TEma on idTEM_CUTE = intCod_TEM
		inner join tblCURso on idCUR_CUTE = intCod_CUR
		WHERE intCod_CUR = 1
	end

END
GO

CREATE PROCEDURE USP_CURso_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_CUR as Clave,
					strNombre_CUR as Curso,
					CONVERT (varchar(10), dtmFecha_CUR, 103) as FechaCreacion,
					realCosto_CUR as Costo,
					intHoras_CUR as Horas,
					idEMP_CUR as Empleado
			FROM tblCURso
			where intCod_CUR = @Codigo
			EXEC USP_CURso_BuscarGrid @Codigo
  END
GO

--exec USP_CURso_BuscarXCodigo 1;

CREATE PROCEDURE USP_CURso_Grabar
	@Nombre Varchar(50),
	@Costo real,
	@Horas int,
	@idEmpleado int
AS
	BEGIN
	if exists (select strNombre_CUR from tblCURso where strNombre_CUR = @Nombre) 
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		insert into tblCURso values (@Nombre,GETDATE(),@Costo,@Horas,@idEmpleado);
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

CREATE PROCEDURE USP_CURso_Modificar
	@Codigo int,
	@Nombre Varchar(50),
	@Costo real,
	@Horas int,
	@idEmpleado int
AS
BEGIN
	if not exists (select intCod_CUR from tblCURso where intCod_CUR = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblCURso
			set strNombre_CUR = @Nombre,
				dtmFecha_CUR=GETDATE(),
				realCosto_CUR = @Costo,
				intHoras_CUR=@Horas
			where intCod_CUR = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @Codigo as  Rpta
			return
END
GO

CREATE PROCEDURE USP_CURso_GrabarTema
	@idCurso int,
	@idTema int
AS
BEGIN
	if exists (select intCod_CUTE from tblCUrso_TEma where idCUR_CUTE =@idCurso and idTEM_CUTE = @idTema)
		begin 
			select -1 as Rpta
			return 
		end
	else
		
		begin
		begin transaction tx
			insert into tblCUrso_TEma values (@idCurso, @idTema)
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
			end
		commit transaction tx
		select @idCurso as Rpta
		return
		end
		
END
GO
--exec USP_CURso_GrabarTema 1,3;

CREATE PROCEDURE USP_CURso_LlenarCombo

AS
BEGIN
	
	SELECT intCod_CUR as Clave, strNombre_CUR as Dato

	from tblCURso
	order by strNombre_CUR
	
END
GO

-------------------------------------------------------------------------
-------------------------------PROGRAMACION------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_PROgramacion_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_PRO as Clave,
						strNombre_CUR as Curso,
						intCupos_PRO as Cupos,
						CONVERT (varchar(10), dtmFechaInicio_PRO, 103) as FechaInicio,
						strEstado_PRO as Estado,
						intCupos_PRO as Cupos,
						strNombre_EMP as NombreDocente,
						strApellido_EMP as ApellidoDocente
			FROM tblPROgramacion inner join tblCURso on idCUR_PRO = intCod_CUR
			inner join tblEMPleado on idDocente_PRO = intCod_EMP
			ORDER BY strNombre_CUR
		END
GO

CREATE PROCEDURE USP_PROgramacion_BuscarGrid
@Codigo int
AS
BEGIN
	begin
		SELECT intCod_TEM as ClaveTema,
				strNombre_TEM as Tema,
				strDescripcion_TEM as DescripcionTema			
		FROM tblTEMa inner join tblCUrso_TEma on idTEM_CUTE = intCod_TEM
		inner join tblCURso on idCUR_CUTE = intCod_CUR
		inner join tblPROgramacion on idCUR_PRO = intCod_CUR
		WHERE intCod_PRO = @Codigo
	end

END
GO

alter PROCEDURE USP_PROgramacion_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_PRO as Clave,
						idCUR_PRO as Curso,
						intCupos_PRO as Cupos,
						CONVERT (varchar(10), dtmFechaInicio_PRO, 103) as FechaInicio,
						strEstado_PRO as Estado,
						idDocente_PRO as Docente
			FROM tblPROgramacion
			WHERE intCod_PRO = @Codigo
			EXEC USP_PROgramacion_BuscarGrid @Codigo
  END
GO

--exec USP_PROgramacion_BuscarXCodigo 1;

CREATE PROCEDURE USP_PROgramacion_Grabar
	@idCuso int,
	@idEmpleado int,
	@FechaInicio datetime,
	@Estado varchar(20),
	@Cupos int,
	@idDocente int
AS
	BEGIN
		begin transaction tx
		insert into tblPROgramacion values (@idCuso,@idEmpleado,@FechaInicio,@Estado,@Cupos,@idDocente);
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

CREATE PROCEDURE USP_PROgramacion_Modificar
	@Codigo int,
	@idCuso int,
	@idEmpleado int,
	@FechaInicio datetime,
	@Estado varchar(20),
	@Cupos int,
	@idDocente int

AS
BEGIN
	if not exists (select intCod_PRO from tblPROgramacion where intCod_PRO = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblPROgramacion
			set idCUR_PRO = @idCuso,
				idEMP_PRO=@idEmpleado,
				dtmFechaInicio_PRO = @FechaInicio,
				strEstado_PRO=@Estado,
				intCupos_PRO = @Cupos,
				idDocente_PRO = @idDocente
			where intCod_PRO = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @Codigo as  Rpta
			return
END
GO

CREATE PROCEDURE USP_PROgramacion_LlenarComboXCurso
@idCurso int
AS
BEGIN
	
	SELECT intCod_PRO as Clave, CONVERT (varchar(10), dtmFechaInicio_PRO, 103) as Dato

	from tblPROgramacion inner join tblCURso on idCUR_PRO = intCod_CUR
	where intCod_CUR = @idCurso
	order by strNombre_CUR
	
END
GO

-------------------------------------------------------------------------
----------------------------------MATRICULA------------------------------
-------------------------------------------------------------------------

CREATE PROCEDURE USP_MATricula_BuscarGeneral
	AS
		BEGIN
			SELECT intCod_MAT as Clave,
					strApellido_CLI+' '+ strNombre_CLI as Cliente,
					CONVERT (varchar(10), dtmFecha_MAT, 103) as FechaMatricula
			FROM tblMATricula inner join tblCLIente on idCLI_MAT = intCod_CLI
			ORDER BY strApellido_CLI
		END
GO

CREATE PROCEDURE USP_MATricula_BuscarGrid
@Codigo int
AS
BEGIN
	begin
		SELECT intCod_PRO as ClaveProgramacion,
				strNombre_CUR as Curso,
				CONVERT (varchar(10), dtmFechaInicio_PRO, 103) as FechaInicio,
				strEstado_PRO as EstadoProgramacion			
		FROM tblMAtricula inner join tblDEtalle_MAtricula on idMAT_DEMA = intCod_MAT
		inner join tblPROgramacion on idPRO_DEMA = intCod_PRO
		inner join tblCURso on idCUR_PRO = intCod_CUR
		WHERE intCod_MAT = @Codigo
	end

END
GO

alter PROCEDURE USP_MATricula_BuscarXCodigo
@Codigo int

AS
	BEGIN
			SELECT intCod_MAT as Clave,
					idCLI_MAT as Cliente,
					CONVERT (varchar(10), dtmFecha_MAT, 103) as FechaMatricula,
					idEMP_DEMA as EmpleadoMAtricula,
					intCod_PAG as CodigoPago,
					CONVERT (varchar(10), dtmFecha_PAG, 103) as FechaPago,
					idEMP_PAG as EmpleadoPago,
					idFPAG_PAG as FormaPago,
					realMonto_PAG as MontoPago
			FROM tblMATricula
			inner join tblDEtalle_MAtricula on idMAT_DEMA = intCod_MAT
			inner join tblPAGo on idMAT_PAG = intCod_MAT
			WHERE intCod_MAT = @Codigo
			EXEC USP_MATricula_BuscarGrid @Codigo
  END
GO

--exec USP_MATricula_BuscarXCodigo 1;

CREATE PROCEDURE USP_MATricula_Grabar
	@idCliente int,
	@FechaMatricula datetime
AS
	BEGIN
		begin transaction tx
		insert into tblMATricula values (@idCliente,@FechaMatricula);
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

CREATE PROCEDURE USP_MATricula_GrabarProgramacion
	@idMatricula int,
	@idPograma int,
	@idEmpleado int
AS
BEGIN
	if exists (select intCod_DEMA from tblDEtalle_MAtricula where idMAT_DEMA =idMAT_DEMA and idPRO_DEMA = @idPograma)
		begin 
			select -1 as Rpta
			return 
		end
	else
		
		begin
		begin transaction tx
			insert into tblDEtalle_MAtricula values (@idMatricula, @idEmpleado, @idPograma)
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
			end
		commit transaction tx
		select @idMatricula as Rpta
		return
		end
		
END
GO

CREATE PROCEDURE USP_MATricula_Modificar
	@Codigo int,
	@idCliente int,
	@FechaMatricula datetime

AS
BEGIN
	if not exists (select intCod_MAT from tblMATricula where intCod_MAT = @Codigo)
		begin
			select -1 as Rpta
			return
		end
	else
		begin transaction tx
		update tblMATricula
			set idCLI_MAT = @idCliente,
				dtmFecha_MAT = @FechaMatricula
			where intCod_MAT = @Codigo
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
				end
			commit transaction tx
			select @Codigo as  Rpta
			return
END
GO


CREATE PROCEDURE USP_MATricula_GrabarPago
	@idEmpleado int,
	@idMatricula int,
	@idFormaPago int,
	@Monto real
AS
BEGIN
	if exists (select intCod_PAG from tblPAGo where idMAT_PAG =@idMatricula)
		begin 
			select -1 as Rpta
			return 
		end
	else
		
		begin
		begin transaction tx
			insert into tblPAGo values (GETDATE(), @idEmpleado, @idMatricula,@idFormaPago,@Monto)
			if (@@ERROR>0)
				begin 
				rollback transaction tx
				select 0 as Rpta
				return
			end
		commit transaction tx
		select @idMatricula as Rpta
		return
		end
		
END
GO


CREATE PROCEDURE USP_MATricula_LlenarComboFormaPago

AS
BEGIN
	
	SELECT intCod_FPAG as Clave, strDescripcion_FPAG as Dato

	from tblForma_PAGo
	order by strDescripcion_FPAG
	
END
GO