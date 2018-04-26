USE [Micy]
GO

/****** Object:  StoredProcedure [dbo].[addsupplier]    Script Date: 4/23/2018 2:54:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Micy
-- Create date: 04/04/2018
-- Description:	addsupplier
-- =============================================
CREATE PROCEDURE [dbo].[addsupplier] 
	-- Add the parameters for the stored procedure here
	@SupplierName Varchar(50),
	@VATCode varchar(8),
	@street varchar(100),
	@apt varchar(4),
	@city varchar(100),
	@state varchar(10),
	@zipcode varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRANSACTION insertsupplier
	 BEGIN TRY
		DECLARE @addressID INT

		INSERT INTO [dbo].[Address]
			([street], [apt], [city], [state], [zipcode])
		VALUES (@street, @apt, @city, @state, @zipcode)

		SET @addressID = SCOPE_IDENTITY()

		INSERT INTO [dbo].[Supplier]
			(AddressID, VATcode, SupplierName)
		VALUES (@addressID, @VATCode, @SupplierName)

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		PRINT 'INSERT FAILED'
		ROLLBACK TRANSACTION insertsupplier
	END CATCH

END
GO


