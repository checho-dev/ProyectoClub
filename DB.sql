USE [master]
GO
/****** Object:  Database [CLUBSOCIAL]    Script Date: 12/05/2023 11:25:44 a. m. ******/
CREATE DATABASE [CLUBSOCIAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CLUBSOCIAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CLUBSOCIAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CLUBSOCIAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CLUBSOCIAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CLUBSOCIAL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CLUBSOCIAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CLUBSOCIAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CLUBSOCIAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CLUBSOCIAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CLUBSOCIAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CLUBSOCIAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET RECOVERY FULL 
GO
ALTER DATABASE [CLUBSOCIAL] SET  MULTI_USER 
GO
ALTER DATABASE [CLUBSOCIAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CLUBSOCIAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CLUBSOCIAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CLUBSOCIAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CLUBSOCIAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CLUBSOCIAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CLUBSOCIAL', N'ON'
GO
ALTER DATABASE [CLUBSOCIAL] SET QUERY_STORE = OFF
GO
USE [CLUBSOCIAL]
GO
/****** Object:  User [UserClub]    Script Date: 12/05/2023 11:25:45 a. m. ******/
CREATE USER [UserClub] FOR LOGIN [UserClub] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [UserClub]
GO
/****** Object:  Table [dbo].[Autorizado]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autorizado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[cedula_socio] [varchar](20) NULL,
 CONSTRAINT [Autorizado_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[id_factura] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[concepto] [text] NOT NULL,
	[valor] [varchar](10) NOT NULL,
	[cedulaF] [varchar](20) NULL,
	[Estado] [varchar](10) NULL,
 CONSTRAINT [Factura_pk] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[cedulaP] [varchar](20) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Persona_cedulaP] PRIMARY KEY CLUSTERED 
(
	[cedulaP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socio]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](20) NULL,
	[tipoDeSuscripcion] [varchar](10) NOT NULL,
	[fondos] [varchar](10) NOT NULL,
 CONSTRAINT [Socio_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Factura] ADD  CONSTRAINT [df_Factura_Estado]  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Autorizado]  WITH CHECK ADD  CONSTRAINT [FK_Autorizado_CedulaAutorizado] FOREIGN KEY([cedula])
REFERENCES [dbo].[Persona] ([cedulaP])
GO
ALTER TABLE [dbo].[Autorizado] CHECK CONSTRAINT [FK_Autorizado_CedulaAutorizado]
GO
ALTER TABLE [dbo].[Autorizado]  WITH CHECK ADD  CONSTRAINT [FK_Autorizado_Persona] FOREIGN KEY([cedula_socio])
REFERENCES [dbo].[Persona] ([cedulaP])
GO
ALTER TABLE [dbo].[Autorizado] CHECK CONSTRAINT [FK_Autorizado_Persona]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Persona] FOREIGN KEY([cedulaF])
REFERENCES [dbo].[Persona] ([cedulaP])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Persona]
GO
ALTER TABLE [dbo].[Socio]  WITH CHECK ADD  CONSTRAINT [FK_Socio_Persona] FOREIGN KEY([cedula])
REFERENCES [dbo].[Persona] ([cedulaP])
GO
ALTER TABLE [dbo].[Socio] CHECK CONSTRAINT [FK_Socio_Persona]
GO
/****** Object:  StoredProcedure [dbo].[Proc_ConsultarFacturas]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--EXEC [Proc_ConsultarFacturas] 2
CREATE PROCEDURE [dbo].[Proc_ConsultarFacturas]
	@Cedula varchar (20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT cedula	FROM Socio 
					WHERE cedula =@Cedula  ) 
	BEGIN 
		SELECT id_factura, concepto, valor, nombre, fondos FROM Factura
		INNER JOIN Persona ON cedulaF = cedulaP
		--INNER JOIN Autorizado ON Autorizado.cedula = cedulaP
		INNER JOIN Socio ON Socio.cedula = cedulaP
		WHERE  Socio.cedula =@Cedula
		AND Estado ='Pendiente'
		UNION ALL
		SELECT id_factura, concepto, valor, nombre, fondos FROM Factura
		INNER JOIN Persona ON cedulaF = cedulaP
		INNER JOIN Autorizado ON Autorizado.cedula = cedulaP
		INNER JOIN Socio ON Socio.cedula = cedula_socio
		WHERE  Socio.cedula =@Cedula
		AND Estado ='Pendiente'


	END
	ELSE IF EXISTS( SELECT cedula	FROM Autorizado WHERE cedula = @Cedula)
	BEGIN
		SELECT id_factura, concepto, valor, nombre, fondos FROM Factura
		INNER JOIN Persona ON cedulaF = cedulaP
		INNER JOIN Autorizado ON cedulaF = cedula
		INNER JOIN Socio ON Socio.cedula = cedula_socio
		WHERE  Autorizado.cedula =@Cedula
		AND Estado ='Pendiente'
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_Eliminar_Socio]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--EXEC Proc_Eliminar_Socio 3
CREATE PROCEDURE [dbo].[Proc_Eliminar_Socio]
	@IdSocio varchar (20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF NOT EXISTS( SELECT cedula_socio	FROM Autorizado 
					WHERE cedula_socio =@IdSocio  ) 
	BEGIN 
		IF NOT EXISTS( SELECT cedulaF	FROM Factura 
		WHERE cedulaF =@IdSocio  ) 
		BEGIN 
			IF NOT EXISTS(SELECT CEDULA FROM Socio WHERE cedula = @IdSocio AND tipoDeSuscripcion = 'VIP')
			BEGIN
				DELETE FROM Socio WHERE cedula= @IdSocio
				DELETE FROM Persona WHERE cedulaP= @IdSocio
			
				SELECT 1 AS RESULT
				RETURN
			END

			SELECT 2  AS RESULT--Es un VIP
			RETURN
	
		END
		SELECT 3  AS RESULT --Es tiene facturas 
		RETURN
	END
	ELSE
	BEGIN
		SELECT 4  AS RESULT -- Tiene auorizados ligados
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_EliminarPersonaAutorizada]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--EXEC [Proc_EliminarPersonaAutorizada] 9
CREATE PROCEDURE [dbo].[Proc_EliminarPersonaAutorizada]
	@Cedula varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	

	

	IF EXISTS( SELECT cedula	FROM Autorizado WHERE cedula = @Cedula ) 
	BEGIN 

		IF EXISTS( SELECT cedulaF	FROM Factura 
						WHERE cedulaF =@Cedula and Estado ='Pendiente'  ) 
		BEGIN 
			SELECT 'EL autorizado no se puede eliminar dado que tiene factura pendientes a su nombre'  AS RESULT
			RETURN
	
		END
		ELSE 
		BEGIN
			DELETE FROM Factura WHERE cedulaF =@Cedula 
			DELETE FROM Autorizado WHERE cedula =@Cedula 
			DELETE FROM Persona WHERE cedulaP =@Cedula 

			SELECT 'Se elimina correctamente el registro'  AS RESULT
			RETURN
			
		END

	END
	ELSE
	BEGIN 
			SELECT 'No existe persona autorizada con ese numero de identificacion'  AS RESULT
			RETURN
	END

	
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_PagarFactura]    Script Date: 12/05/2023 11:25:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--EXEC [Proc_PagarFactura] 2
CREATE PROCEDURE [dbo].[Proc_PagarFactura]
	@IdFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	DECLARE @Cedula VARCHAR(20)

	

	IF EXISTS( SELECT id_factura	FROM Factura 
					WHERE id_factura =@IdFactura AND Estado ='Pendiente' ) 
	BEGIN 
		SELECT @Cedula = cedulaF FROM Factura WHERE id_factura = @IdFactura
		DECLARE @fondo numeric (10)
		DECLARE	@Valor numeric (10)

		IF EXISTS( SELECT cedula	FROM Socio 
						WHERE cedula =@Cedula  ) 
		BEGIN 
			SELECT @Valor = valor,@fondo= fondos FROM Factura
			INNER JOIN Persona ON cedulaF = cedulaP
			--INNER JOIN Autorizado ON Autorizado.cedula = cedulaP
			INNER JOIN Socio ON Socio.cedula = cedulaP
			WHERE  id_factura =@IdFactura 
	
		END
		ELSE IF EXISTS( SELECT cedula	FROM Autorizado WHERE cedula = @Cedula)
		BEGIN
			SELECT @Valor = valor,@fondo= fondos, @Cedula = cedula_socio FROM Factura
			INNER JOIN Persona ON cedulaF = cedulaP
			INNER JOIN Autorizado ON cedulaF = cedula
			INNER JOIN Socio ON Socio.cedula = cedula_socio
			WHERE  id_factura =@IdFactura 
			
		END
		
	

	
	PRINT @Valor
	PRINT @fondo
		IF (@Valor<@fondo)
		BEGIN
			DECLARE @res numeric(10)
			set @res = @fondo -@Valor
			UPDATE Socio SET fondos =  convert(VARCHAR(10), @res) WHERE cedula = @Cedula
			UPDATE Factura SET Estado = 'Pagada' where id_factura  = @IdFactura
			SELECT 'Se pago factura correctamente el saldo restante es ' +convert(VARCHAR(10), @res)  AS RESULT
			RETURN
		END
		ELSE
		BEGIN
			SELECT 'La factura no se puede pagar, el monto a pagar es superior que el fondo actual ' +convert(VARCHAR(10),@fondo)   AS RESULT
			RETURN
		END
	END
	ELSE
	BEGIN 
			SELECT 'La factura consultada no existe'  AS RESULT
			RETURN
	END

	
END
GO
USE [master]
GO
ALTER DATABASE [CLUBSOCIAL] SET  READ_WRITE 
GO
