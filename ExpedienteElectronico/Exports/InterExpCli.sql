USE [InterExpCli]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 03/10/2017 11:30:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IDTipoUsuario] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL CONSTRAINT [DF_TipoUsuario_Descripcion]  DEFAULT (''),
	[EsSistemas] [bit] NULL CONSTRAINT [DF_TipoUsuario_EsSistemas]  DEFAULT ((0)),
	[EsSupervisor] [bit] NULL CONSTRAINT [DF_TipoUsuario_EsSupervisor]  DEFAULT ((0)),
	[EsOperador] [bit] NULL CONSTRAINT [DF_TipoUsuario_EsOperador]  DEFAULT ((0)),
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IDTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 03/10/2017 11:30:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [smallint] IDENTITY(1,1) NOT NULL,
	[IDTipoUsuario] [smallint] NOT NULL,
	[ClaveUsuario] [nchar](25) NOT NULL CONSTRAINT [DF_Usuario_ClaveUsuario]  DEFAULT (''),
	[Contrasena] [nchar](20) NOT NULL CONSTRAINT [DF_Usuario_Contrasena]  DEFAULT (''),
	[Correo] [nvarchar](120) NOT NULL CONSTRAINT [DF_Usuario_Correo]  DEFAULT (''),
	[NomUsuario] [nvarchar](120) NOT NULL CONSTRAINT [DF_Usuario_NomUsuario]  DEFAULT (''),
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([IDTipoUsuario], [Descripcion], [EsSistemas], [EsSupervisor], [EsOperador]) VALUES (1, N'Sistemas', 1, 0, 0)
INSERT [dbo].[TipoUsuario] ([IDTipoUsuario], [Descripcion], [EsSistemas], [EsSupervisor], [EsOperador]) VALUES (2, N'Operador', 0, 0, 1)
INSERT [dbo].[TipoUsuario] ([IDTipoUsuario], [Descripcion], [EsSistemas], [EsSupervisor], [EsOperador]) VALUES (4, N'Supervisor', 0, 1, 0)
INSERT [dbo].[TipoUsuario] ([IDTipoUsuario], [Descripcion], [EsSistemas], [EsSupervisor], [EsOperador]) VALUES (16, N'ROCA', 1, 1, 1)
INSERT [dbo].[TipoUsuario] ([IDTipoUsuario], [Descripcion], [EsSistemas], [EsSupervisor], [EsOperador]) VALUES (17, N'TEST0001', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IDUsuario], [IDTipoUsuario], [ClaveUsuario], [Contrasena], [Correo], [NomUsuario]) VALUES (15, 16, N'ERICK                    ', N'erick               ', N'', N'Erick Suarez Buendia')
INSERT [dbo].[Usuario] ([IDUsuario], [IDTipoUsuario], [ClaveUsuario], [Contrasena], [Correo], [NomUsuario]) VALUES (20, 16, N'CSIERRA                  ', N'casv1974            ', N'', N'Carlos Sierra')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IDTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([IDTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
