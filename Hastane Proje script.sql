USE [master]
GO
/****** Object:  Database [HastaneProje]    Script Date: 7.7.2022 15:00:46 ******/
CREATE DATABASE [HastaneProje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneProje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HastaneProje.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HastaneProje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HastaneProje_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HastaneProje] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneProje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneProje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneProje] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneProje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneProje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneProje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneProje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneProje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneProje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneProje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneProje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneProje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneProje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneProje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneProje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneProje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneProje] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HastaneProje] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneProje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneProje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneProje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneProje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HastaneProje]
GO
/****** Object:  Table [dbo].[Tbl_Branslar]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Branslar](
	[Partid] [tinyint] IDENTITY(1,1) NOT NULL,
	[PartName] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Doktorlar]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Doktorlar](
	[Doctorid] [tinyint] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](10) NULL,
	[DoctorSurname] [varchar](10) NULL,
	[DoctorPart] [varchar](30) NULL,
	[DoctorCN] [char](11) NULL,
	[DoctorPassword] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Duyurular]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Duyurular](
	[Duyuruid] [smallint] IDENTITY(1,1) NOT NULL,
	[Duyuru] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Hastalar]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Hastalar](
	[Patientid] [smallint] IDENTITY(1,1) NOT NULL,
	[PatientName] [varchar](10) NULL,
	[PatientSurname] [varchar](10) NULL,
	[PatientCN] [char](11) NULL,
	[PatientNumber] [varchar](15) NULL,
	[PatientPassword] [varchar](10) NULL,
	[PatientGender] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Randevular]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Randevular](
	[Meetingid] [int] IDENTITY(1,1) NOT NULL,
	[MeetingTarih] [varchar](10) NULL,
	[MeetingClock] [varchar](5) NULL,
	[MeetingPart] [varchar](20) NULL,
	[MeetingDocktor] [varchar](20) NULL,
	[MeetingStatus] [bit] NULL CONSTRAINT [DF_Tbl_Randevular_MeetingStatus]  DEFAULT ((0)),
	[PatientCN] [char](11) NULL,
	[PatientComplaint] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Sekreter]    Script Date: 7.7.2022 15:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Sekreter](
	[Secreteryid] [tinyint] IDENTITY(1,1) NOT NULL,
	[SecreteryNameSurnamae] [varchar](20) NULL,
	[SecreteryCN] [char](11) NULL,
	[SecreteryPassword] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] ON 

INSERT [dbo].[Tbl_Branslar] ([Partid], [PartName]) VALUES (1, N'Dahiliye')
INSERT [dbo].[Tbl_Branslar] ([Partid], [PartName]) VALUES (2, N'Göz')
INSERT [dbo].[Tbl_Branslar] ([Partid], [PartName]) VALUES (3, N'Kulak Burun Boğaz')
INSERT [dbo].[Tbl_Branslar] ([Partid], [PartName]) VALUES (5, N'Cilt Hastalıkları')
SET IDENTITY_INSERT [dbo].[Tbl_Branslar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] ON 

INSERT [dbo].[Tbl_Doktorlar] ([Doctorid], [DoctorName], [DoctorSurname], [DoctorPart], [DoctorCN], [DoctorPassword]) VALUES (1, N'Mehmet', N'Yücedağ', N'Dahiliye', N'33333333333', N'33333')
INSERT [dbo].[Tbl_Doktorlar] ([Doctorid], [DoctorName], [DoctorSurname], [DoctorPart], [DoctorCN], [DoctorPassword]) VALUES (2, N'Akın', N'Yıldız', N'Göz', N'11111111112', N'0011')
INSERT [dbo].[Tbl_Doktorlar] ([Doctorid], [DoctorName], [DoctorSurname], [DoctorPart], [DoctorCN], [DoctorPassword]) VALUES (3, N'Tuna', N'Çınar', N'Göz', N'77777777777', N'6677')
SET IDENTITY_INSERT [dbo].[Tbl_Doktorlar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] ON 

INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (1, N'Saat 21:00 de acil karşısında toplantı olacak.')
INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (2, N'Tüm hemşireler yeni giriş kartları için gişeye ugrayıp imzalarını atarak kartlarını alsınlar')
INSERT [dbo].[Tbl_Duyurular] ([Duyuruid], [Duyuru]) VALUES (102, N'')
SET IDENTITY_INSERT [dbo].[Tbl_Duyurular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] ON 

INSERT [dbo].[Tbl_Hastalar] ([Patientid], [PatientName], [PatientSurname], [PatientCN], [PatientNumber], [PatientPassword], [PatientGender]) VALUES (1, N'Baran', N'Yücedağ', N'11111111111', N'543-2266', N'1111', N'Erkek')
INSERT [dbo].[Tbl_Hastalar] ([Patientid], [PatientName], [PatientSurname], [PatientCN], [PatientNumber], [PatientPassword], [PatientGender]) VALUES (2, N'Ayşse', N'Öztürk', N'22222222222', N'213-4124', N'001144', N'Kadın')
SET IDENTITY_INSERT [dbo].[Tbl_Hastalar] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] ON 

INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (1, N'28.10.2022', N'14:00', N'Dahiliye', N'Mehmet Yücedağ', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (2, N'29.10.2022', N'12:00', N'Göz', N'TunaÇınar', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (3, N'04.03.2022', N'13:00', N'Dahiliye', N'MehmetYücedağ', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (4, N'04.03.2022', N'14:00', N'Dahiliye', N'MehmetYücedağ', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (5, N'04.03.2022', N'15:00', N'Dahiliye', N'MehmetYücedağ', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (6, N'04.03.2022', N'12:00', N'Göz', N'AkınYıldız', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (8, N'04.03.2022', N'14:00', N'Göz', N'TunaÇınar', 0, NULL, NULL)
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (7, N'04.03.2022', N'13:00', N'Göz', N'AkınYıldız', 1, N'11111111111', N'Gözüm Agrıyor')
INSERT [dbo].[Tbl_Randevular] ([Meetingid], [MeetingTarih], [MeetingClock], [MeetingPart], [MeetingDocktor], [MeetingStatus], [PatientCN], [PatientComplaint]) VALUES (9, N'04.03.2022', N'13:00', N'Göz', N'TunaÇınar', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Randevular] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] ON 

INSERT [dbo].[Tbl_Sekreter] ([Secreteryid], [SecreteryNameSurnamae], [SecreteryCN], [SecreteryPassword]) VALUES (1, N'Emel Öztürk', N'55555555555', N'5555')
INSERT [dbo].[Tbl_Sekreter] ([Secreteryid], [SecreteryNameSurnamae], [SecreteryCN], [SecreteryPassword]) VALUES (2, N'Ali Güneş', N'66666666666', N'6666')
INSERT [dbo].[Tbl_Sekreter] ([Secreteryid], [SecreteryNameSurnamae], [SecreteryCN], [SecreteryPassword]) VALUES (3, N'', N'           ', N'')
INSERT [dbo].[Tbl_Sekreter] ([Secreteryid], [SecreteryNameSurnamae], [SecreteryCN], [SecreteryPassword]) VALUES (4, NULL, NULL, N'')
INSERT [dbo].[Tbl_Sekreter] ([Secreteryid], [SecreteryNameSurnamae], [SecreteryCN], [SecreteryPassword]) VALUES (5, NULL, N'           ', NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Sekreter] OFF
USE [master]
GO
ALTER DATABASE [HastaneProje] SET  READ_WRITE 
GO
