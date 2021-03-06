USE [master]
GO
/****** Object:  Database [Auto3000]    Script Date: 06/10/2013 23:08:45 ******/
CREATE DATABASE [Auto3000] ON  PRIMARY 
( NAME = N'Auto3000', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.ANUJ\MSSQL\DATA\Auto3000.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Auto3000_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.ANUJ\MSSQL\DATA\Auto3000.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Auto3000] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Auto3000].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Auto3000] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Auto3000] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Auto3000] SET ARITHABORT OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Auto3000] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Auto3000] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Auto3000] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Auto3000] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Auto3000] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Auto3000] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Auto3000] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Auto3000] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Auto3000] SET  DISABLE_BROKER
GO
ALTER DATABASE [Auto3000] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Auto3000] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Auto3000] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Auto3000] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Auto3000] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Auto3000] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Auto3000] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Auto3000] SET  READ_WRITE
GO
ALTER DATABASE [Auto3000] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Auto3000] SET  MULTI_USER
GO
ALTER DATABASE [Auto3000] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Auto3000] SET DB_CHAINING OFF
GO
USE [Auto3000]
GO
/****** Object:  Schema [Customer]    Script Date: 06/10/2013 23:08:45 ******/
CREATE SCHEMA [Customer] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Admin]    Script Date: 06/10/2013 23:08:45 ******/
CREATE SCHEMA [Admin] AUTHORIZATION [dbo]
GO
/****** Object:  Table [Admin].[UserTypes]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[Users]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Admin].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [char](1) NULL,
	[Address] [nvarchar](1000) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Customer].[Subjects]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Customer].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Admin].[Questions]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[OffLineMessage]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[OffLineMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](80) NULL,
	[Message] [nvarchar](500) NULL,
	[ReplyMessage] [nvarchar](max) NULL,
	[IsRead] [bit] NULL,
	[SendDate] [date] NULL,
	[ReplyDate] [date] NULL,
 CONSTRAINT [PK_OffLineMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Feedbacks]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[Feedbacks](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[FeedBack] [nvarchar](max) NULL,
	[Ratings] [int] NOT NULL,
	[IsShown] [bit] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Admin].[ChatHistory]    Script Date: 06/10/2013 23:08:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Admin].[ChatHistory](
	[ChatId] [int] IDENTITY(1,1) NOT NULL,
	[ToUserId] [nvarchar](100) NULL,
	[FromUserId] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[Message] [nvarchar](500) NULL,
	[Date] [datetime] NULL,
	[ChatConnectionID] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChatHistory] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[aS_fn_Split]    Script Date: 06/10/2013 23:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[aS_fn_Split]
(
	@text varchar(8000), 
	@delimiter varchar(20)
)

RETURNS @Strings TABLE

(    

  position int IDENTITY PRIMARY KEY,

  value varchar(8000)   

)

AS

BEGIN

 

DECLARE @index int 

SET @index = -1 

 

WHILE (LEN(@text) > 0) 

  BEGIN  

    SET @index = CHARINDEX(@delimiter , @text)  

    IF (@index = 0) AND (LEN(@text) > 0)  

      BEGIN   

        INSERT INTO @Strings VALUES (@text)

          BREAK  

      END  

    IF (@index > 1)  

      BEGIN   

        INSERT INTO @Strings VALUES (LEFT(@text, @index - 1))   

        SET @text = RIGHT(@text, (LEN(@text) - @index))  

      END  

    ELSE 

      SET @text = RIGHT(@text, (LEN(@text) - @index)) 

    END

  RETURN

END
GO
/****** Object:  Table [Admin].[Announcements]    Script Date: 06/10/2013 23:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Admin].[Announcements](
	[AnnouncementId] [int] IDENTITY(1,1) NOT NULL,
	[ExpiryDate] [date] NULL,
	[Title] [varchar](100) NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Announments] PRIMARY KEY CLUSTERED 
(
	[AnnouncementId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Admin].[usp_ChatHistory_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author: Anuj  
-- Create date: 23-05-2010  
-- Description: Get records from Admin.ChatHistory  
-- =============================================  
CREATE PROCEDURE [Admin].[usp_ChatHistory_sel] --'6efa04ad-28b7-4c40-ac91-4fe993240580' , '1'
 (  
   
    @FromUserId NVARCHAR(100),  
    @ToUserId NVARCHAR(MAX)  
 )  
AS  
BEGIN  
  
 --SET NOCOUNT ON;  
   
    SELECT ToUserId,FromUserId,[Message], UserName,ClientName FROM Admin.ChatHistory   
    WHERE (FromUserId IN(SELECT VALUE FROM [dbo].[aS_fn_Split](@ToUserId,',')) OR ToUserId IN(SELECT VALUE FROM [dbo].[aS_fn_Split](@ToUserId,',')))  
    AND (FromUserId = @FromUserId OR ToUserId = @FromUserId)  
    order by ChatConnectionID,ChatId  
      
END
GO
/****** Object:  StoredProcedure [Admin].[usp_ChatHistory_ins]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- =============================================
-- Author:		Anuj
-- Create date: 23-05-2013
-- Description:	Insert records into chat history table
-- =============================================
CREATE PROCEDURE [Admin].[usp_ChatHistory_ins]
 (
   @ToUserId NVARCHAR(100),
   @FromUserId NVARCHAR(100),
   @Message NVARCHAR(500),
   @UserName NVARCHAR(50),
   @ClientName NVARCHAR(50),
   @ConnectionId NVARCHAR(100)
 )
AS
BEGIN
     INSERT Admin.ChatHistory(ToUserId, FromUserId, [Message], [Date], UserName, ClientName, ChatConnectionID)
     VALUES(@ToUserId, @FromUserId, @Message, GETDATE(),@UserName, @ClientName, @ConnectionId)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Admin].[usp_Announcement_sel]
(
@AnnouncementId int
)
AS
BEGIN
--[Admin].[usp_Announcement_sel] 0
if @AnnouncementId=0 begin set @AnnouncementId=null end 
	SET NOCOUNT ON;
select AnnouncementId, CONVERT(VARCHAR(10), ExpiryDate, 101)ExpiryDate, Title,IsActive, [Description] from [Admin].Announcements
where  AnnouncementId=isnull(@AnnouncementId,AnnouncementId)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_ins]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [Admin].[usp_Announcement_ins]
(
@AnnouncementId int ,
@Title varchar(100),
@Description nvarchar(max),
@Expiry nvarchar(15),
@IsActive bit
)
as 
begin

if @AnnouncementId=0
begin
Insert into [Admin].Announcements (ExpiryDate , Title, [Description],  CreatedOn,IsActive)
values                         (@Expiry,@Title, @Description ,    getdate(),@IsActive)
select cast( scope_identity() as int ) as ReturnValue
end
else
begin
update [Admin].Announcements 
set ExpiryDate =@Expiry,
 Title=@Title,
 [Description]=@Description,
 ModifiedOn=getdate(),
 IsActive=@IsActive
 where AnnouncementId=@AnnouncementId
select @AnnouncementId
end
end
GO
/****** Object:  StoredProcedure [Admin].[usp_Announcement_del]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Admin].[usp_Announcement_del]
	(
	@AnnouncementId int
	)
AS
BEGIN

delete from Admin.Announcements where AnnouncementId=@AnnouncementId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUsers_del]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [Admin].[usp_AdminUsers_del]
	(
	@UserId int
	)
AS
BEGIN

delete from [Admin].Users where UserId=@UserId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUser_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [Admin].[usp_AdminUser_sel]
(
@UserName nvarchar(100),
@Password nvarchar(100)
)
as
begin

if exists (select 1 from Admin.Users where UserName=@UserName and [Password]=@Password)
begin
select cast(UserId as varchar(100) )+'|'+ FirstName+'|'+LastName+'|'+'UserTypeId' as  ResultVal from Admin.Users where UserName=@UserName and [Password]=@Password
end 
else
begin
select '0' as ResultVal
end
end
GO
/****** Object:  StoredProcedure [Admin].[usp_AdminUser_ins]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [Admin].[usp_AdminUser_ins]
(
@UserId int ,
@UserName nvarchar(100),
@Password nvarchar(100),
@UserTypeId int,
@FirstName nvarchar(100),
@LastName nvarchar(100),
@Email nvarchar(50),
@IsActive bit
)
as 
begin
--[Admin].[usp_AdminUser_ins] 2,'SA','AS',1,'SASAS','SASASA','ASAAS',1
if @UserId=0
begin
if not exists(select 1 from [Admin].Users where UserName=@UserName)
begin
Insert into [Admin].Users ( UserName, [Password], UserTypeId, FirstName, LastName,  Email, IsActive, CreatedOn)
values                    (@UserName,  @Password, @UserTypeId,@FirstName,@LastName,@Email, @IsActive,getdate())
select cast( scope_identity() as int ) 
end
else
begin
select 0
end
end
else
begin
if not exists(select 1 from [Admin].Users where UserName=@UserName and UserId<>@UserId)
begin
update [Admin].Users
set UserName=@UserName, UserTypeId=@UserTypeId, FirstName=@FirstName,
 LastName=@LastName,  Email=@Email, IsActive=@IsActive, ModifiedOn=getdate()
 where UserId=@UserId
select @UserId
end
else
begin
select 0
end
end
end
GO
/****** Object:  Table [Customer].[FeedbackAnswers]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customer].[FeedbackAnswers](
	[FeedBackId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answers] [nvarchar](max) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Customer].[Contacts]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Customer].[Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[SubjectId] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[ZipCode] [varchar](10) NULL,
	[IsApproved] [bit] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [Admin].[usp_Users_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Gurpreet>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [Admin].[usp_Users_sel]
(
@UserId int
)
AS
BEGIn
if @UserId=0 begin set @UserId=null end 
	SET NOCOUNT ON;
select UserId, UserName, Password, UserTypeId, FirstName, LastName, Email, IsActive
from [Admin].Users where UserId=isnull(@UserId,UserId)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_OffLineMessage_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 26-05-2013
-- Description:	Get records from Admin.OffLineMessage table
-- =============================================
CREATE PROCEDURE [Admin].[usp_OffLineMessage_sel]
(
  @Id INT  = NULL
)
AS
BEGIN
	SELECT Email, [Message], SendDate FROM Admin.OffLineMessage 
	WHERE IsRead = 0 AND Id = ISNULL(@id, id)
END
GO
/****** Object:  StoredProcedure [Admin].[usp_OffLineMessage_ins]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anuj
-- Create date: 26-05-2013
-- Description:	Insert records into Admin.OffLineMessage
-- =============================================
CREATE PROCEDURE [Admin].[usp_OffLineMessage_ins]
(
  @Id INT,
  @Email NVARCHAR(80) = NULL,
  @Message NVARCHAR(80)= NULL,
  @ReplyMessage NVARCHAR(MAX)= NULL
)
AS
BEGIN
	IF(@Id > 0)
	BEGIN
	 UPDATE Admin.OffLineMessage SET ReplyMessage = @ReplyMessage, IsRead = 1,
	     ReplyDate = GETDATE()   WHERE Id = @Id
	END
	ELSE
	BEGIN
	 INSERT Admin.OffLineMessage(Email,[Message],[SendDate])
	 VALUES(@Email, @Message, GETDATE())
	END
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_upd]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Feedbacks_upd]
	(
	  @FeedBackId NVARCHAR(4000),
	  @IsShown BIT
	 )
	AS
	BEGIN
		UPDATE Customer.Feedbacks SET IsShown = @IsShown WHERE FeedBackId = @FeedBackId
		select @FeedBackId
	END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		<Author, Gopi>
	-- Create date: <Create Date, 29-04-2013>
	-- Description:	<Description, Get records from Customer.Feedbacks table to show on admin>
	-- =============================================
	CREATE PROCEDURE [Admin].[usp_Feedbacks_sel]
	 (
	  @FeedBackId INT = NULL
	 )
	AS
	BEGIN
		 SELECT FB.FeedBackId, FB.FeedBack, FB.Ratings, 
		  FB.IsShown AS Show, CONVERT(VARCHAR, FB.[Date], 101) AS SentDate,     
		 FBAnsw.Answers, Ques.[Description] AS Question, UserId
		 FROM Customer.Feedbacks FB INNER JOIN Customer.FeedbackAnswers FBAnsw
		 ON FB.FeedBackId = FBAnsw.FeedBackId
		 INNER JOIN 
		 Admin.Questions Ques ON FBAnsw.QuestionId = Ques.QuestionId
		 WHERE  FB.FeedBackId = ISNULL(@FeedBackId, FB.FeedBackId)
		
	END
GO
/****** Object:  StoredProcedure [Customer].[usp_Feedbacks_ins]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		Gopi
	-- Create date:  27-Apr-2013
	-- Description:	Insert records into Customer.Feedbacks table
	-- =============================================
	CREATE PROCEDURE [Customer].[usp_Feedbacks_ins]
	(
	  @UserId NVARCHAR(50),
	  @FeedBack NVARCHAR(MAX),
	  @Ratings INT,
	  @QuestionId INT,
	  @Answers NVARCHAR(MAX)
	  
	 )
	AS
	BEGIN
	DECLARE @retVal INT
	DECLARE @FeedbackId INT
	BEGIN TRAN FBIns
	BEGIN TRY
		 --Insert Value into Feedback Table---
		 INSERT Customer.Feedbacks(UserId, FeedBack, Ratings, [Date])
		 VALUES(@UserId, @FeedBack, @Ratings, GETDATE())
	 
		 SET @FeedbackId = SCOPE_IDENTITY()
	    
		--- Insert Value into FeedbackAnswer Table--
		 INSERT Customer.FeedbackAnswers(FeedBackId, QuestionId, Answers)
		 VALUES(@FeedbackId, @QuestionId, @Answers)
	     
		 SELECT @retVal = 1
	     
		COMMIT TRAN  FBIns
	END TRY
	BEGIN CATCH
	 SELECT @retVal = 0
	 ROLLBACK TRAN FBIns
	END CATCH
		
	END
GO
/****** Object:  StoredProcedure [Admin].[usp_Feedbacks_Del]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Feedbacks_Del] 
(
@FeedBackId INT
)
AS
BEGIN
DECLARE @retVal INT
BEGIN TRAN
BEGIN TRY 

DELETE Customer.FeedbackAnswers WHERE FeedBackId = @FeedBackId 
DELETE Customer.Feedbacks WHERE FeedBackId = @FeedBackId

SET @retVal = 1

COMMIT TRAN	
END TRY
BEGIN CATCH
SET @retVal = 0
ROLLBACK TRAN
END CATCH
RETURN @retVal
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_upd]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Admin].[usp_Contacts_upd]
(
 @ContactId INT,
 @IsApproved BIT
)
AS
BEGIN

	UPDATE Customer.Contacts SET IsApproved = @IsApproved  WHERE ContactID = @ContactId
    Select @ContactId
END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_sel]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
	-- Author:		Gopi
	-- Create date: 30-Apr-2013
	-- Description:	Get records from Customer.Contacts table
	-- =============================================
	CREATE PROCEDURE [Admin].[usp_Contacts_sel]
	(
	 @ContactId INT = NULL
	)
	AS
	BEGIN
		
		SELECT ContactId, Con.FirstName+ SPACE(1) +Con.LastName AS UserName,Con.Email, Con.Phone, Con.ZipCode,Con.IsApproved,
		CONVERT(VARCHAR, Con.[Date], 101) AS SentDate, Sub.SubjectName
		FROM Customer.Contacts Con INNER JOIN Customer.Subjects Sub ON Sub.SubjectId = Con.SubjectId
		WHERE Con.ContactId = ISNULL(@ContactId, Con.ContactId)
		 
	END
GO
/****** Object:  StoredProcedure [Admin].[usp_Contacts_del]    Script Date: 06/10/2013 23:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gopi
-- Create date: 30-Apr-2-13
-- Description:	Delete records from Customer.Contacts table
-- =============================================
CREATE PROCEDURE [Admin].[usp_Contacts_del]
(
  @ContactId INT
)
AS
BEGIN
	DELETE Customer.Contacts WHERE ContactId = @ContactId
END
GO
/****** Object:  Default [DF_OffLineMessage_IsRead]    Script Date: 06/10/2013 23:08:47 ******/
ALTER TABLE [Admin].[OffLineMessage] ADD  CONSTRAINT [DF_OffLineMessage_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
/****** Object:  Default [DF_Feedbacks_IsShown]    Script Date: 06/10/2013 23:08:47 ******/
ALTER TABLE [Customer].[Feedbacks] ADD  CONSTRAINT [DF_Feedbacks_IsShown]  DEFAULT ((0)) FOR [IsShown]
GO
/****** Object:  Default [DF_Contacts_IsApproved]    Script Date: 06/10/2013 23:09:04 ******/
ALTER TABLE [Customer].[Contacts] ADD  CONSTRAINT [DF_Contacts_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
/****** Object:  ForeignKey [FK_Users_Users]    Script Date: 06/10/2013 23:08:47 ******/
ALTER TABLE [Admin].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([CreatedBy])
REFERENCES [Admin].[Users] ([UserId])
GO
ALTER TABLE [Admin].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
/****** Object:  ForeignKey [FK_Users_Users1]    Script Date: 06/10/2013 23:08:47 ******/
ALTER TABLE [Admin].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [Admin].[Users] ([UserId])
GO
ALTER TABLE [Admin].[Users] CHECK CONSTRAINT [FK_Users_Users1]
GO
/****** Object:  ForeignKey [FK_FeedbackAnswers_Feedbacks]    Script Date: 06/10/2013 23:09:04 ******/
ALTER TABLE [Customer].[FeedbackAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackAnswers_Feedbacks] FOREIGN KEY([FeedBackId])
REFERENCES [Customer].[Feedbacks] ([FeedBackId])
GO
ALTER TABLE [Customer].[FeedbackAnswers] CHECK CONSTRAINT [FK_FeedbackAnswers_Feedbacks]
GO
/****** Object:  ForeignKey [FK_FeedbackAnswers_Questions]    Script Date: 06/10/2013 23:09:04 ******/
ALTER TABLE [Customer].[FeedbackAnswers]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackAnswers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [Admin].[Questions] ([QuestionId])
GO
ALTER TABLE [Customer].[FeedbackAnswers] CHECK CONSTRAINT [FK_FeedbackAnswers_Questions]
GO
/****** Object:  ForeignKey [FK_Contacts_Subjects]    Script Date: 06/10/2013 23:09:04 ******/
ALTER TABLE [Customer].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [Customer].[Subjects] ([SubjectId])
GO
ALTER TABLE [Customer].[Contacts] CHECK CONSTRAINT [FK_Contacts_Subjects]
GO
