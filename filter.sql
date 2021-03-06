USE [master]
GO
/****** Object:  Database [FilterAuthority]    Script Date: 03/27/2019 02:08:28 ******/
CREATE DATABASE [FilterAuthority] ON  PRIMARY 
( NAME = N'FilterAuthority', FILENAME = N'E:\FilterAuthority.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FilterAuthority_log', FILENAME = N'E:\FilterAuthority_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FilterAuthority] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FilterAuthority].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FilterAuthority] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [FilterAuthority] SET ANSI_NULLS OFF
GO
ALTER DATABASE [FilterAuthority] SET ANSI_PADDING OFF
GO
ALTER DATABASE [FilterAuthority] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [FilterAuthority] SET ARITHABORT OFF
GO
ALTER DATABASE [FilterAuthority] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [FilterAuthority] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [FilterAuthority] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [FilterAuthority] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [FilterAuthority] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [FilterAuthority] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [FilterAuthority] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [FilterAuthority] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [FilterAuthority] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [FilterAuthority] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [FilterAuthority] SET  DISABLE_BROKER
GO
ALTER DATABASE [FilterAuthority] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [FilterAuthority] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [FilterAuthority] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [FilterAuthority] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [FilterAuthority] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [FilterAuthority] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [FilterAuthority] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [FilterAuthority] SET  READ_WRITE
GO
ALTER DATABASE [FilterAuthority] SET RECOVERY FULL
GO
ALTER DATABASE [FilterAuthority] SET  MULTI_USER
GO
ALTER DATABASE [FilterAuthority] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [FilterAuthority] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'FilterAuthority', N'ON'
GO
USE [FilterAuthority]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/27/2019 02:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'老板')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'总经理')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (3, N'操作人员')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[Modules]    Script Date: 03/27/2019 02:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModulesName] [varchar](20) NOT NULL,
	[ParentId] [int] NULL,
	[Path] [varchar](50) NOT NULL,
	[Weight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Modules] ON
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (1, N'用户管理', NULL, N'/Home/UserManager', 1)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (2, N'添加用户', 1, N'/Home/AddUser', 2)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (3, N'修改用户', 1, N'/Home/AlterUser', 3)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (4, N'删除用户', 1, N'/Home/DeleteUser', 4)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (5, N'权限管理', NULL, N'/Home/PowerManager', 5)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (6, N'查看用户', 1, N'/Home/CheckUser', 6)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (7, N'基础模块', NULL, N'/Home/Self', 7)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (8, N'修改密码', 7, N'/Home/SelfChangePwd', 8)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (9, N'个人信息', 7, N'/Home/SelfInfo', 9)
INSERT [dbo].[Modules] ([Id], [ModulesName], [ParentId], [Path], [Weight]) VALUES (11, N'管理权限', 5, N'/Home/PowerManager', 10)
SET IDENTITY_INSERT [dbo].[Modules] OFF
/****** Object:  Table [dbo].[User]    Script Date: 03/27/2019 02:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[PassWord] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([Id], [Name], [PassWord]) VALUES (1, N'李金涛', N'123456')
INSERT [dbo].[User] ([Id], [Name], [PassWord]) VALUES (2, N'安坤', N'123456')
INSERT [dbo].[User] ([Id], [Name], [PassWord]) VALUES (3, N'李梦佳', N'123456')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[RoleModules]    Script Date: 03/27/2019 02:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleModules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[ModuleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RoleModules] ON
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (1, 1, 1)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (2, 1, 2)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (3, 1, 3)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (4, 1, 4)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (5, 1, 5)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (6, 1, 6)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (7, 1, 7)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (8, 1, 8)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (9, 1, 9)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (10, 2, 1)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (11, 2, 2)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (12, 2, 3)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (13, 2, 4)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (14, 2, 6)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (15, 2, 7)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (16, 2, 8)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (17, 2, 9)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (18, 3, 1)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (19, 3, 6)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (20, 3, 7)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (21, 3, 8)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (22, 3, 9)
INSERT [dbo].[RoleModules] ([Id], [RoleId], [ModuleId]) VALUES (23, 1, 11)
SET IDENTITY_INSERT [dbo].[RoleModules] OFF
/****** Object:  Table [dbo].[UserRole]    Script Date: 03/27/2019 02:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId]) VALUES (1, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId]) VALUES (2, 2, 2)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
/****** Object:  View [dbo].[View_UserRole]    Script Date: 03/27/2019 02:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_UserRole]
AS
SELECT     dbo.UserRole.Id, dbo.[User].Name, dbo.[User].PassWord, dbo.UserRole.UserId, dbo.UserRole.RoleId, dbo.Role.RoleName
FROM         dbo.[User] INNER JOIN
                      dbo.UserRole ON dbo.[User].Id = dbo.UserRole.UserId INNER JOIN
                      dbo.Role ON dbo.UserRole.RoleId = dbo.Role.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 111
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserRole"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 111
               Right = 360
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 398
               Bottom = 96
               Right = 540
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_UserRole'
GO
/****** Object:  View [dbo].[View_RoleModules]    Script Date: 03/27/2019 02:08:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_RoleModules]
AS
SELECT     dbo.RoleModules.Id, dbo.Modules.ModulesName, dbo.Modules.ParentId, dbo.Modules.Path, dbo.RoleModules.RoleId, dbo.RoleModules.ModuleId, dbo.Role.RoleName, dbo.Modules.Weight
FROM         dbo.Modules INNER JOIN
                      dbo.RoleModules ON dbo.Modules.Id = dbo.RoleModules.ModuleId INNER JOIN
                      dbo.Role ON dbo.RoleModules.RoleId = dbo.Role.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Modules"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RoleModules"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 111
               Right = 373
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 411
               Bottom = 96
               Right = 553
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RoleModules'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_RoleModules'
GO
/****** Object:  ForeignKey [FK__RoleModul__Modul__20C1E124]    Script Date: 03/27/2019 02:08:30 ******/
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Modules] ([Id])
GO
/****** Object:  ForeignKey [FK__RoleModul__RoleI__1FCDBCEB]    Script Date: 03/27/2019 02:08:30 ******/
ALTER TABLE [dbo].[RoleModules]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
/****** Object:  ForeignKey [FK__UserRole__RoleId__1B0907CE]    Script Date: 03/27/2019 02:08:30 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
/****** Object:  ForeignKey [FK__UserRole__UserId__1A14E395]    Script Date: 03/27/2019 02:08:30 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
