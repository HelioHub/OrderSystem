USE [ordersystem]
GO

CREATE 
-- DROP
TABLE [tab_clients]  
( 
 [code_client] INT NOT NULL IDENTITY PRIMARY KEY,
 [name_client] VARCHAR(100) NOT NULL,  
 [address_client] VARCHAR(200),  
 [phone_client] VARCHAR(20) NOT NULL,  
 [email_client] VARCHAR(50),  
); 

CREATE 
-- DROP
TABLE [tab_item]
( 
 [code_item] INT NOT NULL IDENTITY PRIMARY KEY,
 [name_item] VARCHAR(100) NOT NULL,  
 [description_item] VARCHAR(250),  
 [price_item] DECIMAL(20,4)   
); 

CREATE 
-- DROP
TABLE [tab_orders] 
( 
 code_order INT NOT NULL IDENTITY PRIMARY KEY,
 code_client INT NOT NULL,  
 date_order DATETIME NOT NULL DEFAULT GETDATE(),
 value_order DECIMAL(20,4)
); 

CREATE TABLE tab_order_item 
( 
 code_order_item INT NOT NULL IDENTITY PRIMARY KEY,
 code_order INT,  
 code_item INT,  
 amount_order_item FLOAT,  
 unitprice_order_item FLOAT,  
); 

ALTER TABLE tab_orders ADD FOREIGN KEY(code_client) REFERENCES tab_clients (code_client)
ALTER TABLE tab_order_item ADD FOREIGN KEY(code_order) REFERENCES tab_clients (code_order)
ALTER TABLE tab_order_item ADD FOREIGN KEY(code_item) REFERENCES tab_clients (code_item)




CREATE 
-- DROP
 TABLE [dbo].[tb_transfer] (
    [id] BIGINT NOT NULL IDENTITY PRIMARY KEY,
    [salesPlatforms_id] BIGINT NOT NULL,        /* Plataforma */ 
    [channel_id] BIGINT NOT NULL,               /* Canal */
    [transferCode] VARCHAR(30),                 /* NTS-F01/123123 */
    [transferCodePrincipal] VARCHAR(30),        /* F01/123123 */
    [documentAssociated] VARCHAR (55) NOT NULL, /* NNF-F01-123123 */
    [craetionDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [shippingCompany] VARCHAR (45),             /* Transportadora */
    [originDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [insertDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [updateDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [isStatus] BIT NOT NULL DEFAULT 0,          /* Status */
    [confirmReceipt] VARCHAR(30)                /* NTE F01/123123 */
);

GRANT SELECT, UPDATE, DELETE, INSERT ON [dbo].[tb_transfer] TO USER_OF_MINIMAL;
GO

CREATE INDEX ix_tb_transfer_salesPlatforms_id ON [dbo].[tb_transfer] (salesPlatforms_id);
GO

CREATE INDEX ix_tb_transfer_channel_id ON [dbo].[tb_transfer] (channel_id);
GO

CREATE INDEX ix_tb_transfer_salesPlatforms_id_channel_id ON [dbo].[tb_transfer] (salesPlatforms_id, channel_id);
GO


CREATE 
-- DROP
TABLE [dbo].[tb_transfer_line] (
    [id] BIGINT NOT NULL IDENTITY PRIMARY KEY,
    [documentAssociated] VARCHAR (55) NOT NULL, /* NNF-F01-123123 */
	[productSku] VARCHAR (50) NOT NULL,         /* SKU produto, descrição na view */
    [sequenceSku] INT NOT NULL,                 /* Sequencia da Linha */
    [amount] DECIMAL(21,4),                     /* Quantidade */  
    [unitaryValue] DECIMAL(20,4),               /* Preço Unitário */
    [originDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [insertDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [updateDate] DATETIME NOT NULL DEFAULT GETDATE()
);

GRANT SELECT, UPDATE, DELETE, INSERT ON [dbo].[tb_transfer_line] TO USER_OF_MINIMAL;
GO

CREATE INDEX ix_tb_transfer_line_documentAssociated ON [dbo].[tb_transfer_line] (documentAssociated);
GO

CREATE INDEX ix_tb_transfer_line_productSku ON [dbo].[tb_transfer_line] (productSku);
GO

CREATE INDEX ix_tb_transfer_line_documentAssociated_productSku ON [dbo].[tb_transfer_line] (documentAssociated, sequenceSku);
GO






