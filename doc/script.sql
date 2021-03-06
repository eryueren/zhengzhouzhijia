USE [master]
GO
/****** Object:  Database [zzzj_db]    Script Date: 2017/9/21 16:46:19 ******/
CREATE DATABASE [zzzj_db] ON  PRIMARY 
( NAME = N'zzzj_db', FILENAME = N'D:\Code\BBS\zzzj_db.ndf' , SIZE = 20544KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'zzzj_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\zzzj_db_log.ldf' , SIZE = 47616KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zzzj_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zzzj_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zzzj_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zzzj_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zzzj_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zzzj_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [zzzj_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zzzj_db] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [zzzj_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zzzj_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zzzj_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zzzj_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zzzj_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zzzj_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zzzj_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zzzj_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zzzj_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [zzzj_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zzzj_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zzzj_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zzzj_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zzzj_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zzzj_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zzzj_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zzzj_db] SET RECOVERY FULL 
GO
ALTER DATABASE [zzzj_db] SET  MULTI_USER 
GO
ALTER DATABASE [zzzj_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zzzj_db] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'zzzj_db', N'ON'
GO
USE [zzzj_db]
GO
/****** Object:  Table [dbo].[Accounts_CreditsAction]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_CreditsAction](
	[ActionId] [int] NOT NULL,
	[ActionName] [nvarchar](200) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_CreditsDetail]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_CreditsDetail](
	[DetailID] [int] NOT NULL,
	[RuleId] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ExtData] [nvarchar](max) NULL,
	[CurrentPoints] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Type] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_CreditsLimit]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_CreditsLimit](
	[LimitID] [int] NOT NULL,
	[LimitName] [nvarchar](50) NOT NULL,
	[Cycle] [int] NOT NULL,
	[CycleUnit] [nvarchar](50) NOT NULL,
	[MaxTimes] [int] NOT NULL,
	[TargetId] [int] NOT NULL,
	[TargetType] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_CreditsRule]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_CreditsRule](
	[RuleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[LimitID] [int] NOT NULL,
	[RuleName] [nvarchar](200) NOT NULL,
	[Score] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TargetId] [int] NOT NULL,
	[TargetType] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_Users]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Salt] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[NickName] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[RegDate] [datetime] NULL,
	[RegIP] [nvarchar](30) NULL,
 CONSTRAINT [PK_zzzj_USERS] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_UsersDetail]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_UsersDetail](
	[UserID] [int] NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Credits] [int] NULL,
	[Exp] [int] NULL,
	[Prestige] [int] NULL,
	[Profile] [nvarchar](500) NULL,
	[IdentityCard] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[WeChat] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[Constellation] [nvarchar](50) NULL,
	[Address] [nvarchar](300) NULL,
	[Grade] [int] NULL,
	[TopicCount] [int] NULL,
	[ReplyTopicCount] [int] NULL,
	[FavTopicCount] [int] NULL,
	[FansCount] [int] NULL,
	[FellowCount] [int] NULL,
	[FavoritedCount] [int] NULL,
	[ShareCount] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[LastDate] [datetime] NULL,
	[LastIP] [nvarchar](30) NULL,
	[GraduateSchool] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[Education] [nvarchar](50) NULL,
	[Occupation] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NULL,
	[Revenue] [nvarchar](255) NULL,
	[Site] [nvarchar](255) NULL,
	[Bio] [nvarchar](1000) NULL,
	[Interest] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_UsersFollow]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_UsersFollow](
	[UserID] [int] NOT NULL,
	[FollowUserID] [int] NOT NULL,
	[FollowUserName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Mutual] [int] NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_UsersLoginLog]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_UsersLoginLog](
	[LoginLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Remark] [nvarchar](255) NULL,
	[LoginDate] [datetime] NULL,
	[LoginIp] [nvarchar](50) NULL,
 CONSTRAINT [PK_zzzj_USER_LOGIN_LOG] PRIMARY KEY CLUSTERED 
(
	[LoginLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_UsersRecord]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_UsersRecord](
	[RecordId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts_VerifyCode]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts_VerifyCode](
	[VerifyId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[VerifyCode] [nvarchar](255) NULL,
	[Count] [int] NULL,
	[Status] [tinyint] NULL,
	[EffDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_zzzj_USER_CODE] PRIMARY KEY CLUSTERED 
(
	[VerifyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Common_ErrorLogs]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Common_ErrorLogs](
	[LogId] [int] NOT NULL,
	[LogName] [int] NOT NULL,
	[Url] [nvarchar](20) NOT NULL,
	[Message] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Common_Global]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Common_Global](
	[GlobalId] [int] NOT NULL,
	[GlobalName] [int] NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](20) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Description] [nvarchar](512) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forum_GroupType]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_GroupType](
	[GroupTypeId] [int] IDENTITY(1,1) NOT NULL,
	[GroupTypeName] [nvarchar](50) NOT NULL,
	[SectionId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[SortId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsRed] [int] NOT NULL,
	[IsHot] [int] NOT NULL,
	[IsIndex] [int] NOT NULL,
	[HavaChild] [int] NOT NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[ImgUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](512) NULL,
	[SeoTitle] [nvarchar](255) NULL,
	[SeoKeywords] [nvarchar](255) NULL,
	[SeoDescription] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Forum_GroupType] PRIMARY KEY CLUSTERED 
(
	[GroupTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forum_Section]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_Section](
	[SectionId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
	[SortId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsRed] [int] NOT NULL,
	[IsHot] [int] NOT NULL,
	[IsIndex] [int] NOT NULL,
	[HavaChild] [int] NOT NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[ImgUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](512) NULL,
	[SeoTitle] [nvarchar](255) NULL,
	[SeoKeywords] [nvarchar](255) NULL,
	[SeoDescription] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forum_Topic]    Script Date: 2017/9/21 16:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum_Topic](
	[TopicId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[GroupTypeId] [int] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[SortId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Hits] [int] NOT NULL,
	[ReplyCount] [int] NOT NULL,
	[ReplyUserId] [int] NOT NULL,
	[ReplyDate] [int] NOT NULL,
	[IsRed] [int] NOT NULL,
	[IsHot] [int] NOT NULL,
	[IsIndex] [int] NOT NULL,
	[IsLockReply] [int] NOT NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[ImgUrl] [nvarchar](255) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[TopicTitle] [nvarchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (1, N'登录')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (2, N'注册')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (3, N'文章评论')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (4, N'发布动态')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (5, N'分享图片')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (6, N'邀请用户')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (7, N'商品评论')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (8, N'晒单')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (9, N'发布商品')
INSERT [dbo].[Accounts_CreditsAction] ([ActionId], [ActionName]) VALUES (10, N'签到')
INSERT [dbo].[Accounts_CreditsLimit] ([LimitID], [LimitName], [Cycle], [CycleUnit], [MaxTimes], [TargetId], [TargetType]) VALUES (1, N'一天一次', 1, N'day', 1, 0, 0)
INSERT [dbo].[Accounts_CreditsRule] ([RuleId], [ActionId], [LimitID], [RuleName], [Score], [Description], [TargetId], [TargetType]) VALUES (16, 2, 1, N'注册', 10, N'', 0, 0)
INSERT [dbo].[Accounts_CreditsRule] ([RuleId], [ActionId], [LimitID], [RuleName], [Score], [Description], [TargetId], [TargetType]) VALUES (17, 1, 1, N'登录操作', 10, N'', 0, 0)
INSERT [dbo].[Accounts_CreditsRule] ([RuleId], [ActionId], [LimitID], [RuleName], [Score], [Description], [TargetId], [TargetType]) VALUES (18, 10, 1, N'签到', 10, N'', 0, 0)
ALTER TABLE [dbo].[Accounts_Users] ADD  CONSTRAINT [DF__Accounts___email__73852659]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Accounts_Users] ADD  CONSTRAINT [DF__Accounts___nick___74794A92]  DEFAULT ('') FOR [NickName]
GO
ALTER TABLE [dbo].[Accounts_Users] ADD  CONSTRAINT [DF__Accounts___statu__7849DB76]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Accounts_Users] ADD  CONSTRAINT [DF__Accounts___reg_t__793DFFAF]  DEFAULT (getdate()) FOR [RegDate]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  CONSTRAINT [DF_Accounts_UsersExp_Avatar]  DEFAULT ('') FOR [Avatar]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  CONSTRAINT [DF_Accounts_UsersExp_Point]  DEFAULT ((0)) FOR [Credits]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  CONSTRAINT [DF_Accounts_UsersExp_Exp]  DEFAULT ((0)) FOR [Exp]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  CONSTRAINT [DF_Accounts_UsersExp_Prestige]  DEFAULT ((0)) FOR [Prestige]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Accounts_UsersDetail] ADD  CONSTRAINT [DF_Accounts_UsersDetail_RegDate]  DEFAULT (getdate()) FOR [LastDate]
GO
ALTER TABLE [dbo].[Accounts_UsersFollow] ADD  CONSTRAINT [DF_Accounts_UsersFollow_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Accounts_UsersFollow] ADD  CONSTRAINT [DF_Accounts_UsersFollow_IsHot1]  DEFAULT ((0)) FOR [Mutual]
GO
ALTER TABLE [dbo].[Accounts_UsersFollow] ADD  CONSTRAINT [DF_Accounts_UsersFollow_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog] ADD  CONSTRAINT [DF__zzzj_user_l__user___5D2BD0E6]  DEFAULT ('') FOR [UserName]
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog] ADD  CONSTRAINT [DF__zzzj_user_l__remar__5E1FF51F]  DEFAULT ('') FOR [Remark]
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog] ADD  CONSTRAINT [DF__zzzj_user_l__login__5F141958]  DEFAULT (getdate()) FOR [LoginDate]
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog] ADD  CONSTRAINT [DF__zzzj_user_l__login__60083D91]  DEFAULT ('') FOR [LoginIp]
GO
ALTER TABLE [dbo].[Accounts_VerifyCode] ADD  CONSTRAINT [DF__zzzj_user_c__count__4A18FC72]  DEFAULT ((1)) FOR [Count]
GO
ALTER TABLE [dbo].[Accounts_VerifyCode] ADD  CONSTRAINT [DF__zzzj_user_c__statu__4B0D20AB]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Accounts_VerifyCode] ADD  CONSTRAINT [DF__zzzj_user_c__add_t__4C0144E4]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Common_ErrorLogs] ADD  CONSTRAINT [DF_Common_ErrorLogs_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Common_Global] ADD  CONSTRAINT [DF_Common_Global_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Common_Global] ADD  CONSTRAINT [DF_Common_Global_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_ParentId1]  DEFAULT ((0)) FOR [SectionId]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_FatherId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_Mutual]  DEFAULT ((99)) FOR [SortId]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_Status1]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_IsRed]  DEFAULT ((0)) FOR [IsRed]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_IsHot1]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_IsIndex1]  DEFAULT ((0)) FOR [IsIndex]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_IsHot]  DEFAULT ((0)) FOR [HavaChild]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_link_url]  DEFAULT ('') FOR [LinkUrl]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_img_url]  DEFAULT ('') FOR [ImgUrl]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_seo_title]  DEFAULT ('') FOR [SeoTitle]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_seo_keywords]  DEFAULT ('') FOR [SeoKeywords]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_seo_description]  DEFAULT ('') FOR [SeoDescription]
GO
ALTER TABLE [dbo].[Forum_GroupType] ADD  CONSTRAINT [DF_Forum_GroupType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_FatherId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_SortId]  DEFAULT ((99)) FOR [SortId]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_IsRed]  DEFAULT ((0)) FOR [IsRed]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_IsIndex1]  DEFAULT ((0)) FOR [IsIndex]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_HavaChild]  DEFAULT ((0)) FOR [HavaChild]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_LinkUrl]  DEFAULT ('') FOR [LinkUrl]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_ImgUrl]  DEFAULT ('') FOR [ImgUrl]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_SeoTitle]  DEFAULT ('') FOR [SeoTitle]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_SeoKeywords]  DEFAULT ('') FOR [SeoKeywords]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_SeoDescription]  DEFAULT ('') FOR [SeoDescription]
GO
ALTER TABLE [dbo].[Forum_Section] ADD  CONSTRAINT [DF_Forum_Section_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_ParentId2]  DEFAULT ((0)) FOR [SectionId]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_ParentId1]  DEFAULT ((0)) FOR [GroupTypeId]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsRed1]  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_SortId]  DEFAULT ((99)) FOR [SortId]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsRed4]  DEFAULT ((0)) FOR [Hits]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsRed3]  DEFAULT ((0)) FOR [ReplyCount]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsRed2]  DEFAULT ((0)) FOR [ReplyUserId]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsRed1_1]  DEFAULT ((0)) FOR [ReplyDate]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_IsRed]  DEFAULT ((0)) FOR [IsRed]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_IsIndex]  DEFAULT ((0)) FOR [IsIndex]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_IsIndex1]  DEFAULT ((0)) FOR [IsLockReply]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_LinkUrl]  DEFAULT ('') FOR [LinkUrl]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_ImgUrl]  DEFAULT ('') FOR [ImgUrl]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_表1_CreatedDate1]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Forum_Topic] ADD  CONSTRAINT [DF_Forum_Topic_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog]  WITH CHECK ADD  CONSTRAINT [FK_zzzj_USER__REFERENCE_zzzj_USERS_LOG] FOREIGN KEY([UserId])
REFERENCES [dbo].[Accounts_Users] ([UserId])
GO
ALTER TABLE [dbo].[Accounts_UsersLoginLog] CHECK CONSTRAINT [FK_zzzj_USER__REFERENCE_zzzj_USERS_LOG]
GO
ALTER TABLE [dbo].[Accounts_VerifyCode]  WITH CHECK ADD  CONSTRAINT [FK_zzzj_USER__REFERENCE_zzzj_USERS_CODE] FOREIGN KEY([UserId])
REFERENCES [dbo].[Accounts_Users] ([UserId])
GO
ALTER TABLE [dbo].[Accounts_VerifyCode] CHECK CONSTRAINT [FK_zzzj_USER__REFERENCE_zzzj_USERS_CODE]
GO
EXEC [zzzj_db].sys.sp_addextendedproperty @name=N'MS_Description', @value=N'bbs 社区数据库' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'Salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态-1删除,0正常,1待审核,2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_Users', @level2type=N'COLUMN',@level2name=N'RegIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Credits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'声望' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Prestige'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Profile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WeChat' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'WeChat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'星座' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Constellation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布的主题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'TopicCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复主题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'ReplyTopicCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'喜欢的主题数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'FavTopicCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'粉丝数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'FansCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'FellowCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收藏数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'FavoritedCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分享数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'ShareCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'LastIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'毕业学校' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'GraduateSchool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'学历' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Occupation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年收入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Revenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主页' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Site'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Bio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兴趣爱好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersDetail', @level2type=N'COLUMN',@level2name=N'Interest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被关注用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'FollowUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被关注用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'FollowUserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:正常 1:特殊关注 -1:不能再关注此人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:单向 1:已互相关注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'Mutual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersFollow', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'LoginLogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'LoginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersLoginLog', @level2type=N'COLUMN',@level2name=N'LoginIp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'RecordId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_UsersRecord', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'VerifyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成码类别 password取回密码,register邀请注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'VerifyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0未使用1已使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'EffDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts_VerifyCode', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'LogId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'LogName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_ErrorLogs', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'GlobalId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'GlobalName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'Key'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0正常1禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Common_Global', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'GroupTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'GroupTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息父级Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'SectionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'板块Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'SortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1删除、0正常 1待审核 2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'IsRed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'IsHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首页展示  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'IsIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有子节点  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'HavaChild'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'SeoTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'SeoKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'SeoDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_GroupType', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SectionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息父级Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SectionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1删除、0正常 1待审核 2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'IsRed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'IsHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首页展示  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'IsIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有子节点  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'HavaChild'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SeoTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SeoKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'SeoDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Section', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'TopicId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息父级Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'SectionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'GroupTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小组分类信息名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'SortId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'-1删除、0正常 1待审核 2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'ReplyCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后回复人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'ReplyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'ReplyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'IsRed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'IsHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首页展示  0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'IsIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定回复 0、否 1、是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'IsLockReply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Forum_Topic', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
USE [master]
GO
ALTER DATABASE [zzzj_db] SET  READ_WRITE 
GO
