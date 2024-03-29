USE [master]
GO
/****** Object:  Database [CultuurHuis]    Script Date: 10/12/2012 13:04:31 ******/
CREATE DATABASE [CultuurHuis]

GO
ALTER DATABASE [CultuurHuis] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CultuurHuis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CultuurHuis] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CultuurHuis] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CultuurHuis] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CultuurHuis] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CultuurHuis] SET ARITHABORT OFF
GO
ALTER DATABASE [CultuurHuis] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CultuurHuis] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CultuurHuis] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CultuurHuis] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CultuurHuis] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CultuurHuis] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CultuurHuis] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CultuurHuis] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CultuurHuis] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CultuurHuis] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CultuurHuis] SET  DISABLE_BROKER
GO
ALTER DATABASE [CultuurHuis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CultuurHuis] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CultuurHuis] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CultuurHuis] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CultuurHuis] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CultuurHuis] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CultuurHuis] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CultuurHuis] SET  READ_WRITE
GO
ALTER DATABASE [CultuurHuis] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CultuurHuis] SET  MULTI_USER
GO
ALTER DATABASE [CultuurHuis] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CultuurHuis] SET DB_CHAINING OFF
GO
USE [CultuurHuis]
GO
/****** Object:  Table [dbo].[Klanten]    Script Date: 10/12/2012 13:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klanten](
	[KlantNr] [int] IDENTITY(1,1) NOT NULL,
	[Voornaam] [nvarchar](50) NOT NULL,
	[Familienaam] [nvarchar](50) NOT NULL,
	[Straat] [nvarchar](50) NOT NULL,
	[HuisNr] [nvarchar](50) NOT NULL,
	[Postcode] [nvarchar](50) NOT NULL,
	[Gemeente] [nvarchar](50) NOT NULL,
	[GebruikersNaam] [nvarchar](50) NOT NULL,
	[Paswoord] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Klanten] PRIMARY KEY CLUSTERED 
(
	[KlantNr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Klanten] ON
INSERT [dbo].[Klanten] ([KlantNr], [Voornaam], [Familienaam], [Straat], [HuisNr], [Postcode], [Gemeente], [GebruikersNaam], [Paswoord]) VALUES (1, N'Hans', N'Desmet', N'Keizerslaan', N'7', N'1000', N'Brussel', N'hans', N'bolle')
INSERT [dbo].[Klanten] ([KlantNr], [Voornaam], [Familienaam], [Straat], [HuisNr], [Postcode], [Gemeente], [GebruikersNaam], [Paswoord]) VALUES (2, N'Alexandra', N'Blondeel', N'Anspachlaan', N'65', N'1000', N'Brussel', N'alexandra', N'belle')
SET IDENTITY_INSERT [dbo].[Klanten] OFF
/****** Object:  Table [dbo].[Genres]    Script Date: 10/12/2012 13:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreNr] [int] NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreNr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (1, N'Humor')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (2, N'Theater')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (3, N'Muziek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (4, N'Wereldmuziek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (5, N'Familievoorstelling')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (6, N'Dans')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (7, N'Multimedia')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (8, N'Modern klassiek')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (9, N'Muziektheater')
INSERT [dbo].[Genres] ([GenreNr], [Genre]) VALUES (10, N'Circustheater')
/****** Object:  Table [dbo].[Voorstellingen]    Script Date: 10/12/2012 13:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voorstellingen](
	[VoorstellingsNr] [int] NOT NULL,
	[Titel] [nvarchar](50) NOT NULL,
	[Uitvoerders] [nvarchar](50) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[GenreNr] [int] NOT NULL,
	[Prijs] [money] NOT NULL,
	[VrijePlaatsen] [smallint] NOT NULL,
 CONSTRAINT [PK_Voorstellingen] PRIMARY KEY CLUSTERED 
(
	[VoorstellingsNr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (1, N'Rechtstreeks & integraal/Ka-Boom!', N'Neveneffecten / Alex Agnew', CAST(0x0000A0E201499700 AS DateTime), 1, 5.0000, 0)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (2, N'De leeuw van Vlaanderen', N'Union Suspecte / Publiekstheater', CAST(0x0000A0E301499700 AS DateTime), 2, 7.0000, 141)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (3, N'Ano Neko', N'Dobet Gnahoré', CAST(0x0000A0E401499700 AS DateTime), 4, 6.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (4, N'Professor Bernhardi', N'de Roovers', CAST(0x0000A0E501499700 AS DateTime), 2, 7.5000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (5, N'Ich bin wie du', N'het Toneelhuis', CAST(0x0000A0E601499700 AS DateTime), 2, 7.0000, 150)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (6, N'Randschade', N'fABULEUS', CAST(0x0000A0E701499700 AS DateTime), 5, 6.0000, 199)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (7, N'Koning Lear', N'Tonic', CAST(0x0000A0E801499700 AS DateTime), 2, 7.0000, 170)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (8, N'Van alle landen thuis', N'Els Helewaut,D.Van Esbroeck & co', CAST(0x0000A0E901499700 AS DateTime), 3, 5.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (9, N'Ma - Earth', N'Akram Khan', CAST(0x0000A0EA01499700 AS DateTime), 6, 8.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (10, N'Jerusalem', N'Berlin', CAST(0x0000A0EB01499700 AS DateTime), 7, 7.5000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (11, N'De fijnste dagen van het jaar', N'Het Paleis/Jenny', CAST(0x0000A0EC01499700 AS DateTime), 5, 4.0000, 168)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (12, N'Cancion de un amorio', N'Bodicxhel', CAST(0x0000A0ED01499700 AS DateTime), 4, 6.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (13, N'Moest ik van u zijn', N'Wouter Deprez  ', CAST(0x0000A0EE01499700 AS DateTime), 1, 6.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (14, N'Poézique cabaret', N'La compagnie du chien qui tousse', CAST(0x0000A0EF01499700 AS DateTime), 1, 6.5000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (15, N'Eekhoornbrood', N'Lampe', CAST(0x0000A0F001499700 AS DateTime), 2, 5.5000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (16, N'Liederen v. Baert, Debussy, Chausson, Weill', N'Bernard Baert & Anna Pardon', CAST(0x0000A0F101499700 AS DateTime), 8, 8.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (17, N'L"Hafa', N'Union Suspecte', CAST(0x0000A0F201499700 AS DateTime), 2, 7.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (18, N'Achter ''t eten', N'Ceremonia/Het muziek Lod/Theater Zuidpool', CAST(0x0000A0F301499700 AS DateTime), 3, 6.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (19, N'Poulenc / Stravinsky', N'Prometheus Ensemble', CAST(0x0000A0F401499700 AS DateTime), 8, 8.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (20, N'Lied der rusteloosheid', N'Eva De Roovere, Pedro Moutinho & G. de Mol', CAST(0x0000A0F501499700 AS DateTime), 4, 7.0000, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (21, N'Wilde dingen', N'Kopergietery    ', CAST(0x0000A0F601499700 AS DateTime), 5, 5.0000, 196)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (22, N'Licht', N'Bos', CAST(0x0000A0F701499700 AS DateTime), 7, 6.0000, 94)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (23, N'Een hond in de nacht', N'Speeltheater Holland', CAST(0x0000A0F801499700 AS DateTime), 5, 6.0000, 0)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (24, N'Gloed', N'theater Malpertuis', CAST(0x0000A0F901499700 AS DateTime), 2, 7.0000, 196)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (25, N'To speak or not to speak', N'Spectra Ensemble', CAST(0x0000A0FA01499700 AS DateTime), 8, 8.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (26, N'Tres cultures por la paz', N'Rosa Zaragoza', CAST(0x0000A0FB01499700 AS DateTime), 4, 7.2500, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (27, N'Zouff!', N'Les Argonautes', CAST(0x0000A0FC01499700 AS DateTime), 10, 5.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (28, N'La cucina dell"arte ', N'David & Danny Ronaldo', CAST(0x0000A0FD01499700 AS DateTime), 10, 6.0000, 190)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (29, N'Speelt Rzewski', N'Frederic Rzewski', CAST(0x0000A0FE01499700 AS DateTime), 8, 8.0000, 160)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (30, N'Tv-tunes K.N.T.', N'Wim Opbrouck & Maandacht', CAST(0x0000A0FF01499700 AS DateTime), 3, 7.0000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (31, N'Schone woorden klinken zo...', N'Warre Borgmans & Jokke Schreurs', CAST(0x0000A10001499700 AS DateTime), 3, 6.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (32, N'White Light White Heat - The Velvet Undergr.', N'Bea Van der Maat & Dr Kloot Per W', CAST(0x0000A10101499700 AS DateTime), 3, 5.5000, 200)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (33, N'Het gaat toch rap', N'Raf Coppens', CAST(0x0000A10201499700 AS DateTime), 1, 6.0000, 170)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (34, N'Emilia Galotti', N'Tijd', CAST(0x0000A10301499700 AS DateTime), 2, 7.0000, 198)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (35, N'Iets over de liefde', N'theater Malpertuis', CAST(0x0000A10401499700 AS DateTime), 2, 6.0000, 160)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (36, N'Hendrickx, Xenakis & Tan Dun', N'Spiegel Strijkkwartet', CAST(0x0000A10501499700 AS DateTime), 8, 7.0000, 180)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (37, N'Cry like a man, part 2', N'J. Blaute, Paul Michiels & Roland', CAST(0x0000A10601499700 AS DateTime), 3, 6.0000, 8)
INSERT [dbo].[Voorstellingen] ([VoorstellingsNr], [Titel], [Uitvoerders], [Datum], [GenreNr], [Prijs], [VrijePlaatsen]) VALUES (38, N'De Kreutzersonates', N'Het Net', CAST(0x0000A10701499700 AS DateTime), 2, 7.0000, 100)
/****** Object:  Table [dbo].[Reservaties]    Script Date: 10/12/2012 13:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservaties](
	[ReservatieNr] [int] IDENTITY(1,1) NOT NULL,
	[KlantNr] [int] NOT NULL,
	[VoorstellingsNr] [int] NOT NULL,
	[Plaatsen] [smallint] NOT NULL,
 CONSTRAINT [PK_Reservaties] PRIMARY KEY CLUSTERED 
(
	[ReservatieNr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  ForeignKey [FK_Voorstellingen_Genres]    Script Date: 10/12/2012 13:04:32 ******/
