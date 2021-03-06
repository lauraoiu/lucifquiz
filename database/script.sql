USE [master]
GO
/****** Object:  Database [LAB2SE141031]    Script Date: 2/26/2021 10:55:36 PM ******/
CREATE DATABASE [LAB2SE141031]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB2SE141031', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB2SE141031.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB2SE141031_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB2SE141031_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB2SE141031] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB2SE141031].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB2SE141031] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB2SE141031] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB2SE141031] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB2SE141031] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB2SE141031] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB2SE141031] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB2SE141031] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB2SE141031] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB2SE141031] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB2SE141031] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB2SE141031] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB2SE141031] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB2SE141031] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB2SE141031] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB2SE141031] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB2SE141031] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB2SE141031] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB2SE141031] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB2SE141031] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB2SE141031] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB2SE141031] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB2SE141031] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB2SE141031] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAB2SE141031] SET  MULTI_USER 
GO
ALTER DATABASE [LAB2SE141031] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB2SE141031] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB2SE141031] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB2SE141031] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB2SE141031] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB2SE141031] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LAB2SE141031] SET QUERY_STORE = OFF
GO
USE [LAB2SE141031]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[fb_id] [nvarchar](100) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[id] [uniqueidentifier] NOT NULL,
	[answer_content] [nvarchar](500) NOT NULL,
	[id_question] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [uniqueidentifier] NOT NULL,
	[question_content] [nvarchar](500) NOT NULL,
	[id_answer_correct] [uniqueidentifier] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[id_subject] [uniqueidentifier] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[id] [uniqueidentifier] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[account_email] [nvarchar](50) NOT NULL,
	[id_subject] [uniqueidentifier] NOT NULL,
	[quantity_quiz_question] [int] NULL,
	[quantity_correct_answer] [int] NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quizQuestion]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quizQuestion](
	[id_quiz] [uniqueidentifier] NOT NULL,
	[id_question] [uniqueidentifier] NOT NULL,
	[id_answer_correct] [uniqueidentifier] NOT NULL,
	[id_answer_chosen] [uniqueidentifier] NULL,
 CONSTRAINT [PK_quiz_question] PRIMARY KEY CLUSTERED 
(
	[id_quiz] ASC,
	[id_question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 2/26/2021 10:55:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'hihi@haha.huhu', N'123123', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'lapl1412@gmail.com', N'Tiêu Trung Lập', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'admin', N'activate', N'1196667200735503')
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'lapttse141031@fpt.edu.vn', N'Lập Xinh Gái', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'test@gmail.com', N'testetst', N'37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'test262@gmail.com', N'testet', N'bbb59da3af939f7af5f360f2ceb80a496e3bae1cd87dde426db0ae40677e1c2c', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'tester@gmail.com', N'tester', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'testwasaaaaserw@gmadf', N'sewrqw', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'student', N'new', NULL)
INSERT [dbo].[account] ([email], [name], [password], [role], [status], [fb_id]) VALUES (N'testwasaserw@gmadf', N'adf21312', N'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', N'student', N'new', NULL)
GO
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'a5a1d65b-aeda-4302-b871-06437fd9f141', N'sai', N'cd2010b0-2155-477a-8125-4996d797039e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'710a30a3-5d0b-49d2-b484-1d41bc2350ca', N'ThÆ°á»ng cÃ³ mÃ u Äá», phÃ¨n, chau, nghÃ¨o, mÃ¹n', N'11375bab-d501-4c53-aa83-1ac525e746fc')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'4d868738-e641-42c9-ad05-27778ce58de5', N'rat dung', N'cd2010b0-2155-477a-8125-4996d797039e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'37c747ee-1cf2-462a-ad99-477ca38da10e', N'2', N'6f6b9d82-9955-4d27-b740-ac78c94559b4')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'3ce36ddc-449d-404d-aea2-4b92e1959134', N'dung', N'cd2010b0-2155-477a-8125-4996d797039e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'e5382292-bdc4-44f0-b5e7-51b1063bcf08', N'3', N'72fa77f0-3bd2-46f9-8015-e13cd421943c')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'59a8e8dd-3a4e-4a36-bf5c-594647105e55', N'wrong', N'f24e83e1-ef11-42a2-ae68-581fa4925b51')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', N'10', N'72fa77f0-3bd2-46f9-8015-e13cd421943c')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'4c246cf9-e46f-4abc-802b-636e2f67dcbb', N'2', N'72fa77f0-3bd2-46f9-8015-e13cd421943c')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'6bf82580-f3f4-4c6c-b0e6-6631bcf60a5d', N'qua sai', N'cd2010b0-2155-477a-8125-4996d797039e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'95308769-3054-454e-9be2-7816fa91830e', N'wrong', N'f24e83e1-ef11-42a2-ae68-581fa4925b51')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'8d185b06-5ebf-456f-bb68-7afa484cdd9b', N'Ná»n cÃ´ng nghiá»p hiá»n Äáº¡i', N'08e7b231-96ae-4f3a-aaef-6ed82fc5ac4e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'8ea8a859-859f-4e51-ada3-8ff47802e5b7', N'4', N'72fa77f0-3bd2-46f9-8015-e13cd421943c')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'1188772e-21d1-456a-a6a6-90be8bd7c7a6', N'ThÆ°á»ng cÃ³ mÃ u Äen, xá»p thoÃ¡t nÆ°á»c', N'11375bab-d501-4c53-aa83-1ac525e746fc')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'f8e24b3c-6c1f-431f-b3c1-913946c39f01', N'c', N'33818c04-315e-4240-b4b4-8afa44a43f80')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'262289c4-e154-4ba3-8c4c-97ae069485c0', N'0', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'1dd399aa-31b0-44cb-b394-97b3ffbba742', N'456', N'6f6b9d82-9955-4d27-b740-ac78c94559b4')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'9b764d63-4d37-4fed-876d-9ad9d6ff7d7d', N'true', N'f24e83e1-ef11-42a2-ae68-581fa4925b51')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'57d8e3fd-0557-4aa1-81d7-ab2847fb5d43', N'456', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'ea674ede-4495-4817-972b-b1876f9683ea', N'20', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'f4e133de-9470-41a7-a337-b585e569bb70', N'a', N'33818c04-315e-4240-b4b4-8afa44a43f80')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'757eef1a-2055-456d-95a8-b5c6bbc3b97b', N'456', N'6f6b9d82-9955-4d27-b740-ac78c94559b4')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'4178a9ae-693d-4d78-af13-cc9567b71d44', N'86', N'6f6b9d82-9955-4d27-b740-ac78c94559b4')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'3aa2196b-4d19-4e82-a38b-d2acda4ef82d', N'd', N'33818c04-315e-4240-b4b4-8afa44a43f80')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'e7f7b777-0f88-43c8-9c11-d5de598bb111', N'Ná»n nÃ´ng nghiá»p nhá» bÃ©', N'08e7b231-96ae-4f3a-aaef-6ed82fc5ac4e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'72aab980-87f2-47c1-9609-e678e2b268a9', N'b', N'33818c04-315e-4240-b4b4-8afa44a43f80')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'e3e9a0a5-468b-4fd1-9744-e840b58369ee', N'TrÃ¬nh Äá» khoa há»c ká»¹ thuáº­t hiá»n Äáº¡i', N'08e7b231-96ae-4f3a-aaef-6ed82fc5ac4e')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'c40d91a4-1e7a-4ab9-ac09-ec38f8536ca9', N'wrong', N'f24e83e1-ef11-42a2-ae68-581fa4925b51')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'5a742072-f70b-463a-b97f-f1038e71b03a', N'ThÆ°á»ng cÃ³ mÃ u Äá», vÃ ng ráº¥t mÃ u má»¡', N'11375bab-d501-4c53-aa83-1ac525e746fc')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'39b7b6d5-c57b-42af-84b3-f30cf001c04a', N'457', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'5d994cff-7ac0-427f-9d4d-f84193167597', N'ThÆ°á»ng cÃ³ mÃ u nÃ¢u, khÃ´ khÃ´ng thÃ­ch há»£p trá»ng lÃºa', N'11375bab-d501-4c53-aa83-1ac525e746fc')
INSERT [dbo].[answer] ([id], [answer_content], [id_question]) VALUES (N'c65ce24b-be8e-478a-b43d-f96f86d9669e', N'Ná»n nÃ´ng nghiá»p hiá»n Äáº¡i', N'08e7b231-96ae-4f3a-aaef-6ed82fc5ac4e')
GO
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'11375bab-d501-4c53-aa83-1ac525e746fc', N'Äáº·c Äiá»m cá»§a Äáº¥t feralit lÃ ?', N'710a30a3-5d0b-49d2-b484-1d41bc2350ca', CAST(N'2021-02-19T21:31:49.753' AS DateTime), N'8d5663ea-78ac-4022-ba4c-956ca531bd2e', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'cd2010b0-2155-477a-8125-4996d797039e', N'Lap dep trai dung hay sai?', N'4d868738-e641-42c9-ad05-27778ce58de5', CAST(N'2021-02-26T12:58:06.497' AS DateTime), N'ae29ec8d-4afb-468b-bf29-cf943291f01b', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'f24e83e1-ef11-42a2-ae68-581fa4925b51', N'test create', N'9b764d63-4d37-4fed-876d-9ad9d6ff7d7d', CAST(N'2021-02-26T12:22:53.013' AS DateTime), N'06bd57df-4e48-4a3b-b815-ebf35fb02e3c', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'08e7b231-96ae-4f3a-aaef-6ed82fc5ac4e', N'Äiá»m xuáº¥t phÃ¡t cá»§a ná»n kinh táº¿ nÆ°á»c ta', N'e7f7b777-0f88-43c8-9c11-d5de598bb111', CAST(N'2021-02-19T21:51:46.303' AS DateTime), N'8d5663ea-78ac-4022-ba4c-956ca531bd2e', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'33818c04-315e-4240-b4b4-8afa44a43f80', N'test', N'72aab980-87f2-47c1-9609-e678e2b268a9', CAST(N'2021-02-19T21:45:32.813' AS DateTime), N'c0478b70-7133-48a9-b72a-76cc25b66915', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'6f6b9d82-9955-4d27-b740-ac78c94559b4', N'1+1=?', N'37c747ee-1cf2-462a-ad99-477ca38da10e', CAST(N'2021-02-19T17:42:14.667' AS DateTime), N'a79036db-b33e-4478-a3a6-2083fd8b6992', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'5 + 5 = ?', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', CAST(N'2021-02-20T17:04:47.527' AS DateTime), N'a79036db-b33e-4478-a3a6-2083fd8b6992', N'Activate')
INSERT [dbo].[question] ([id], [question_content], [id_answer_correct], [create_date], [id_subject], [status]) VALUES (N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'10 + 10 = ?', N'ea674ede-4495-4817-972b-b1876f9683ea', CAST(N'2021-02-19T21:38:43.970' AS DateTime), N'a79036db-b33e-4478-a3a6-2083fd8b6992', N'Activate')
GO
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'76401a72-5cb6-49dc-ae36-014161d8fabb', N'Submitted', CAST(N'2021-02-26T07:32:58.897' AS DateTime), N'tester@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'aa4f1826-79b1-4a72-8387-0f7b4abd3131', N'Submitted', CAST(N'2021-02-26T13:04:05.623' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 3, 2)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'7540fa4c-eb47-4848-90ab-1cf94d88935c', N'Submitted', CAST(N'2021-02-26T12:39:44.920' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 1)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'b3767baf-873e-4ef7-b8cb-2b0a25ff7819', N'Submitted', CAST(N'2021-02-26T07:31:30.133' AS DateTime), N'tester@gmail.com', N'8d5663ea-78ac-4022-ba4c-956ca531bd2e', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'acf4d810-40cb-485e-b071-38434aed3b49', N'Submitted', CAST(N'2021-02-26T07:26:59.663' AS DateTime), N'tester@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 2, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'87e162f6-12c6-401c-b2aa-69141be566db', N'Submitted', CAST(N'2021-02-26T13:03:41.900' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'f8c412a5-fef8-41f9-9397-7bf34afc7a81', N'Submitted', CAST(N'2021-02-26T12:59:25.677' AS DateTime), N'test262@gmail.com', N'ae29ec8d-4afb-468b-bf29-cf943291f01b', 1, 1)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'a16c93a1-5154-404e-b82c-80484b011eeb', N'Submitted', CAST(N'2021-02-26T07:18:24.997' AS DateTime), N'tester@gmail.com', N'c0478b70-7133-48a9-b72a-76cc25b66915', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'3b0a8a82-31a8-417e-88c6-a196f2818716', N'Submitted', CAST(N'2021-02-26T13:04:00.633' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'ce28c28b-936c-4687-b49d-a6466e69835c', N'Submitted', CAST(N'2021-02-26T12:24:09.270' AS DateTime), N'test262@gmail.com', N'06bd57df-4e48-4a3b-b815-ebf35fb02e3c', 1, 1)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'47e594bd-7f22-41d5-ad5a-a75996f4f9e8', N'Submitted', CAST(N'2021-02-26T08:30:01.097' AS DateTime), N'tester@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 1)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'5ff46f1d-6cb4-49f4-a8f3-aa0de3d03c66', N'Submitted', CAST(N'2021-02-26T13:03:48.703' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'9af7708d-9925-42f3-92bf-ae3eb4b0da52', N'Submitted', CAST(N'2021-02-26T08:20:58.437' AS DateTime), N'tester@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 2, 0)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'91b196f8-e670-4bce-9a24-b3ed7e6362a6', N'NotYetSubmitted', CAST(N'2021-02-26T08:30:45.110' AS DateTime), N'tester@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, NULL)
INSERT [dbo].[quiz] ([id], [status], [start_date], [account_email], [id_subject], [quantity_quiz_question], [quantity_correct_answer]) VALUES (N'b4316b9e-79b2-4c85-ac7f-c976bffc6bf5', N'Submitted', CAST(N'2021-02-26T13:03:55.010' AS DateTime), N'test262@gmail.com', N'a79036db-b33e-4478-a3a6-2083fd8b6992', 1, 0)
GO
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'76401a72-5cb6-49dc-ae36-014161d8fabb', N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'aa4f1826-79b1-4a72-8387-0f7b4abd3131', N'6f6b9d82-9955-4d27-b740-ac78c94559b4', N'37c747ee-1cf2-462a-ad99-477ca38da10e', N'37c747ee-1cf2-462a-ad99-477ca38da10e')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'aa4f1826-79b1-4a72-8387-0f7b4abd3131', N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'aa4f1826-79b1-4a72-8387-0f7b4abd3131', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', N'262289c4-e154-4ba3-8c4c-97ae069485c0')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'7540fa4c-eb47-4848-90ab-1cf94d88935c', N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'b3767baf-873e-4ef7-b8cb-2b0a25ff7819', N'11375bab-d501-4c53-aa83-1ac525e746fc', N'710a30a3-5d0b-49d2-b484-1d41bc2350ca', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'acf4d810-40cb-485e-b071-38434aed3b49', N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'acf4d810-40cb-485e-b071-38434aed3b49', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'87e162f6-12c6-401c-b2aa-69141be566db', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'f8c412a5-fef8-41f9-9397-7bf34afc7a81', N'cd2010b0-2155-477a-8125-4996d797039e', N'4d868738-e641-42c9-ad05-27778ce58de5', N'4d868738-e641-42c9-ad05-27778ce58de5')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'a16c93a1-5154-404e-b82c-80484b011eeb', N'33818c04-315e-4240-b4b4-8afa44a43f80', N'72aab980-87f2-47c1-9609-e678e2b268a9', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'3b0a8a82-31a8-417e-88c6-a196f2818716', N'6f6b9d82-9955-4d27-b740-ac78c94559b4', N'37c747ee-1cf2-462a-ad99-477ca38da10e', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'ce28c28b-936c-4687-b49d-a6466e69835c', N'f24e83e1-ef11-42a2-ae68-581fa4925b51', N'9b764d63-4d37-4fed-876d-9ad9d6ff7d7d', N'9b764d63-4d37-4fed-876d-9ad9d6ff7d7d')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'47e594bd-7f22-41d5-ad5a-a75996f4f9e8', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', N'ea674ede-4495-4817-972b-b1876f9683ea')
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'5ff46f1d-6cb4-49f4-a8f3-aa0de3d03c66', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'9af7708d-9925-42f3-92bf-ae3eb4b0da52', N'72fa77f0-3bd2-46f9-8015-e13cd421943c', N'2885c0fc-8ee5-4fa6-affc-5a1ffb380306', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'9af7708d-9925-42f3-92bf-ae3eb4b0da52', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'91b196f8-e670-4bce-9a24-b3ed7e6362a6', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
INSERT [dbo].[quizQuestion] ([id_quiz], [id_question], [id_answer_correct], [id_answer_chosen]) VALUES (N'b4316b9e-79b2-4c85-ac7f-c976bffc6bf5', N'5d0917a4-eec3-44bf-8501-e646c63ecdf7', N'ea674ede-4495-4817-972b-b1876f9683ea', NULL)
GO
INSERT [dbo].[subject] ([id], [name]) VALUES (N'a79036db-b33e-4478-a3a6-2083fd8b6992', N'Math')
INSERT [dbo].[subject] ([id], [name]) VALUES (N'cb113bcc-0457-4c3c-94f5-364570b6843b', N'Physical')
INSERT [dbo].[subject] ([id], [name]) VALUES (N'c0478b70-7133-48a9-b72a-76cc25b66915', N'Disciple')
INSERT [dbo].[subject] ([id], [name]) VALUES (N'8d5663ea-78ac-4022-ba4c-956ca531bd2e', N'Geography')
INSERT [dbo].[subject] ([id], [name]) VALUES (N'ae29ec8d-4afb-468b-bf29-cf943291f01b', N'Literature')
INSERT [dbo].[subject] ([id], [name]) VALUES (N'06bd57df-4e48-4a3b-b815-ebf35fb02e3c', N'Chemistry')
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_question] FOREIGN KEY([id_question])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_question]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_account] FOREIGN KEY([account_email])
REFERENCES [dbo].[account] ([email])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_account]
GO
ALTER TABLE [dbo].[quizQuestion]  WITH CHECK ADD  CONSTRAINT [FK_quiz_question_quiz] FOREIGN KEY([id_quiz])
REFERENCES [dbo].[quiz] ([id])
GO
ALTER TABLE [dbo].[quizQuestion] CHECK CONSTRAINT [FK_quiz_question_quiz]
GO
USE [master]
GO
ALTER DATABASE [LAB2SE141031] SET  READ_WRITE 
GO
