USE [master]
GO
/****** Object:  Database [Assignment1_ThanThanhDuy]    Script Date: 3/16/2022 1:22:03 AM ******/
CREATE DATABASE [Assignment1_ThanThanhDuy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_ThanThanhDuy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_ThanThanhDuy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_ThanThanhDuy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment1_ThanThanhDuy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_ThanThanhDuy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET QUERY_STORE = OFF
GO
USE [Assignment1_ThanThanhDuy]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryId] [varchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFood]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFood](
	[foodId] [varchar](15) NOT NULL,
	[foodName] [nvarchar](200) NOT NULL,
	[price] [float] NOT NULL,
	[desciption] [nvarchar](500) NOT NULL,
	[createDate] [date] NOT NULL,
	[image] [varchar](8000) NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[categoryId] [varchar](20) NOT NULL,
	[hsd] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[id] [int] NOT NULL,
	[date] [datetime] NULL,
	[userAccount] [varchar](50) NOT NULL,
	[foodId] [varchar](15) NOT NULL,
	[action] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOderDetail]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOderDetail](
	[orderId] [int] NOT NULL,
	[foodId] [varchar](15) NOT NULL,
	[price] [float] NOT NULL,
	[quanity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOders]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOders](
	[orderId] [int] NOT NULL,
	[userAccount] [varchar](50) NOT NULL,
	[totalPrice] [float] NOT NULL,
	[date] [varchar](100) NOT NULL,
	[fullName] [nvarchar](500) NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address] [nvarchar](4000) NULL,
	[statusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/16/2022 1:22:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userAccount] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](4000) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[roleID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [status]) VALUES (N'B001', N'Rau lá các loại', 1)
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [status]) VALUES (N'K001', N'Rau củ các loại', 1)
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [status]) VALUES (N'N001', N'Trái cây các loại', 1)
INSERT [dbo].[tblCategory] ([categoryId], [categoryName], [status]) VALUES (N'S001', N'Sữa', 1)
GO
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0001', N'Cải thìa 4KFarm gói 500g', 30000, N'Cải thìa 4KFarm gói 500g là sản phẩm rau sạch, với ưu điểm 4 KHÔNG được các chị em nội trợ ưa chuộng và tin dùng như không thuốc trừ sâu, không chất tăng trưởng, không chất bảo quản và không biến đổi gen, mang tới giống rau sạch, rau chất lượng', CAST(N'2020-09-18' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267905/bhx/rau-cai-thia-4kfarm-goi-500g-202112310826197983.jpg', 25, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0002', N'Cải ngọt 4KFarm gói 500g', 40000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Hàm lượng chất xơ cao, chứa nhiều chất dinh dưỡng,Cải Ngọt 4KFarm là một trong những loại rau được ưa thích để chế biến những món canh rau ngon bổ dưỡng phù hợp với mọi lứa tuổi.', CAST(N'2020-10-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267906/bhx/rau-cai-ngot-4kfarm-goi-500g-202112310830315441.jpg', 18, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0003', N'Rau mồng tơi 4KFarm gói 500g', 20000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Tính hàn đặc trưng của Rau Mùng Tơi 4KFarm khiến nhiều gia đình ưa chuộng để chế biến các món ăn thanh mát, phù hợp với những ngày hè nóng bức. Hàm lượng dinh dưỡng cao cũng là một trong các đặc điểm nổi bật.', CAST(N'2020-11-17' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267915/bhx/rau-mong-toi-4kfarm-goi-500g-202112310901426720.jpg', 17, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0004', N'Hẹ lá gói 100g', 10000, N'Với hàm lượng dinh dưỡng cao, có tác dụng dược lý nên hẹ được sử dụng rất nhiều trong các bài thuốc dân gian cũng như bữa ăn hàng ngày. Những công dụng của hẹ có thể nói đến như giảm đường huyết, giảm mỡ máu, ngăn ngừa xơ vữa động mạch và bảo vệ tuyến tụy...', CAST(N'2020-11-18' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/222882/bhx/he-la-tui-100g-202009292353400548.jpg', 13, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0005', N'Rau răm gói 100g', 10000, N'Rau răm gói 100g là một loại rau có vị cay, tính ấm và mùi thơm đặc trưng, thường ăn kèm với các món có tính hàn, giúp bụng của bạn tốt hơn. Rau răm thường dùng ăn kèm với hột vịt lộn, làm món đậu hũ kèm rau răm hay làm tăng gia vị cho các món kho, món gỏi,..', CAST(N'2020-12-29' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271503/bhx/rau-ram-goi-100g-202202261912265361.jpg', 17, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0006', N'Rau cần tàu (cần ta) gói 200g', 10000, N'Rau cần tàu (cần ta) là một loại rau xanh phổ biến được rất nhiều người yêu thích bởi vì hương vị vô cùng đặc trưng, thân cây còn mềm xốp, khi ăn có vị ngọt ngon vô cùng.  Bạn có thể mua rau cần tàu về làm nguyên liệu cho nhiều món như rau cần xào mực, rau cần nấu cà chua,..', CAST(N'2021-01-09' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/273978/bhx/rau-can-tau-can-ta-tui-200g-202203060024040896.jpg', 13, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0007', N'1/11
Cải bẹ xanh 4KFarm gói 500g1/11
Cải bẹ xanh 4KFarm gói 500g', 30000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Cải bẹ xanh 4KFarm chứa hàm lượng calories rất thấp nhưng lại có nhiều chất dinh dưỡng cần thiết cho cơ thể như Vitamin, Abumin, Catot,… giúp ngăn ngừa các biểu hiện ung thư,giúp da ngăn ngừa lão hóa, làm đẹp.', CAST(N'2021-01-05' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267907/bhx/rau-cai-be-xanh-4kfarm-goi-500g-202112310838505891.jpg', 24, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0008', N'4/12
Rau muống 4KFarm gói 500g', 10000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Với vị ngọt, tính mát, hàm lượng dinh dưỡng cao đặc biệt là sắt, vitamin A,c, Rau muống 4KFarm luôn là loại rau được ưa chuộng chọn lựa cho bữa cơm ngon mỗi ngày.', CAST(N'2020-10-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267916/bhx/rau-muong-tuoi-xanh-4kfarm-goi-500g-202112310902469727.jpg', 11, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0009', N'Rau dền 4KFarm gói 500g', 20000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Vị ngọt mát, thành phần dinh dưỡng cao đặc biệt là hàm lượng sắt dồi dào, Rau Dền 4KFarm sẽ là món canh bổ dưỡng hỗ trợ điều trị nhiều loại bệnh như táo bón, tiểu đường, thiếu máu...', CAST(N'2020-11-25' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267911/bhx/rau-den-tuoi-4kfarm-goi-500g-202112311752530085.jpg', 33, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0010', N'Cải dún 4KFarm gói 500g', 20000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Cải bẹ dún 4KFarm chứa nhiều thành phần dinh dưỡng có lợi cho sức khỏe. Có thể nấu canh, xào, cùng với các thực phẩm khác như thịt, cá,... tạo thành nhiều món ăn hấp dẫn cho cả nhà', CAST(N'2020-11-25' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267913/bhx/cai-dun-4kfarm-goi-500g-202112310850302182.jpg', 14, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0011', N'Cải ngồng 4KFarm gói 500g', 30000, N'Rau an toàn 4KFarm với tiêu chí 4 KHÔNG, luôn ưu tiên bảo vệ sức khỏe người tiêu dùng. Cải ngồng 4KFarm có vị mát rất tốt cho sức khỏe, chứa nhiều vitamin và khoáng chất. Cải ngồn có thể nấu canh hoặc xào cùng với thịt, cá,... để tạo thành nhiều món ăn ngon và bổ dưỡng.', CAST(N'2020-12-01' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/267914/bhx/rau-cai-ngong-4kfarm-goi-500g-202112310856070100.jpg', 18, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0012', N'Rau đay gói 500g', 20000, N'Vì có tính hàn cao, lành tính và vị ngọt đặc trưng nên rau đay của Bách hóa Xanh là sự lựa chọn tuyệt vời  dùng để chế biến những món canh vào mùa hè như canh cua rau đay, canh tôm rau đay,... giúp giải nhiệt, thanh mát, tạo cảm giác ngon miệng hơn trong bữa ăn.', CAST(N'2020-11-08' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271534/bhx/rau-day-goi-500g-202203082214509369.jpg', 19, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0013', N'Cải bó xôi gói 300g', 10000, N'Với công dụng tuyệt vời, có thể kể đến như chống ung thư, chống viêm, ngăn ngừa bệnh tuyến tiền liệt, hỗ trợ giảm cân, làm đẹp da, sáng mắt,.... Cải bó xôi của Bách hóa xanh tự tin mang đến cho bạn những món ăn đầy đủ dinh dưỡng, hấp dẫn và thanh mát.', CAST(N'2021-01-04' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/252679/bhx/cai-bo-xoi-tui-500g-202110131408080013.jpeg', 10, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0014', N'Bắp cải trắng túi 500g (1 bắp)', 20000, N'Là một loại thực phẩm vô cùng quen thuộc, rất dễ mua và chế biến thành nhiều món ăn đa dạng khác nhau trong bữa cơm hằng ngày. Bắp cải trắng đặc biệt mang đến lợi ích trong việc hỗ trợ phòng chống ung thư, giúp cơ thể khỏe mạnh toàn diện.', CAST(N'2020-11-17' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/232782/bhx/bap-cai-trang-tui-1kg-202012282215033958.jpg', 6, 1, N'B001', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0015', N'
Rau má gói 200g', 20000, N'Rau má gói 200g tươi ngon vô cùng, nấu được nhiều món ngon và mang lại nhiều lợi ích hữu dụng trong làm đẹp mà chị em nào cũng thích. Rau má xay sinh tố thì mát, đẹp da, rau má đắp mặt nạ thì giúp trị mụn, có thể nói đây là món rau không thể thiếu trong bếp của các chị em.', CAST(N'2020-12-16' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271747/bhx/rau-ma-goi-200g-202202091000455250.jpg', 12, 1, N'B001', CAST(N'2022-04-23' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0016', N'Gừng túi 100g (1-2 củ)', 30000, N'Gừng là một loại củ có rất nhiều công dụng đối với chúng ta. Ngoài là gia vị trong nấu ăn hàng ngày, chúng còn có thể dùng trong làm đẹp, làm thuốc cũng cực tốt. Có thể kể đến một số lợi ích của gừng như: làm ấm cơ thể, trừ hàn, tiêu đàm, dịu ho, cầm máu,...', CAST(N'2020-12-21' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/253796/bhx/gung-tui-100g-202110201541316775.jpeg', 12, 1, N'B001', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0017', N'Sả cây gói 200g', 20000, N'Sả cây gói tại Bách hoá XANH tươi ngon, cây to vô cùng. Sả giúp làm tăng hương vị cho món ăn, không chỉ giúp món ăn thêm đậm đà thơm ngon mà còn giúp cho món ăn dậy mùi thơm và có nhiều tác dụng tuyệt vời cho sức khoẻ nên rất được ưa chuộng', CAST(N'2020-11-24' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271533/bhx/sa-cay-goi-200g-202202071356438185.jpg', 15, 1, N'B001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0018', N'Ớt hiểm trái túi 50g', 20000, N'Với vị cay nồng, thơm, kích thích vị giác của người ăn, ớt là một trong những gia vị không thể thiếu trong nấu ăn cũng như mâm cơm của người Việt. Ớt hiểm luôn giữ được độ tươi mỗi ngày, được nuôi trồng theo quy trình nghiêm ngặt, bảo đảm các chỉ tiêu về an toàn và chất lượng.', CAST(N'2020-12-07' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271666/bhx/ot-hiem-trai-goi-50g-202202171312551335.jpg', 17, 1, N'B001', CAST(N'2023-03-24' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0019', N'Nấm mỡ nâu hộp 150g', 100000, N'Nấm mỡ nâu được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Chứa hàm lượng dinh dưỡng dồi dào, vị nấm ngọt dịu, thịt nấm giòn chắc thích hợp để nấu lẩu, xào cùng rau củ hoặc nấu các loại súp.', CAST(N'2020-10-16' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/233786/bhx/nam-mo-nau-hop-150g-202101292220224478.jpg', 46, 1, N'B001', CAST(N'2022-05-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0020', N'Nấm mỡ trắng hộp 150g', 70000, N'Nấm mỡ trắng được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Nấm mỡ chứa hàm lượng chất dinh dưỡng cao, nhiều vitamin và protein quan trọng nên thường được chế biến bằng cách xào hoặc nướng.', CAST(N'2021-01-09' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/233788/bhx/nam-mo-trang-hop-150g-202101292221399233.jpg', 18, 1, N'B001', CAST(N'2022-02-04' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0021', N'Tỏi cô đơn túi 300g', 30000, N'Tỏi cô đơn là một gia vị không thể thiếu trong gian bếp của mỗi gia đình, Tỏi cô đơn được nuôi trồng theo quy trình công nghệ nghiêm ngặt, bảo đảm các chỉ tiêu về an toàn và chất lượng. Tỏi có hàm lượng dinh dưỡng cao, tăng cường sức miễn dịch cho người sử dụng thường được dùng làm gia vị ướp', CAST(N'2020-12-23' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271536/bhx/toi-co-don-tui-300g-202202121607531408.jpg', 20, 1, N'B001', CAST(N'2022-03-27' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0022', N'Lẩu nấm thiên nhiên khay 300g', 50000, N'Lẩu nấm thiên nhiên gồm nhiều thành phần: nấm bào ngư, nấm kim châm, nấm hương, ớt,... Dùng nấu lẩu ngọt thơm, thanh mát nhờ các loại nấm có giá trị dinh dưỡng cao. Sản phẩm được làm sẵn, đơn giản tiện lợi thích hợp cho gia đình bận rộn không có thời gian', CAST(N'2020-12-30' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/226963/bhx/lau-nam-thien-nhien-khay-300g-202111300936095396.jpg', 24, 1, N'B001', CAST(N'2022-06-01' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0023', N'Bông cải trắng túi 500g (1 bông)', 40000, N'Bông cải trắng của Bách hóa Xanh được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Hàm lượng dinh dưỡng cao, vị giòn ngọt nên thường được dùng để chế biến các món xào hoặc luộc, giúp tăng cường miễn dịch.', CAST(N'2020-12-25' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/234020/bhx/bong-cai-trang-tui-500g-202105181408037995.jpg', 17, 1, N'B001', CAST(N'2022-07-05' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0024', N'Nấm đùi gà gói 200g', 30000, N'Nấm đùi gà được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Nấm giòn dai, ngọt thịt, nhiều dinh dưỡng thường được dùng cho các món xào, chiên giòn hoặc nướng ăn kèm với các loại xốt chấm', CAST(N'2020-11-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/228921/bhx/nam-dui-ga-vi-200g-202011071708459966.jpg', 13, 1, N'B001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0025', N'Măng tây bó 200g
', 50000, N'Măng tây được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Măng giòn, ngọt, hàm lượng dinh dưỡng cao nên thường được chế biên bằng hấp, luộc hoặc nướng để có thể giữ được độ tươi ngon.', CAST(N'2020-12-06' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/222783/bhx/mang-tay-bo-200g-202012082233238590.jpg', 8, 1, N'B001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB0026', N'Rau tần ô gói 500g', 30000, N'Rau tần ô gói 500g còn gọi là rau cải cúc, là một loại rau xanh vô cùng tươi ngon, rất dễ ăn và còn giúp trị ho, chữa tiêu chảy siêu hiệu quả. Rau tần ô sau khi mua về rửa sạch là có thể chế biến thành các món như canh rau tần ô thịt, canh rau tần ô tôm, rau tần ô xào thịt,..', CAST(N'2020-12-05' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271530/bhx/rau-tan-o-goi-500g-202203092143506942.jpg', 14, 1, N'B001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FB123', N'Chanh túi 500g (5 - 8 trái)', 10000, N'Chanh túi 500g với từng trái to, tròn và mọng nước, chanh giúp tạo nên vị chua đậm đà cho nhiều món ăn hay nước uống, khiến cho nhiều người thích mê. Chanh có thể làm nước đá chanh giải nhiệt mùa hè, tạo nên vị chua cho các món như canh chua, lẩu chua,...', CAST(N'2021-01-20' AS Date), N'https://cdn.tgdd.vn/Products/Images/8820/271466/bhx/chanh-goi-500g-202203081829138618.jpg', 6, 1, N'B001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FK0001', N'Bắp mỹ túi 2 trái (từ 600g trở lên)', 20000, N'Bắp Mỹ là một loại thực phẩm được trồng rất nhiều ở khắp nơi trên thế giới. Đây là một loại quả vừa ngon, lại có rất nhiều chất khoáng chất và vitamin. Bắp có thể chế biến thành nhiều món ăn ngon như: cơm bắp, chè bắp, sữa bắp,... bất kỳ món gì cũng tạo nên hương vị tuyệt hảo.', CAST(N'2020-12-18' AS Date), N'https://cdn.tgdd.vn/Products/Images/8785/222881/bhx/bap-my-2-trai-202012282219117576.jpg', 16, 1, N'K001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FK0002', N'Khoai tây túi 500g (3 - 7 củ)', 30000, N'Khoai tây đã quá quen thuộc với mỗi chúng ta. Loại củ này được xuất hiện thường xuyên trên mâm cơm này có rất nhiều công dụng hữu ích. Nó không chỉ tốt cho sức khỏe, làm đẹp hiệu quả mà còn có rất nhiều tác dụng bổ ích khác. Khoai tây có thể chế biến thành canh, súp, hoặc chiên đều rất ngon.', CAST(N'2020-12-28' AS Date), N'https://cdn.tgdd.vn/Products/Images/8785/271510/bhx/khoai-tay-tui-500g-5-7-cu-202202171853479972.jpg', 13, 1, N'K001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FK0003', N'Khoai mỡ túi 1kg (1 - 2 củ)', 20000, N'Là nguyên liệu khá quen thuộc của các chị em khi nấu ăn cho cả gia đình. Với hàm lượng khoáng chất và vitamin có trong khoai mỡ sẽ giúp cải thiện hệ tiêu hoá, giúp nhuận tràng, chữa táo bón rất tốt. Khoai mỡ có thể sử dụng để chế biến thành các món như: canh, bánh khoai mỡ, khoai mỡ chiên giòn,...', CAST(N'2020-12-24' AS Date), N'https://cdn.tgdd.vn/Products/Images/8785/220460/bhx/khoai-mo-tui-1kg-202011071639006438.jpg', 8, 1, N'K001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0001', N'Cam vàng túi 1kg (3-5 trái)', 40000, N'Cam nhập khẩu 100% từ Ai Cập (giấy chứng nhận nguồn gốc xuất xứ). Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. Trái to tròn, màu vàng tươi, mùi thơm thanh mát. Múi cam to, tép mọng nước, vị chua dịu, thích hợp để vắt nước.', CAST(N'2020-12-15' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/202933/bhx/cam-vang-valencia-uc-hop-1kg-4-5-trai-202101271645521884.jpg', 14, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0002', N'Cam sành túi 1kg (3 - 4 trái)', 30000, N'Cam sành túi 1kg (3-5 trái) trái to, cầm chắc tay, khi ăn sẽ cảm nhận được vị chua chua ngọt ngọt, giàu vitamin C tốt cho cơ thể. Cam sành là loại trái cây ưa thích của rất nhiều người', CAST(N'2020-11-28' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/235006/bhx/cam-sanh-tui-1kg-202106251522219128.jpg', 34, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0003', N'Táo Envy hộp 3 trái', 150000, N'Là giống táo được lai tạo từ giống táo Braeburn và táo Royal Gala, quả có vỏ màu đỏ thẫm tựa rượu vang, thịt táo có độ giòn cứng, có xuất xứ từ New Zealand. Táo Envy nhập khẩu New Zealand hộp 1kg cung cấp chất xơ và khoảng 14% vitamin C có lợi cho sức khỏe', CAST(N'2020-12-18' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273981/bhx/tao-envy-hop-3-trai-202203100031548872.jpg', 20, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0004', N'Chanh dây hộp 500g', 30000, N'Chanh dây của Bách Hóa Xanh được đóng gói và bảo quản theo những tiêu chuẩn nghiêm ngặt về vệ sinh và an toàn thực phẩm, đảm bảo về chất lượng, độ tươi và ngon của thực phẩm, xuất xứ rõ ràng. Chanh dây cỏ thể dùng để chế biến các món như nước ép chanh dây, sinh tố chanh dây,...', CAST(N'2020-10-25' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/274197/bhx/chanh-day-hop-500g-202203100205167983.jpeg', 15, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0005', N'Thanh long ruột đỏ túi 3kg (4-6 trái)', 40000, N'Thanh long ruột đỏ túi 3kg (4-6 trái) tươi ngon, an toàn, chất lượng. Mua tại Bách hoá XANH để nhận ngay trái cây tươi ngon, giá tốt và dịch vụ giao hàng tận nơi, nhanh chóng.', CAST(N'2020-11-19' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273350/bhx/thanh-long-ruot-do-tui-15kg-2-3-trai-202203100042075248.jpg', 20, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0006', N'Nho đỏ không hạt hộp 500g', 30000, N'Từ vùng trồng nho nổi tiếng, nho đỏ không hạt tại Bách Hóa XANH quả to, chắc thịt, thơm ngon mọng nước chứa hàm lượng vitamin dồi dào. Cam kết đúng khối lượng, chất lượng và an toàn, bao bì kín đáo, bảo đảm hợp vệ sinh', CAST(N'2020-11-20' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273984/bhx/nho-do-khong-hat-hop-500g-202203100007279784.jpg', 12, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0007', N'Táo Juliet Pháp túi 1kg (5-7 trái)', 100000, N'Táo Juliet Pháp với quả to vừa phải, hình tròn tròn bầu xinh xắn, với lớp vỏ đỏ xen vàng vô cùng sang trọng, thích hợp mua ăn, mua tặng biếu. Táo Juliet nhập khẩu với hương vị thơm ngon, giòn ngọt, được nhiều người ưa chuộng.', CAST(N'2020-12-24' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273992/bhx/tao-juliet-phap-tui-1kg-5-6-trai-202203070207434290.jpg', 25, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0008', N'Táo Fuji Hàn Quốc túi 1kg (4-7 trái)', 80000, N'Là trái cây nhập khẩu trực tiếp, có vỏ ngoài màu đỏ trên nền vàng, màu vàng táo chủ yếu phân bố ở phần cuống của quả. Táo Fuji này có phần thịt giòn, ngọt đậm, nhiều nước và có mùi thơm đặc trưng, giàu dưỡng chất đặc biệt tốt cho người ăn kiêng', CAST(N'2020-11-26' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/274002/bhx/tao-fuji-han-quoc-tui-1kg-4-5-trai-202203070014190427.jpg', 20, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0009', N'Nho xanh nhập khẩu hộp 500g', 140000, N'Nho xanh là loại trái cây tươi nhập khẩu cao cấp. Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. Quả nho màu xanh, dáng tròn, trái vừa ăn. Vỏ mỏng, không hạt, vị ngọt đậm, thịt chắc, giòn, tươi mát.', CAST(N'2020-12-28' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273985/bhx/nho-xanh-hop-500g-202203061045303630.jpeg', 27, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0010', N'Táo xanh Mỹ túi 1kg (5-7 trái)', 80000, N'Là một trong những loại trái cây nhập khẩu được nhiều người ưa chuộng bởi vị chua đậm khác biệt với các giống táo nhập khẩu khác. Táo xanh Mỹ có nguồn gốc rõ ràng, giá trị dinh dưỡng cao như giảm lượng cholesterol xấu, chống lại các bệnh ung thư gan, ruột kết và ung thư vú', CAST(N'2020-12-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/238650/bhx/tao-xanh-my-tui-1kg-5-7-trai-202203100003340887.jpg', 17, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0011', N'Nho đen nhập khẩu hộp 500g', 170000, N'Là loại trái cây tươi cao cấp, có quả thuôn dài, vỏ mỏng, màu đen sẫm, không hạt, rất ngọt và giòn. Nho đen được nhập khẩu trực tiếp, đạt tiêu chuẩn xuất khẩu toàn cầu, loại sản phẩm này có giá trị dinh dưỡng cao, được cả trẻ em và người lớn đều thích', CAST(N'2020-11-30' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273983/bhx/nho-den-ngon-nhap-khau-hop-500g-202203060920418208.jpeg', 17, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0012', N'Quýt nhập khẩu túi 1kg (6 -9 trái)', 80000, N'Là loại trái cây nhập khẩu chứa nhiều chất dinh dưỡng có lợi cho sức khỏe, đồng thời quýt cung cấp những chất dinh dưỡng thiết yếu như vitamin C để tăng cường sức đề kháng. Quýt vàng ươm, mọng nước và ngọt lịm sẽ là loại quả giải nhiệt mùa hè rất tốt', CAST(N'2020-12-26' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273980/bhx/quyt-nhap-khau-tui-1kg-7-9-trai-202203100037006114.jpg', 32, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0013', N'Cam Cara túi 1kg (3-5 trái)', 120000, N'Cam ruột đỏ Cara nhập khẩu từ Ai Cập là loại trái cây tươi ngon với vị ngọt thanh, không quá chua, tạo cảm giác sảng khoái khi thưởng thức. Ngoài ra, cam Cara tại Bách hoá XANH có nguồn gốc nhập khẩu rõ rảng, đạt tiêu chuẩn thu hoạch và chất lượng cao.', CAST(N'2020-12-14' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/259912/bhx/cam-cara-nhap-khau-uc-tui-1kg-202111240953509261.jpg', 12, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0014', N'Xoài cát Hoà Lộc túi 1kg (1-2 trái)', 60000, N'Loại trái cây giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, tim mạch, giúp mắt sáng, làm đẹp da. Xoài cát Hòa Lộc có vị ngọt thanh dễ chịu, thịt dày, ít xơ và có độ dẻo lý tưởng', CAST(N'2020-10-26' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/222842/bhx/xoai-cat-hoa-loc-tui-1kg-202103180811516385.jpg', 11, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0015', N'Nho đỏ có hạt hộp 500g', 90000, N'Với phần thịt dày mọng nước, vị ngọt xen lẫn chua nhẹ hài hoà, nho đỏ có hạt là loại trái cây được nhiều người yêu thích vào những ngày hè. Loại nho này không chỉ mang lại nhiều lợi ích đối với sức khoẻ mà còn là nguyên liệu ăn kèm với các món salad, sữa chua hoặc thức uống giải khát,...', CAST(N'2020-12-20' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/274003/bhx/nho-do-co-hat-hop-500g-202203100013319765.jpg', 13, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0016', N'Táo Tessa nhập khẩu hộp 4 trái', 15000, N'Táo Tessa nhập khẩu với đặc điểm là quả to tròn, căng mọng nhìn rất thích mắt, vỏ màu đậm và bắt mắt vô cùng. Khi ăn, bạn dễ dàng cảm nhận được hương vị thơm, giòn, ngọt đậm đà, khiến bạn say đắm', CAST(N'2020-11-19' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273994/bhx/tao-tessa-nhap-khau-hop-4-trai-202203100107290548.jpg', 12, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0017', N'Bơ túi 800g (1-2 quả)', 13000, N'Bơ là loại trái cây chứa nhiều thành phần dinh dưỡng tốt cho cơ thể bao gồm vitamin, khoáng chất và chất chống oxy hóa. Bơ có phần cơm dày, dẻo thơm hấp dẫn phù hợp chế biến rất nhiều món ăn, thức uống thơm ngon, bên cạnh đó còn mang lại hiệu quả làm đẹp rất tốt', CAST(N'2020-12-25' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/270357/bhx/bo-tui-800g-202202230815384778.jpg', 9, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0018', N'
Dưa hấu không hạt trái từ 3kg trở lên', 80000, N'Dưa hấu không hạt với thành phần chủ yếu là nước và các vitamin, khoáng chất cần thiết đặc biệt là ít calo và chất béo nên dưa hấu được xem là một sản phẩm thay thế cho nước uống thông thường. Với ưu điểm không hạt, loại dưa hấu này khiến dễ dàng thưởng thức hoặc chế biến thành nhiều món ăn.', CAST(N'2020-10-29' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/272179/bhx/dua-hau-khong-hat-trai-202202230819297090.jpg', 15, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0019', N'Bưởi da xanh trái từ 1.7kg trở lên', 89000, N'Bưởi da xanh là một trong những đặc sản nổi tiếng của Việt Nam. Loại bưởi này không chỉ ngon, ngọt mà còn mang lại cho con người nhiều công dụng tốt cho sức khoẻ như cung cấp nguồn vitamin dồi dào. Bưởi da xanh thích hợp cho những ngày nắng nóng với nhiều cách chế biến khác nhau', CAST(N'2020-12-05' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/271694/bhx/buoi-da-xanh-tui-1-trai-202202081158222583.jpg', 9, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0020', N'Dưa lưới tròn ruột cam trái từ 1.3kg trở lên', 140000, N'Là loại trái cây được rất nhiều người ưa thích vì màu sắc đẹp mắt và vị ngon ngọt, mang giá trị dinh dưỡng cao và nhiều công dụng tuyệt vời cho sức khỏe như ngừa ung thư, bổ mắt, chống viêm khớp và làm đẹp da… Dưa lưới tại Bách hoá XANH với vị ngọt vừa phải, giúp người dùng giải khát trong ngày hè.', CAST(N'2020-11-04' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273734/bhx/dua-luoi-tron-ruot-cam-tui-1-trai-tu-13kg-tro-len-202203081820013739.jpg', 15, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0021', N'Lê đá túi 1kg (4-6 trái)', 81000, N'Lê đá là một loại trái cây vô cùng giòn, ngọt, mọng nước, rất thích hợp ăn để giải nhiệt cho những trưa nắng nóng. Lê đá quả to tròn, mọng nước, ăn rất thích, phù hợp với khẩu vị của tất cả các thành viên trong gia đình.', CAST(N'2020-12-08' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/273845/bhx/le-da-tui-1kg-4-5-trai-202203100123117750.jpg', 11, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FN0022', N'1/8
Chuối già giống Nam Mỹ hộp 1kg (6-7 trái)', 43000, N'Loại chuối được nhiều khách hàng ưa chuộng. Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... nên chuối có tác dụng tốt cho sức khoẻ như hỗ trợ giảm cân, hỗ trợ sức khoẻ tim mạch, cải thiện sức khoẻ của thận,...Cam kết đúng khối lượng, bao bì kín đáo, an toàn và bảo đảm hợp vệ sinh.', CAST(N'2020-10-09' AS Date), N'https://cdn.tgdd.vn/Products/Images/8788/272140/bhx/chuoi-gia-giong-nam-my-hop-1kg-5-7-trai-202203081826122204.jpg', 14, 1, N'N001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0001', N'Sữa tươi tách béo không đường Australia''s Own hộp 1 lít', 32000, N'Sữa tươi tách béo không đường Australia''s Own hộp 1 lít', CAST(N'2020-11-18' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/223711/bhx/sua-tuoi-tach-beo-khong-duong-australias-own-hop-1-lit-202006111320310001.jpg', 29, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0002', N'Sữa tươi nguyên kem không đường Australia''s Own hộp 1 lít', 32000, N'Thiết kế tích hợp thanh cắt bên trong, chỉ cần vặn là thanh cắt xoáy xuống, tự động cắt lớp giấy bạc bảo vệ bên dưới, khui hộp chỉ với một bước', CAST(N'2020-10-29' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/223720/bhx/sua-tuoi-nguyen-kem-khong-duong-australias-own-hop-1-lit-202006111307284131.jpg', 18, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0003', N'Sữa tươi nguyên kem không đường Inex hộp 1 lít', 30000, N'Sữa tươi nguyên kem Inex được tuyển chọn từ các trang trại bò sữa tại Bỉ với khí hậu ôn hoà và ngành chăn nuôi phát triển. Sữa bò nơi đây luôn được đánh giá cao về chất lượng, trải qua quy trình sản xuất và kiểm soát chất lượng nghiêm ngặt của châu Âu, đảm bảo không chứa chất bảo quản và hormone tăng trưởng.', CAST(N'2020-11-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/219025/bhx/sua-tuoi-nguyen-kem-khong-duong-inex-hop-1-lit-202003041449563169.jpg', 12, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0004', N'Sữa tươi tiệt trùng không đường Dutch Lady hộp 1 lít', 28500, N'Sữa tiệt trùng Dutch Lady không đường sử dụng nguyên liệu là sữa tươi, bổ sung protein, phốt pho, Vitamin B2 và B12 cùng nhiều vitamin và khoáng chất cần thiết cho cơ thể.', CAST(N'2020-12-11' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/76865/bhx/sua-tuoi-tiet-trung-dutch-lady-khong-duong-hop-1-lit-201911291012334827.jpg', 10, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0005', N'Sữa dinh dưỡng có đường Vinamilk Happy Star bịch 220ml', 5500, N'Sữa dinh dưỡng Vinamilk Star có đường với hương vị sữa thơm ngon, béo ngậy, dễ uống. Trong sữa có bổ sung nhiều loại vitamin và khoáng chất tốt cho cơ thể, đảm bảo cung cấp dưỡng chất đầy đủ mỗi ngày.', CAST(N'2020-12-12' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/79276/bhx/sua-dinh-duong-vinamilk-star-co-duong-bich-220ml-201912311532549085.jpg', 15, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0006', N'Sữa tươi tiệt trùng có đường Vinamilk Nhập khẩu 100% hộp 1 lít', 32500, N'Thiết kế tích hợp thanh cắt bên trong, chỉ cần vặn là thanh cắt xoáy xuống, tự động cắt lớp giấy bạc bảo vệ bên dưới, khui hộp chỉ với một bước', CAST(N'2020-11-24' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/216198/bhx/sua-tuoi-tiet-trung-vinamilk-nhap-khau-100-co-duong-hop-1-lit-201912131030376678.JPG', 24, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0007', N'Sữa tươi tiệt trùng có đường Dalat Milk bịch 220ml', 7000, N' Sữa hoàn toàn từ sữa bò tươi (96.1%), đường (3.7%), hỗn hợp chất nhũ hoá và chất ổn định (E418, E471, E410)', CAST(N'2020-11-27' AS Date), N'https://cdn.tgdd.vn/Products/Images/2386/223729/bhx/sua-tuoi-tiet-trung-co-duong-dalat-milk-bich-220ml-202006110917538437.jpg', 18, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0008', N'Sữa đậu nành đậu đen óc chó hạnh nhân Yaho hộp 190ml', 10000, N'Sữa đậu nành đậu đen óc chó hạnh nhân Yaho hộp 190ml', CAST(N'2020-10-20' AS Date), N'https://cdn.tgdd.vn/Products/Images/2943/229505/bhx/sua-dau-nanh-dau-den-oc-cho-hanh-nhan-yaho-hop-190ml-202010191639392197.jpg', 15, 0, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0009', N'Sữa đậu đen óc chó hạnh nhân Sahmyook hộp 950ml', 69000, N'Là sự kết hợp của đậu đen, hạnh nhân và óc chó, Sahmyook đã cho ra đời sản phẩm Sữa đậu đen óc chó hạnh nhân Sahmyook hộp 950ml với vị lạ cho người dùng cùng vị sữa ngòn ngọt, béo dịu vừa miệng, mang đậm nét đặc trưng của hạt óc chó.
Hạnh nhân được đánh giá là “nữ hoàng của các loại hạt”. Khi bổ sung vào cơ thể, hạnh nhân sẽ cân bằng lượng cholesterol, loại bỏ mỡ thừa trong máu, hạn chế các bệnh về tim mạch hiệu quả.', CAST(N'2020-12-12' AS Date), N'https://cdn.tgdd.vn/Products/Images/2943/214605/bhx/sua-dau-den-oc-cho-hanh-nhan-sahmyook-hop-950ml-201911131119441267.jpg', 23, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0010', N'Sữa đậu nành Fami Canxi 1 lít', 19000, N'Nước, dịch trích từ đậu nành hạt, đường, canxi,...', CAST(N'2021-01-05' AS Date), N'https://cdn.tgdd.vn/Products/Images/2943/108675/bhx/sua-dau-nanh-fami-canxi-1-lit-201903141342501221.jpg', 16, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0011', N'Sữa hạt dẻ cười nguyên chất 137 Degrees hộp 1 lít', 105000, N'Sau khi mở nắp, bảo quản lạnh và sử dụng trong vòng 7 ngày, đậy kín nắp sau mỗi lần sử dụng.', CAST(N'2020-12-10' AS Date), N'https://cdn.tgdd.vn/Products/Images/2943/160990/bhx/sua-hat-de-cuoi-137-degrees-nguyen-chat-1-lit-201903141115378898.jpg', 14, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0012', N'Sữa chua uống hương cam YoMost hộp 1 lít', 30000, N'Nước, sữa chua lên men, đường,...', CAST(N'2020-12-07' AS Date), N'https://cdn.tgdd.vn/Products/Images/2944/232068/bhx/sua-chua-uong-huong-cam-yomost-hop-1-lit-202012100830557070.jpg', 27, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0013', N'Lốc 4 hộp sữa chua uống hương cam TH True Yogurt 180ml', 32000, N'để nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.', CAST(N'2020-11-21' AS Date), N'https://cdn.tgdd.vn/Products/Images/2944/84343/bhx/loc-4-hop-sua-chua-uong-th-true-yogurt-cam-180ml-201905060959279602.jpg', 16, 1, N'S001', CAST(N'2022-04-02' AS Date))
INSERT [dbo].[tblFood] ([foodId], [foodName], [price], [desciption], [createDate], [image], [quantity], [status], [categoryId], [hsd]) VALUES (N'FS0014', N'Lốc 4 chai sữa chua uống hương dâu TH True Yogurt chai 180ml', 29000, N'Lốc 4 chai sữa chua uống hương dâu TH True Yogurt chai 180ml', CAST(N'2020-10-20' AS Date), N'https://cdn.tgdd.vn/Products/Images/2944/198298/bhx/loc-4-chai-sua-chua-uong-huong-dau-th-true-yogurt-chai-180ml-202004091544322635.jpg', 12, 0, N'S001', CAST(N'2022-04-02' AS Date))
GO
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (1, CAST(N'2021-01-20T20:42:23.543' AS DateTime), N'admin', N'FB0001', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (2, CAST(N'2021-01-20T20:44:12.757' AS DateTime), N'admin', N'FB0001', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (3, CAST(N'2021-01-20T20:44:15.770' AS DateTime), N'admin', N'FB0019', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (4, CAST(N'2021-01-20T20:44:18.780' AS DateTime), N'admin', N'FB0002', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (5, CAST(N'2021-01-20T20:44:20.533' AS DateTime), N'admin', N'FB0008', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (6, CAST(N'2021-01-20T20:44:22.627' AS DateTime), N'admin', N'FB0012', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (7, CAST(N'2021-01-20T20:44:25.260' AS DateTime), N'admin', N'FB0014', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (8, CAST(N'2021-01-20T20:44:29.113' AS DateTime), N'admin', N'FB0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (9, CAST(N'2021-01-20T20:44:45.937' AS DateTime), N'admin', N'FB0019', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (10, CAST(N'2021-01-20T20:44:58.610' AS DateTime), N'admin', N'FN0022', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (11, CAST(N'2021-01-20T20:46:19.570' AS DateTime), N'admin', N'FN0022', N'Delete')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (12, CAST(N'2021-01-20T20:52:19.687' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (13, CAST(N'2021-01-20T20:52:29.083' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (14, CAST(N'2021-01-20T20:53:32.663' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (15, CAST(N'2021-01-20T20:53:45.910' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (16, CAST(N'2021-01-20T20:53:49.907' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (17, CAST(N'2021-01-20T20:53:54.050' AS DateTime), N'admin', N'FN0018', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (18, CAST(N'2021-01-20T20:54:26.153' AS DateTime), N'admin', N'FN0018', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (19, CAST(N'2021-01-20T20:55:16.580' AS DateTime), N'admin', N'FN0022', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (20, CAST(N'2021-01-20T20:56:04.997' AS DateTime), N'admin', N'FN0014', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (21, CAST(N'2021-01-20T20:56:17.293' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (22, CAST(N'2021-01-20T20:58:16.230' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (23, CAST(N'2021-01-20T20:59:46.057' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (24, CAST(N'2021-01-20T21:00:07.710' AS DateTime), N'admin', N'FN0004', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (25, CAST(N'2022-03-06T19:30:53.693' AS DateTime), N'admin', N'FB0001', N'Update')
INSERT [dbo].[tblHistory] ([id], [date], [userAccount], [foodId], [action]) VALUES (26, CAST(N'2022-03-07T20:52:52.180' AS DateTime), N'admin', N'FB0019', N'Update')
GO
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (1, N'FB0003', 8000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (1, N'FN0005', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (1, N'FS0001', 32000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (1, N'FS0003', 30000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (2, N'FS0007', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (3, N'FN0016', 29000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (4, N'FB0026', 15000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (5, N'FB0024', 15000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (6, N'FB0016', 26000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (7, N'FN0007', 7500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (8, N'FN0001', 12000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (9, N'FN0006', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (10, N'FN0010', 50500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (11, N'FN0017', 29000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (12, N'FN0004', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (13, N'FN0015', 28000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (14, N'FN0005', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (14, N'FN0006', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (14, N'FN0008', 23000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (15, N'FB0019', 21500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (16, N'FB0014', 108000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (16, N'FB0019', 21500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (17, N'FB0004', 4000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (17, N'FB0014', 108000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (18, N'FN0004', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (18, N'FN0006', 7000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (18, N'FS0013', 32000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (19, N'FB0002', 30000, 2)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (19, N'FB0019', 21500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (20, N'FB0019', 21500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (21, N'FB0001', 50000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (22, N'FB0019', 21500, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (23, N'FB0019', 100000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (24, N'FN0020', 140000, 1)
INSERT [dbo].[tblOderDetail] ([orderId], [foodId], [price], [quanity]) VALUES (24, N'FN0022', 43000, 1)
GO
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (1, N'thanhduy', 77000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (2, N'thanhduy', 7000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (3, N'thanhduy', 29000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (4, N'thanhduy', 15000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (5, N'thanhduy', 15000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (6, N'thanhduy', 26000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (7, N'thanhduy', 7500, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (8, N'thanhduy', 12000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (9, N'thanhduy', 7000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 4)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (10, N'thanhduy', 50500, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 2)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (11, N'thanhduy', 29000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 3)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (12, N'thanhduy', 7000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 5)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (13, N'thanhduy', 28000, N'2021-01-20', N'Thanh Duy', N'1234567891', N'thanthanhduy0111@gmail.com', N'B?o L?c', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (14, N'thanhduy', 37000, N'2022-03-07', N'Thanh Duy', N'1234567890', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 2)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (15, N'thanhduy', 21500, N'2022-03-07', N'Thanh Duy', N'1234567895', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (16, N'test', 129500, N'2022-03-07', N'test', N'359874159', N'duyttse140971@fpt.edu.vn', N'Quận 1, Sài gòn', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (17, N'thanhduy', 112000, N'2022-03-07', N'Thanh Duy', N'1234567894', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (18, N'thanhduy', 46000, N'2022-03-07', N'Thanh Duy', N'1234567895', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 2)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (19, N'thanhduy', 81500, N'2022-03-07', N'Thanh Duy', N'1234567893', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 3)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (20, N'1092394843348315642', 21500, N'2022-03-07', N'Huynh Tuan Vu', N'967767612', N'tuanvuchoilol@gmail.com', N'54,12D, Long Thanh My, tp Thu Duc, Ho Chi Minh', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (21, N'thanhduy', 50000, N'2022-03-09', N'Thanh Duy', N'1234567895', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (22, N'thanhduy', 21500, N'2022-03-09', N'Thanh Duy', N'1234567789', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (23, N'thanhduy', 100000, N'2022-03-10', N'Thanh Duy', N'1234567894', N'thanthanhduy0111@gmail.com', N'Bảo Lộc', 1)
INSERT [dbo].[tblOders] ([orderId], [userAccount], [totalPrice], [date], [fullName], [phone], [email], [address], [statusID]) VALUES (24, N'1092394843348315642', 183000, N'2022-03-10', N'Huynh Tuan Vu', N'967767612', N'tuanvuchoilol@gmail.com', N'54,12D, Long Thanh My, tp Thu Duc, Ho Chi Minh', 4)
GO
INSERT [dbo].[tblRole] ([roleID], [roleName], [status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[tblRole] ([roleID], [roleName], [status]) VALUES (N'Guest', N'Guest', 1)
INSERT [dbo].[tblRole] ([roleID], [roleName], [status]) VALUES (N'US', N'User', 1)
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (1, N'Đã tiếp nhận đơn hàng')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (2, N'Đã hoàn thanhg đóng gói')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (3, N'Đang vận chuyển')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (4, N'Vận chuyển thành công')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (5, N'Đã huỷ')
GO
INSERT [dbo].[tblUsers] ([userAccount], [fullName], [password], [phone], [address], [email], [status], [roleID]) VALUES (N'1092394843348315642', N'Tuan Vu Huynh', N'123', N'0', N'', N'tuanvuchoilol@gmail.com', 1, N'US')
INSERT [dbo].[tblUsers] ([userAccount], [fullName], [password], [phone], [address], [email], [status], [roleID]) VALUES (N'admin', N'admin', N'123456', N'1234567890', N'sài gòn', N'zxc@zxc', 1, N'AD')
INSERT [dbo].[tblUsers] ([userAccount], [fullName], [password], [phone], [address], [email], [status], [roleID]) VALUES (N'test', N'test', N'123456', N'0359874159', N'Quận 1, Sài gòn', N'duyttse140971@fpt.edu.vn', 1, N'US')
INSERT [dbo].[tblUsers] ([userAccount], [fullName], [password], [phone], [address], [email], [status], [roleID]) VALUES (N'testAD', N'AD', N'123', N'1234567890', N'ádasf', N'asasfasf@àasf', 1, N'AD')
INSERT [dbo].[tblUsers] ([userAccount], [fullName], [password], [phone], [address], [email], [status], [roleID]) VALUES (N'thanhduy', N'Thanh Duy', N'123456', N'0123456789', N'Bảo Lộc', N'thanthanhduy0111@gmail.com', 1, N'US')
GO
ALTER TABLE [dbo].[tblFood]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[tblCategory] ([categoryId])
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD FOREIGN KEY([foodId])
REFERENCES [dbo].[tblFood] ([foodId])
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD FOREIGN KEY([userAccount])
REFERENCES [dbo].[tblUsers] ([userAccount])
GO
ALTER TABLE [dbo].[tblOderDetail]  WITH CHECK ADD FOREIGN KEY([foodId])
REFERENCES [dbo].[tblFood] ([foodId])
GO
ALTER TABLE [dbo].[tblOderDetail]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[tblOders] ([orderId])
GO
ALTER TABLE [dbo].[tblOders]  WITH CHECK ADD FOREIGN KEY([userAccount])
REFERENCES [dbo].[tblUsers] ([userAccount])
GO
ALTER TABLE [dbo].[tblOders]  WITH CHECK ADD  CONSTRAINT [FK_tblOders_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOders] CHECK CONSTRAINT [FK_tblOders_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment1_ThanThanhDuy] SET  READ_WRITE 
GO
