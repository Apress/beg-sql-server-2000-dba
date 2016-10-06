if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_age_range]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_age_range
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_customer]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_customer
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_product]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_product
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_store]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_store
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_time]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_time
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_sales_fact_zip_code]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[sales_fact] DROP CONSTRAINT FK_sales_fact_zip_code
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[age_range]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[age_range]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[customer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[customer]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[product]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[product]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sales_fact]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[sales_fact]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[store]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[store]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[time]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[time]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[zip_code]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[zip_code]
GO

CREATE TABLE [dbo].[age_range] (
	[age_range_key] [int] IDENTITY (1, 1) NOT NULL ,
	[age_range] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[customer] (
	[customer_key] [int] IDENTITY (1, 1) NOT NULL ,
	[customer_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[product] (
	[product_key] [int] IDENTITY (1, 1) NOT NULL ,
	[product_description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[sales_fact] (
	[customer_key] [int] NOT NULL ,
	[age_range_key] [int] NOT NULL ,
	[product_key] [int] NOT NULL ,
	[zip_code_key] [int] NOT NULL ,
	[store_key] [int] NOT NULL ,
	[time_key] [int] NOT NULL ,
	[sales_amount] [smallmoney] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[store] (
	[store_key] [int] IDENTITY (1, 1) NOT NULL ,
	[store_name_and_address] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[time] (
	[time_key] [int] IDENTITY (1, 1) NOT NULL ,
	[date_and_time] [smalldatetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[zip_code] (
	[zip_code_key] [int] IDENTITY (1, 1) NOT NULL ,
	[zip_code] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[age_range] WITH NOCHECK ADD 
	CONSTRAINT [PK_age_range] PRIMARY KEY  CLUSTERED 
	(
		[age_range_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[customer] WITH NOCHECK ADD 
	CONSTRAINT [PK_customer1] PRIMARY KEY  CLUSTERED 
	(
		[customer_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[product] WITH NOCHECK ADD 
	CONSTRAINT [PK_product] PRIMARY KEY  CLUSTERED 
	(
		[product_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sales_fact] WITH NOCHECK ADD 
	CONSTRAINT [PK_sales_fact] PRIMARY KEY  CLUSTERED 
	(
		[customer_key],
		[age_range_key],
		[product_key],
		[zip_code_key],
		[store_key],
		[time_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[store] WITH NOCHECK ADD 
	CONSTRAINT [PK_store] PRIMARY KEY  CLUSTERED 
	(
		[store_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[time] WITH NOCHECK ADD 
	CONSTRAINT [PK_time] PRIMARY KEY  CLUSTERED 
	(
		[time_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[zip_code] WITH NOCHECK ADD 
	CONSTRAINT [PK_demographic] PRIMARY KEY  CLUSTERED 
	(
		[zip_code_key]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[sales_fact] ADD 
	CONSTRAINT [FK_sales_fact_age_range] FOREIGN KEY 
	(
		[age_range_key]
	) REFERENCES [dbo].[age_range] (
		[age_range_key]
	),
	CONSTRAINT [FK_sales_fact_customer] FOREIGN KEY 
	(
		[customer_key]
	) REFERENCES [dbo].[customer] (
		[customer_key]
	),
	CONSTRAINT [FK_sales_fact_product] FOREIGN KEY 
	(
		[product_key]
	) REFERENCES [dbo].[product] (
		[product_key]
	),
	CONSTRAINT [FK_sales_fact_store] FOREIGN KEY 
	(
		[store_key]
	) REFERENCES [dbo].[store] (
		[store_key]
	),
	CONSTRAINT [FK_sales_fact_time] FOREIGN KEY 
	(
		[time_key]
	) REFERENCES [dbo].[time] (
		[time_key]
	),
	CONSTRAINT [FK_sales_fact_zip_code] FOREIGN KEY 
	(
		[zip_code_key]
	) REFERENCES [dbo].[zip_code] (
		[zip_code_key]
	)
GO

