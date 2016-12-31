USE [master]
GO
/****** Object:  Database [ClinicManagement]    Script Date: 31/12/2016 8:30:28 AM ******/
CREATE DATABASE [ClinicManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ClinicManagement.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClinicManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ClinicManagement_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClinicManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ClinicManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ClinicManagement]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalRecordID] [int] NOT NULL,
	[ServiceFee] [money] NOT NULL,
	[MedicineFee] [money] NOT NULL,
	[DateOfBill] [smalldatetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ServiceFee] [money] NOT NULL,
	[Note] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[MedicalRecordID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[ExamineReason] [nvarchar](200) NOT NULL,
	[Diagnostic] [nvarchar](200) NOT NULL,
	[ExamineDate] [smalldatetime] NOT NULL,
	[ReExamineDate] [smalldatetime] NULL,
	[Note] [nvarchar](200) NULL,
	[PrescriptionsID] [int] NOT NULL,
 CONSTRAINT [PK_MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[MedicalRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](50) NOT NULL,
	[MedicineTypeID] [int] NOT NULL,
	[WayToUseID] [int] NOT NULL,
	[PharmacyTypeID] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineType]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineType](
	[MedicineTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MedicineType] PRIMARY KEY CLUSTERED 
(
	[MedicineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[DateOfBirth] [smalldatetime] NOT NULL,
	[Job] [nvarchar](200) NULL,
	[Phone] [varchar](200) NULL,
	[Note] [nvarchar](200) NULL,
	[CreateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionsName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PermissionDetail]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionDetail](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupID] [int] NOT NULL,
 CONSTRAINT [PK_PermissionDetail] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC,
	[UserGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalRecordID] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Note] [nvarchar](200) NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrescriptionDetail]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionDetail](
	[PrescriptionID] [int] NOT NULL,
	[MedicineID] [int] NOT NULL,
	[MedicineFee] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[HowToUse] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC,
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PharmacyType]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyType](
	[PharmacyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PharmacyTypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PharmacyType] PRIMARY KEY CLUSTERED 
(
	[PharmacyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Queue]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Queue](
	[QueueID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ExamineReason] [nvarchar](200) NOT NULL,
	[ExamineDate] [smalldatetime] NOT NULL,
	[DoctorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[PatientScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[DoctorID] [int] NOT NULL,
	[Note] [nvarchar](200) NULL,
	[ScheduleDate] [smalldatetime] NOT NULL,
	[ScheduleType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[PatientScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Service]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](200) NOT NULL,
	[ServiceFee] [money] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceDetail]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetail](
	[MedicalRecordID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ServiceFee] [money] NOT NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[MedicalRecordID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [varchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[DateOfBirth] [smalldatetime] NULL,
	[UserGroupID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WayToUse]    Script Date: 31/12/2016 8:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WayToUse](
	[WayToUseID] [int] IDENTITY(1,1) NOT NULL,
	[WayToUseName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WayToUse] PRIMARY KEY CLUSTERED 
(
	[WayToUseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (1, N'sjdfhskjd', 2, 1, 2, 2, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (2, N'asd', 4, 1, 1, 3, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (3, N'ád', 4, 2, 1, 1, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (4, N'as', 5, 5, 1, 2, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (5, N'asd', 1, 1, 2, 1, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (6, N'as', 3, 2, 2, 2, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (7, N'as', 2, 2, 2, 1, 0.0000)
INSERT [dbo].[Medicine] ([MedicineID], [MedicineName], [MedicineTypeID], [WayToUseID], [PharmacyTypeID], [UnitID], [Price]) VALUES (8, N'as', 2, 1, 2, 2, 0.0000)
SET IDENTITY_INSERT [dbo].[Medicine] OFF
SET IDENTITY_INSERT [dbo].[MedicineType] ON 

INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (1, N'abc')
INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (2, N'ấd')
INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (3, N'ádà')
INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (4, N'ádá')
INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (5, N'ádab')
INSERT [dbo].[MedicineType] ([MedicineTypeID], [MedicineTypeName]) VALUES (6, N'áđá')
SET IDENTITY_INSERT [dbo].[MedicineType] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientID], [FullName], [Gender], [Address], [DateOfBirth], [Job], [Phone], [Note], [CreateDate]) VALUES (1, N'  asad', N'Nữ', N'áđấ', CAST(N'2016-12-22 00:00:00' AS SmallDateTime), N'', N'', N'', CAST(N'2016-12-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Patient] ([PatientID], [FullName], [Gender], [Address], [DateOfBirth], [Job], [Phone], [Note], [CreateDate]) VALUES (2, N'ádfs', N'Nam', N'áđấ', CAST(N'2016-12-06 00:00:00' AS SmallDateTime), N'', N'', N'', CAST(N'2016-12-28 00:00:00' AS SmallDateTime))
INSERT [dbo].[Patient] ([PatientID], [FullName], [Gender], [Address], [DateOfBirth], [Job], [Phone], [Note], [CreateDate]) VALUES (3, N'Huỳnh Minh Trí', N'Nam', N'Quảng Nam', CAST(N'1995-12-24 00:00:00' AS SmallDateTime), N'', N'', N'', CAST(N'2016-12-31 00:00:00' AS SmallDateTime))
INSERT [dbo].[Patient] ([PatientID], [FullName], [Gender], [Address], [DateOfBirth], [Job], [Phone], [Note], [CreateDate]) VALUES (4, N'Nguyễn Văn A', N'Nam', N'akhsdjk', CAST(N'1995-01-01 00:00:00' AS SmallDateTime), N'', N'', N'', CAST(N'2016-12-31 00:00:00' AS SmallDateTime))
INSERT [dbo].[Patient] ([PatientID], [FullName], [Gender], [Address], [DateOfBirth], [Job], [Phone], [Note], [CreateDate]) VALUES (5, N'ajksh', N'Nam', N'kahsjdhk', CAST(N'2000-01-01 00:00:00' AS SmallDateTime), N'akshdjkh', N'168752722', N'hkhjkas', CAST(N'2016-12-31 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[PharmacyType] ON 

INSERT [dbo].[PharmacyType] ([PharmacyTypeID], [PharmacyTypeName]) VALUES (1, N'hdjfkshjd')
INSERT [dbo].[PharmacyType] ([PharmacyTypeID], [PharmacyTypeName]) VALUES (2, N'sdjkfhsk')
SET IDENTITY_INSERT [dbo].[PharmacyType] OFF
SET IDENTITY_INSERT [dbo].[Queue] ON 

INSERT [dbo].[Queue] ([QueueID], [PatientID], [ExamineReason], [ExamineDate], [DoctorID]) VALUES (1, 1, N'asjhdb', CAST(N'2016-12-31 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Queue] ([QueueID], [PatientID], [ExamineReason], [ExamineDate], [DoctorID]) VALUES (2, 2, N'sdfsd', CAST(N'2016-12-31 00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[Queue] ([QueueID], [PatientID], [ExamineReason], [ExamineDate], [DoctorID]) VALUES (3, 2, N'sdjkf', CAST(N'2016-12-31 00:00:00' AS SmallDateTime), 2)
SET IDENTITY_INSERT [dbo].[Queue] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (1, N'vien')
INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (2, N'chai')
INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (3, N'asdf')
INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (4, N'aas')
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [Address], [DateOfBirth], [UserGroupID], [Username], [Password]) VALUES (1, N'Huỳnh Minh Trí', NULL, NULL, NULL, 1, N'hmtvltk2', N'216597')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Address], [DateOfBirth], [UserGroupID], [Username], [Password]) VALUES (2, N'A', NULL, NULL, NULL, 1, N'hmt', N'asda')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([UserGroupID], [UserGroupName]) VALUES (1, N'Doctor')
INSERT [dbo].[UserGroup] ([UserGroupID], [UserGroupName]) VALUES (2, N'Nurse')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
SET IDENTITY_INSERT [dbo].[WayToUse] ON 

INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (1, N'ahskjdhjk')
INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (2, N'hsjkhdf')
INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (3, N'jdkjs')
INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (4, N'jskhjfh')
INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (5, N'kshdjfk')
INSERT [dbo].[WayToUse] ([WayToUseID], [WayToUseName]) VALUES (8, N'á')
SET IDENTITY_INSERT [dbo].[WayToUse] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_MedicalRecord] FOREIGN KEY([MedicalRecordID])
REFERENCES [dbo].[MedicalRecord] ([MedicalRecordID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_MedicalRecord]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Patient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Patient]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_Prescription] FOREIGN KEY([PrescriptionsID])
REFERENCES [dbo].[Prescription] ([PrescriptionID])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_Prescription]
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicalRecord_User] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK_MedicalRecord_User]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_MedicineType] FOREIGN KEY([MedicineTypeID])
REFERENCES [dbo].[MedicineType] ([MedicineTypeID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_MedicineType]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_PharmacyType] FOREIGN KEY([PharmacyTypeID])
REFERENCES [dbo].[PharmacyType] ([PharmacyTypeID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_PharmacyType]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([UnitID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Unit]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_WayToUse] FOREIGN KEY([WayToUseID])
REFERENCES [dbo].[WayToUse] ([WayToUseID])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_WayToUse]
GO
ALTER TABLE [dbo].[PermissionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetail_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[PermissionDetail] CHECK CONSTRAINT [FK_PermissionDetail_Permission]
GO
ALTER TABLE [dbo].[PermissionDetail]  WITH CHECK ADD  CONSTRAINT [FK_PermissionDetail_UserGroup] FOREIGN KEY([UserGroupID])
REFERENCES [dbo].[UserGroup] ([UserGroupID])
GO
ALTER TABLE [dbo].[PermissionDetail] CHECK CONSTRAINT [FK_PermissionDetail_UserGroup]
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([MedicineID])
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescription] ([PrescriptionID])
GO
ALTER TABLE [dbo].[PrescriptionDetail]  WITH CHECK ADD FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescription] ([PrescriptionID])
GO
ALTER TABLE [dbo].[Queue]  WITH CHECK ADD FOREIGN KEY([DoctorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Queue]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Queue]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_MedicalRecord] FOREIGN KEY([MedicalRecordID])
REFERENCES [dbo].[MedicalRecord] ([MedicalRecordID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_Detail_MedicalRecord]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_Detail_Service]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([UserGroupID])
REFERENCES [dbo].[UserGroup] ([UserGroupID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
USE [master]
GO
ALTER DATABASE [ClinicManagement] SET  READ_WRITE 
GO
