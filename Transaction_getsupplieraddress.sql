USE [Micy]
GO

/****** Object:  StoredProcedure [dbo].[GetSupplierAddress]    Script Date: 4/23/2018 2:55:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Micy
-- Create date: 04/04/2018
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetSupplierAddress] 
	-- Add the parameters for the stored procedure here
	@VATCode varchar(8)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Address.*
	from Supplier 
	JOIN Address on Supplier.AddressID = Address.AddressID
	WHERE Supplier.VATcode = @VATCode
END
GO