ALTER TABLE [dbo].[Voorstellingen]  WITH CHECK ADD  CONSTRAINT [FK_Voorstellingen_Genres] FOREIGN KEY([GenreNr])
REFERENCES [dbo].[Genres] ([GenreNr])
GO
ALTER TABLE [dbo].[Voorstellingen] CHECK CONSTRAINT [FK_Voorstellingen_Genres]
GO
/****** Object:  ForeignKey [FK_Reservaties_Klanten]    Script Date: 10/12/2012 13:04:32 ******/
ALTER TABLE [dbo].[Reservaties]  WITH CHECK ADD  CONSTRAINT [FK_Reservaties_Klanten] FOREIGN KEY([KlantNr])
REFERENCES [dbo].[Klanten] ([KlantNr])
GO
ALTER TABLE [dbo].[Reservaties] CHECK CONSTRAINT [FK_Reservaties_Klanten]
GO
/****** Object:  ForeignKey [FK_Reservaties_Voorstellingen]    Script Date: 10/12/2012 13:04:32 ******/
ALTER TABLE [dbo].[Reservaties]  WITH CHECK ADD  CONSTRAINT [FK_Reservaties_Voorstellingen] FOREIGN KEY([VoorstellingsNr])
REFERENCES [dbo].[Voorstellingen] ([VoorstellingsNr])
GO
ALTER TABLE [dbo].[Reservaties] CHECK CONSTRAINT [FK_Reservaties_Voorstellingen]
GO
