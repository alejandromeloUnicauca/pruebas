Create Database prueba_productos
GO
USE [prueba_productos]
GO
/****** Object:  Table [dbo].[product]    Script Date: 1/11/2024 7:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](2000) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 1/11/2024 7:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateProduct]
    @Name NVARCHAR(200),
    @Description NVARCHAR(2000),
    @Price DECIMAL(18, 2),
    @Stock INT,
    @ProductId INT OUTPUT  
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Product (Name, Description, Price, Stock)
    VALUES (@Name, @Description, @Price, @Stock);

    SET @ProductId = SCOPE_IDENTITY();  
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 1/11/2024 7:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
    @Id INT
AS
BEGIN
    DELETE FROM Product
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct]    Script Date: 1/11/2024 7:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchProduct]
    @Id INT = NULL
	AS
BEGIN
    SELECT * 
    FROM Product
    WHERE (@Id IS NULL OR Id = @Id);
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 1/11/2024 7:53:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
    @Id INT,
    @Name NVARCHAR(100),
    @Description NVARCHAR(255),
    @Price DECIMAL(18, 2),
    @Stock INT
AS
BEGIN
    UPDATE Product
    SET 
        Name = @Name,
        Description = @Description,
        Price = @Price,
        Stock = @Stock
    WHERE Id = @Id;
END;
GO
