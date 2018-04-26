USE [Micy]
GO

/****** Object:  Trigger [dbo].[Supplier_insert]    Script Date: 4/23/2018 2:40:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Micy
-- Create date: 04/14/2018
-- Description:	
-- =============================================
CREATE TRIGGER [dbo].[Supplier_insert] 
   ON  [dbo].[Supplier] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO [dbo].[Supplier_logs]
		([SupplierCode], [AddressID], [VATcode], [SupplierName], [OperationType], [User])

	SELECT	SupplierCode, AddressID, VATcode, SupplierName, 'INSERT', SYSTEM_USER
	FROM	inserted
END
GO

ALTER TABLE [dbo].[Supplier] ENABLE TRIGGER [Supplier_insert]
GO


