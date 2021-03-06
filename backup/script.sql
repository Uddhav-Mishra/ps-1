USE [Revide]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Videos](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[FullTitle] [varchar](50) NOT NULL,
	[PosterSrc] [varchar](200) NOT NULL,
	[Language] [varchar](50) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Genre] [varchar](50) NOT NULL,
	[AdultRating] [varchar](5) NOT NULL,
	[Overall_rating] [float] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[LoginID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[PosterSrc] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chats](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SentID] [int] NOT NULL,
	[Chat] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[MessageBody] [varchar](250) NOT NULL,
	[MessageDate] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsSystem] [bit] NOT NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cast]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cast](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[videoID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Occupation] [varchar](50) NOT NULL,
	[PhotoLink] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cast] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BlockUser]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[BlockUser]
(
	@Username nvarchar(50)
)
as 
begin
    UPDATE [User]
    SET IsActive=0
    WHERE Username=@Username;
end
GO
/****** Object:  StoredProcedure [dbo].[badge_values]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery5.sql|0|0|C:\Users\yash.bansal\AppData\Local\Temp\~vs29C8.sql
CREATE procedure [dbo].[badge_values]
as
begin
select COUNT(*) aa from [User]  union all select COUNT(*) aa from [User] as aa where isactive = 1 union all select COUNT(*) aa from [User] as aa where isactive = 0 union all select COUNT(*) aa from [Videos] as aa; 
end
GO
/****** Object:  StoredProcedure [dbo].[badge_value]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[badge_value]
as
begin
select COUNT(*) aa from [User]  union select COUNT(*) aa from [User] as aa where isactive = 1 union select COUNT(*) aa from [Videos] as aa; 
end
GO
/****** Object:  StoredProcedure [dbo].[AddMovies]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AddMovies]
( @Title varchar(50),
	@FullTitle varchar(50),
	@Language varchar(50),
	@ReleaseDate datetime,
	@Genre varchar(50),
	@AdultRating varchar(5),
	@description varchar(MAX),
	@type varchar(50),
	@imgdest varchar(100)
	)
as 
BEGIN
		INSERT INTO Videos(Title,FullTitle, Language,ReleaseDate,Genre,AdultRating,type,description,PosterSrc) 
		VALUES(@Title,@FullTitle,@Language,@ReleaseDate,@Genre,@AdultRating,@type,@description,@imgdest);
 END;
GO
/****** Object:  StoredProcedure [dbo].[AddAdmin]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AddAdmin]
(   @RoleID varchar(50),
	@Username varchar(50),
	@LoginID varchar(50),
	@Password varchar(50),
	@UpdatedOn datetime		
	)
as 
BEGIN
		INSERT INTO [User](RoleID,Username, LoginID,Password,UpdatedOn) 
		VALUES(@RoleID,@Username,@LoginID,@Password,@UpdatedOn);
 END;
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID1] [int] NOT NULL,
	[UserID2] [int] NOT NULL,
	[FriendsSince] [date] NOT NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CountUsers]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CountUsers]
as
begin
select COUNT(*) from [User];
end
GO
/****** Object:  StoredProcedure [dbo].[Count_users]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[Count_users]

as 
declare
@Num_of_user int 
begin
SELECt @Num_of_user =COUNT(*) 
from [User]
    return @Num_of_user
end
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Comment] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[getMovies]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getMovies]
as
begin
Select top 4 * from Videos b where Type='movie' 
end;
GO
/****** Object:  StoredProcedure [dbo].[getMovieReport]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure  [dbo].[getMovieReport] 
as
begin
select FullTitle,Language,PosterSrc,ReleaseDate,Genre,Overall_rating from Videos ;
end
GO
/****** Object:  StoredProcedure [dbo].[getBanner]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getBanner]
as
begin
select Title,PosterSrc from Banner;
end;
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [char](10) NOT NULL,
	[EmailID] [varchar](50) NOT NULL,
	[ProfilePhoto] [varchar](100) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Groups]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_User_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getWEB]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getWEB]
as
begin
Select top 4 * from Videos b where Type='web' 
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAdmin]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateAdmin](
@Password varchar(50),
@EmailID varchar(50),
@UpdatedOn DateTime
)
as
begin
 update [User] set Password=@Password,LoginID=@EmailID,UpdatedOn=@UpdatedOn WHERE ID=1  ;
end
GO
/****** Object:  StoredProcedure [dbo].[UnBlockUser]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[UnBlockUser]
(
	@Username nvarchar(50)
)
as 
begin
    UPDATE [User]
    SET IsActive=1
    WHERE Username=@Username;
end
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdateDate] [date] NOT NULL,
	[UpdateBy] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[videoID] [int] NOT NULL,
	[comments] [varchar](max) NOT NULL,
	[review_by] [int] NOT NULL,
	[dated] [datetime] NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VideoID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[StarsGiven] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchedMovies]    Script Date: 07/14/2016 16:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchedMovies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[watchedDate] [date] NOT NULL,
 CONSTRAINT [PK_WatchedMovies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertChat]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertChat]
(	
	@SentID int,
	@Chat varchar(100)
)
AS
BEGIN
	INSERT INTO [Chats] ([Chat], [SentID]) 
		VALUES(@Chat, @SentID);		
END
GO
/****** Object:  StoredProcedure [dbo].[getTV]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getTV]
as
begin
Select top 4 * from Videos b where Type='tv' 
end;
GO
/****** Object:  StoredProcedure [dbo].[getRecommended]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRecommended]
as
begin
Select top 4 * from Videos order by Overall_rating desc; 
end;
GO
/****** Object:  StoredProcedure [dbo].[getProfilePhoto]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getProfilePhoto](
@id int
)
as
begin
select ProfilePhoto from [UserDetails] where UserID=@id ;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertSignUpDetails]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertSignUpDetails]
(	
	@RoleID int,
	@UserName nchar(50),
	@LoginID nchar(50),
	@Password nchar(50)
)
AS
BEGIN
	INSERT INTO [User] (RoleID, Username, LoginID, [Password]) 
		VALUES(@RoleID, @UserName, @LoginID, @Password);
insert into [UserDetails] (country,Age,Phone,EmailID,ProfilePhoto,UserID)
values('India','0','00000000',@LoginID,'images/Profile/default.png',(select ID from [User] where Username=@Username));
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRatings]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertRatings] 
(
@UserId int,
@VideoId int,
@comment varchar(MAX),
@stars int
)
as
begin
insert into Reviews(videoID,comments,review_by) values (@VideoId,@comment,@UserId);
insert into Rating(VideoID,UserID,StarsGiven) values (@VideoId,@UserId,@stars);
end;
GO
/****** Object:  StoredProcedure [dbo].[getUserDetails]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getUserDetails]
as
begin
select u1.Username,u1.LoginID,u2.Country,u2.Phone from [User] u1,[UserDetails] u2 where u2.UserID=u1.ID and RoleID='1' ; 
end;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProfile]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateProfile](
@id int,
@name varchar(50) ,
@email varchar(50),
@age varchar(50),
@phone varchar(50),
@country varchar(50),
@imgdest varchar(50)
)
as
begin
delete from UserDetails where UserID = @id;
insert into [UserDetails] (country,Age,Phone,EmailID,ProfilePhoto,UserID)
values(@country,@age,@phone,@email,@imgdest,@id);
end
GO
/****** Object:  StoredProcedure [dbo].[getAllUserDetails]    Script Date: 07/14/2016 16:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllUserDetails]
as
begin
select * from [User] u1 join [UserDetails] u2 on u2.UserID=u1.ID ; 
end;
GO
/****** Object:  Default [DF_Reviews_dated]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Reviews] ADD  CONSTRAINT [DF_Reviews_dated]  DEFAULT (getdate()) FOR [dated]
GO
/****** Object:  Default [DF_User_Password]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Password]  DEFAULT (getdate()) FOR [Password]
GO
/****** Object:  Default [DF_User_IsActive]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_User_UpdatedOn]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_UserDetails_ProfilePhoto]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[UserDetails] ADD  CONSTRAINT [DF_UserDetails_ProfilePhoto]  DEFAULT ('images/profile/default.png') FOR [ProfilePhoto]
GO
/****** Object:  Default [DF_Videos_PosterSrc]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF_Videos_PosterSrc]  DEFAULT ('(http://sd.keepcalm-o-matic.co.uk/i/keep-calm-poster-not-found.png)') FOR [PosterSrc]
GO
/****** Object:  Default [DF_Videos_ReleaseDate]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF_Videos_ReleaseDate]  DEFAULT (getdate()) FOR [ReleaseDate]
GO
/****** Object:  Default [DF_Videos_Overall_rating_1]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF_Videos_Overall_rating_1]  DEFAULT ((4.4)) FOR [Overall_rating]
GO
/****** Object:  Default [DF_Videos_Type]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF_Videos_Type]  DEFAULT ('movie') FOR [Type]
GO
/****** Object:  ForeignKey [FK_Cast_Videos]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Cast]  WITH CHECK ADD  CONSTRAINT [FK_Cast_Videos] FOREIGN KEY([videoID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[Cast] CHECK CONSTRAINT [FK_Cast_Videos]
GO
/****** Object:  ForeignKey [FK_Comments_Comments]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments]
GO
/****** Object:  ForeignKey [FK_Comments_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
/****** Object:  ForeignKey [FK_Friends_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_User] FOREIGN KEY([UserID1])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_User]
GO
/****** Object:  ForeignKey [FK_Friends_User1]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_User1] FOREIGN KEY([UserID2])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_User1]
GO
/****** Object:  ForeignKey [FK_Rating_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
/****** Object:  ForeignKey [FK_Rating_Videos]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Videos] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Videos]
GO
/****** Object:  ForeignKey [FK_Reviews_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_User] FOREIGN KEY([review_by])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_User]
GO
/****** Object:  ForeignKey [FK_Reviews_Videos]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Videos] FOREIGN KEY([videoID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Videos]
GO
/****** Object:  ForeignKey [FK_Role_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User]
GO
/****** Object:  ForeignKey [FK_Role_User1]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_User1] FOREIGN KEY([UpdateBy])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_User1]
GO
/****** Object:  ForeignKey [FK_User_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
/****** Object:  ForeignKey [FK_User_Groups_Group]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User_Groups]  WITH CHECK ADD  CONSTRAINT [FK_User_Groups_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[User_Groups] CHECK CONSTRAINT [FK_User_Groups_Group]
GO
/****** Object:  ForeignKey [FK_User_Groups_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[User_Groups]  WITH CHECK ADD  CONSTRAINT [FK_User_Groups_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User_Groups] CHECK CONSTRAINT [FK_User_Groups_User]
GO
/****** Object:  ForeignKey [FK_UserDetails_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_User]
GO
/****** Object:  ForeignKey [FK_UserDetails_UserDetails]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_UserDetails] FOREIGN KEY([ID])
REFERENCES [dbo].[UserDetails] ([ID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_UserDetails]
GO
/****** Object:  ForeignKey [FK_WatchedMovies_User]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[WatchedMovies]  WITH CHECK ADD  CONSTRAINT [FK_WatchedMovies_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[WatchedMovies] CHECK CONSTRAINT [FK_WatchedMovies_User]
GO
/****** Object:  ForeignKey [FK_WatchedMovies_Videos]    Script Date: 07/14/2016 16:45:26 ******/
ALTER TABLE [dbo].[WatchedMovies]  WITH CHECK ADD  CONSTRAINT [FK_WatchedMovies_Videos] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[WatchedMovies] CHECK CONSTRAINT [FK_WatchedMovies_Videos]
GO
