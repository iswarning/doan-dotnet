--0468161099-Lâm Chí Vĩnh
--0468161031-Lư Lễ Hoa
--0468161017-Nguyễn Trường Duy

create database [QLDA]
USE [QLDA]
CREATE TABLE LOAISANPHAM
(
	MaLoai int not null,
	TenLoai nvarchar(20) not null,	
	TrangThai int,
	PRIMARY KEY(MaLoai),	
)
CREATE TABLE SANPHAM
(
	MaSanPham int not null,
	MaLoai int not null,
	TenSanPham nvarchar(100) not null,
	MoTa nvarchar(1000),
	Gia float,
	HinhAnh nvarchar(255),
	HinhCT1 nvarchar(100),
	HinhCT2 nvarchar(100),
	HangSanXuat nvarchar(50),
	[KeyWord] [nvarchar](max) NULL,
	Primary Key(MaSanPham),	
)
CREATE TABLE TAIKHOAN
(
	MaTaiKhoan int IDENTITY(1,1),
	TenDangNhap nvarchar(50),
	MatKhau nvarchar(20),
	Email varchar(320),
	HoTen nvarchar(50),
	NgaySinh date,
	SDT int,
	DiaChi nvarchar(MAX),
	AnhDaiDien nvarchar(MAX),
	Primary Key(MaTaiKhoan),	
)
CREATE TABLE CHITIETHOADON
(
	MaHoaDon int not null,
	MaSanPham int not null,
	SoLuong int,
	Gia float,
	PRIMARY KEY (MaHoaDon,MaSanPham),	
)
CREATE TABLE HOADON
(
	MaHoaDon int not null,
	NgayTao datetime not null,
	MaTaiKhoan int,
	HoTen nvarchar(50),
	Email nvarchar(20),
	SDT int,
	PRIMARY KEY (MaHoaDon),	
)
--khóa ngoại
ALTER TABLE SANPHAM  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_LOAISANPHAM] FOREIGN KEY(MaLoai)
REFERENCES LOAISANPHAM (MaLoai)

ALTER TABLE HOADON  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_HOADON] FOREIGN KEY(MaTaiKhoan)
REFERENCES TAIKHOAN (MaTaiKhoan)


--dữ liệu
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (1, 1, N'Điện Thoại iPhone X', N'iPhone X được Apple ra mắt ngày 12/9 vừa rồi đánh dấu chặng đường 10 năm lần đầu tiên iPhone ra đời. Sau một thời gian, giá iPhone X cũng được công bố. iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp.', 34790000, N'image/x.png', N'image/x_item1.png', N'image/x_item2.png', N'Apple', N'apple')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (2, 1, N'Điện Thoại Vivo V9', N'Vivo V9 là chiếc smartphone tầm trung cận cao cấp với điểm nhấn là máy có camera kép phía sau và camera selfie độ phân giải cao 24 MP.Cũng giống như ZenFone 5, OPPO R15 hay Huawei P20, chiếc smartphone này của Vivo cũng dõi theo xu hướng thiết kế notch (hay còn gọi là tai thỏ) như trên chiếc iPhone X của Apple.', 7990000, N'image/v9.png', N'image/v9_item1.png', N'image/v9_item.jpg', N'Vivo', N'vivo')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (3, 1, N'Samsung Galaxy A6', N'Samsung Galaxy A6 (2018) là chiếc smartphone tầm trung vừa được ra mắt của Samsung bên cạnh chiếc Samsung Galaxy A6+ (2018).Thiết kế quen thuộcMáy được hoàn thiện từ kim loại nguyên khối, kết hợp với mặt kính cong nhẹ 2.5D cho cảm giác vuốt chạm thoải mái hơn.Mặt trước là camera "tự sướng" và đèn LED trợ sáng 3 cấp độ giúp chụp ảnh selfie trong điều kiện thiếu sáng tốt hơn.Mặt lưng là dãy ăng-ten trên dưới đối xứng hình chữ U và camera chính và cảm biến vân tay được gom chung vào 1 cụm.', 6990000, N'image/a6.png', N'image/a6_item1.png', N'image/a6_item2.png', N'Samsung', N'samsung')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (4, 1, N'Điện thoại OPPO A83', N'OPPO A83 là chiếc smartphone dòng A đầu tiên sở hữu cho mình màn hình tràn viền và cùng với đó là camera với khả năng làm đẹp bằng AI nổi tiếng của OPPO.Thiết kế thon gọn Với xu thế màn hình 18:9 của năm 2017 thì máy sở hữu một thân hình "thon thả" với các góc cạnh được bo tròn mềm mại.', 4990000, N'image/a83.png', N'image/a83_item1.png', N'image/a83_item2.png', N'OPPO', N'oppo')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (5, 2, N'Chuột Bluetooth Apple', N'Phong cách thiết kế mang đậm bản sắc của Apple. Thời gian sử dụng chuột MLA02 kéo dài, chuột magic mouse MLA02 cho bạn thời gian sử dụng lên tới 1 tháng hoặc hơn chỉ với 1 lần sạc (2 tiếng). Cổng sạc cho chuột nằm ngay mặt dưới, dùng dây sạc đầu lightning (đi kèm với hộp).', 2490000, N'image/pk8.png', N'image/pk8_item1.jpg', N'image/pk8_item2.jpg', N'Apple', N'apple')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (6, 2, N'Apple Watch S3 GPS', N'Về mặt tổng thể Apple Watch Series 3 có kích thước tương tự như Apple Watch Series 2. Sản phẩm chú trọng thêm về mặt thẩm mỹ với thiết kế sang trọng, năng động nhiều màu sắc khác nhau. Màn hình Apple Watch phiên bản 42 mm lớn 1.65 inch hiển thị chi tiết ảnh nhiều hơn, mặt đồng hồ cảm ứng trang bị mặt kính cường lực Sapphire crystal glass giúp bảo vệ mặt kính chống trầy xước tốt và hiển thị tốt dù là dưới ánh mặt trời.', 10990000, N'image/pk5.png', N'image/pk5_item1.jpg', N'', N'Apple', N'apple')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (7, 2, N'Ốp lưng iPhone X', N'Ốp lưng chính hãng Apple, nguyên seal 100%. Kiểu dáng thời trang và đẹp mắt, thiết kế vừa vặn và ôm sát thân máy,dễ dàng tháo/lắp ốp vào máy.', 1590000, N'image/pk4.png', N'image/pk4_item1.jpg', N'', N'Apple', N'apple')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (8, 2, N'Sạc dự phòng Polymer ', N'Pin sạc dự phòng Polymer Sony CP-S15-BC ULA tuy có dung lượng rất lớn nhưng kiểu dáng vẫn nhỏ gọn. Tích hợp công nghệ Hybrid Gel cho tuổi thọ sạc hơn 1000 lần. Dung lượng pin cao cho nhiều lần sạc,sạc đầy được cho điện thoại và máy tính bảng có dung lượng dưới 13.000 mAh. Sạc song song 2 thiết bị với tốc độ nhanh.', 1780000, N'image/pk1.png', N'image/pk1.png', N'image/pin1.png', N'', N'sac du phong')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (9, 2, N'Sạc không dây 1A', N'Thiết kế đẹp mắt, tiện dụng, dễ dàng xếp lại và mang theo bất cứ nơi đâu. Tiện lợi chuyển đổi từ sạc đứng sang sạc nằm. Thưởng thức trọn vẹn cả khung hình, cho trải nghiệm giải trí tối đa ngay khi đang sạc. Chất liệu da cao cấp, giữ chắc điện thoại trên đế khi đang sạc. Sạc nhanh: tương thích với Galaxy Note8, S8, S8+, S7, S7 edge, Note5, S6 edge+ / Qi (Tương thích với Galaxy S6, S6 edge và các thiết bị được chứng nhận Qi).', 1450000, N'image/pk7.png', N'image/pk7.png', N'image/pk7_item1.jpg', N'Samsung', N'sac khong day')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (10, 2, N'Tai nghe Bluetooth', N'Airpods sở hữu thiết kế thời trang và nhỏ gọn, trọng lượng cũng rất nhẹ, mọi chi tiết đều được hoàn thiện, cải thiện thêm nhiều tính năng độc đáo. Nút tai nghe được làm rất vừa vặn với tai tạo cảm giác thoải mái, không bị khó chịu khi đeo trong thời gian dài nhưng cũng rất chắc chắn.', 4990000, N'image/pk2.png', N'image/pk2_item1.jpg', N'image/pk2_item2.jpg', N'Apple', N'tai nghe')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (11, 2, N'Thẻ nhớ Micro SD 200GB', N'Thẻ nhớ dành cho các mẫu điện thoại cao cấp. Tương thích với thiết bị có thể nhận thẻ nhớ tối đa 200 GB. Chép một video dung lượng 10 GB vào thẻ chưa tới 2 phút. Phù hợp cho các dòng máy cơ, quay phim 4K.', 2500000, N'image/pk3.png', N'image/pk3-item1.jpg', N'image/pk3-item2.jpg', N'', N'the nho')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (12, 2, N'USB 3.0 Sandisk iXpand', N'Kết nối kép OTG USB-Lightning. USB 3.0 tốc độ cao. Bổ sung dung lượng lưu trữ tức thì cho iPhone, iPad. Bảo mật dữ liệu bằng hệ thống mã hoá. Chơi nhạc và video trực tiếp trên app SanDisk iXpand Drive. Tốc độ đọc tối đa: iPhone: 90MB/s, máy tính: 150MB/s.', 990000, N'image/pk6.png', N'image/pk6_item1.png', N'', N'Apple', N'usb')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (13, 3, N'Samsung Galaxy Tab A6', N'Là dòng máy trong phân khúc tầm trung, Samsung Galaxy Tab A6 10.1 Spen được thiết kế với vỏ nhựa nhám nhẹ cùng các góc bo tròn cho cảm giác chắc chắn, không bám vân tay khi cầm. Sở hữu màn hình kích thước 10.1 inch không quá lớn, có thể nhét vừa một chiếc balo dạng nhỏ, Samsung Galaxy Tab A6 10.1 Spen sử dụng tấm nền PLS LCD cho khả năng hiển thị tốt. Độ phân giải  WUXGA 1920 x 1200 pixels cho chất lượng hình ảnh sắc nét, sử dụng tốt khi đi ngoài trời.', 7990000, N'image/tb1.png', N'image/tb1.png', N'image/tb1_item1.jpg', N'Samsung', N'ipad')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (14, 3, N'Máy tính bảng iPad Pro', N'Apple vẫn giữ ngôn ngữ thiết kế từ xa xưa tới nay, nên phiên bản 10.5 inch cũng không có gì khác lắm với những người tiền nhiệm còn lại. Tuy không mới nhưng đây vẫn là một thiết kế vượt thời gian và rất sang trọng.', 19990000, N'image/tb2.png', N'image/tb2.png', N'image/tb2_item1.jpg', N'Apple', N'ipad')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (15, 3, N'Huawei MediaPad', N'Về tổng thể, máy nổi bật với phần khung viền kim loại sang trọng, kết hợp màu sắc hiện đại cho cảm giác khá thanh lịch, nhẹ nhàng. Ngoài ra, với trọng lượng khá nhẹ cùng với 4 góc bo tròn giúp máy có trải nghiệm cầm nắm khá thoải mái. Sở hữu màn hình kích thước 10 inch không quá lớn, có thể nhét vừa một chiếc balo dạng nhỏ, Huawei MediaPad T3 10 (2017) Spen sử dụng tấm nền PLS LCD cho khả năng hiển thị tốt.', 4490000, N'image/tb3.png', N'image/tb3.png', N'image/tb3_item1.jpg', N'Huawei', N'ipad')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (16, 3, N'Lenovo Phab2', N'Lenovo Phab 2 lại có kích thước khá nặng cho người dùng cảm giác cầm nắm chắc chắn và cứng cáp. Máy được thiết kế từ nhôm, mặt lưng được bo cong về các cạnh cho máy ôm tay hơn khi sử dụng. Về phần màn hình khi máy sở hữu kích thước khá lớn 6.4 inch cùng độ phân giải 1280 x 720 pixels trên tấm nền IPS cho hình ảnh rõ nét.', 3990000, N'image/tb4.png', N'image/tb4.png', N'image/tb4_item1.jpg', N'Lenovo', N'ipad')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (17, 4, N'Apple Macbook Pro', N'Touch Bar sẽ thay thế các phím chức năng ở hàng đầu của bàn phím. Có thể xem đây là một màn hình thứ 2 của chiếc MacBook, nó hiển thị các hình ảnh với chất lượng cao hoặc các nút chức năng, công cụ tùy chỉnh tuỳ theo ứng dụng bạn đang dùng.', 44990000, N'image/lt1.png', N'image/lt1.png', N'image/lt1_item1.jpg', N'Apple', N'laptop')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (18, 4, N'Acer PREDATOR 21X', N'Acer PREDATOR 21 X là sản phẩm cực kỳ cao cấp và là laptop mạnh nhất thế giới ở thời điểm hiện tại với những trang thiết bị tối tân đặc cách cho "Game Thủ". Máy có cấu hình cực mạnh bao gồm CPU i7 thế hệ 7 7820HK, RAM 64 GB, ổ cứng 2 TB và đặc biệt là vũ khí hạng nặng 2 card đồ họa rời NVIDIA GeForce GTX 1080 với dung lượng 16 GB.', 229000000, N'image/lt2.png', N'image/lt2.png', N'image/lt2_item6.jpg', N'Acer', N'laptop')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (19, 4, N'Laptop Asus A541UA', N'Việc sử dụng chip Intel Core i3 6006U giúp máy hoạt động ổn định, khả năng xử lý tác vụ khá mượt mà. Kèm theo RAM DDR4 4 GB và ổ cứng HDD 1 TB rất phù hợp với sinh viên khi thường làm bài thuyết trình, người làm văn phòng hay nhập liệu và lưu dữ liệu thoải mái hơn.', 10790000, N'image/lt3.png', N'image/lt3.png', N'image/lt3_item1.png', N'Asus', N'laptop')
INSERT [dbo].[SANPHAM] ([MaSanPham], [MaLoai], [TenSanPham], [MoTa], [Gia], [HinhAnh], [HinhCT1], [HinhCT2], [HangSanXuat], [KeyWord]) VALUES (20, 4, N'Laptop HP Pavilion 14', N'Mẫu laptop HP Core i3 sử dụng chip thế hệ thứ 7 mang lại hiệu năng hoạt động khá ổn định và có thể chơi các tựa game online khá ổn. Tiếp đó là RAM DDR4 4 GB hiệu quả và có hiệu suất hoạt động ổn định, cùng ổ cứng HDD 1 TB có thể lưu trữ nhiều dữ liệu cá nhân.', 12990000, N'image/lt4.png', N'image/lt4.png', N'image/lt4_item4.png', N'HP', N'laptop')



INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [TrangThai]) VALUES (1, N'Điện thoại', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [TrangThai]) VALUES (2, N'Phụ kiện', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [TrangThai]) VALUES (3, N'Tablet', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [TrangThai]) VALUES (4, N'Laptop', 1)


INSERT TAIKHOAN(TenDangNhap,MatKhau,Email,HoTen,NgaySinh,SDT,DiaChi,AnhDaiDien) VALUES (N'admin',123456,N'chivinh1998@gmail.com',N'Lâm Chí Vĩnh',N'10/10/1998',01269652731,N'123/45/678 aikejwuoaade','image/tokuda.png')
INSERT TAIKHOAN(TenDangNhap,MatKhau,Email,HoTen,NgaySinh,SDT,DiaChi,AnhDaiDien) VALUES (N'asd',789,N'chivinh1998@gmail.com',N'Lâm Chí Vĩnh',N'10/10/1998',01269652735,N'124/45/678 aikejsakndbqqade','image/bg.png')
INSERT TAIKHOAN(TenDangNhap,MatKhau,Email,HoTen,NgaySinh,SDT,DiaChi,AnhDaiDien) VALUES (N'asdf',741,N'chivinh1998@gmail.com',N'Lâm Chí Vĩnh',N'10/10/1998',01269652736,N'126/45/678 aikwqeqwfasfaade','image/dn.png')


--storeproc-dangnhap
CREATE PROCEDURE DangNhap_SP
(
	@TenDangNhap nvarchar(50),
	@MatKhau nvarchar(20),
	@AnhDaiDien nvarchar(max)
)
AS
	SELECT *
	FROM TAIKHOAN
	WHERE TenDangNhap=@TenDangNhap and MatKhau=@MatKhau


--storeproc-login
CREATE PROC st_login
	@TenDangNhap nvarchar(50),
	@MatKhau nvarchar(20)
AS 
BEGIN
Declare @MaTaiKhoan int;
set @MaTaiKhoan=(SELECT MaTaiKhoan FROM TAIKHOAN WHERE TenDangNhap=@TenDangNhap and MatKhau=@MatKhau)
	IF(ISNULL(@MaTaiKhoan,0)>0)
		Return @MaTaiKhoan;
	else
		Return -1;
END

--storeproc-search
CREATE PROC Search
(
	@MaLoai int
)
AS
SELECT SANPHAM.MaLoai,TenSanPham,Gia,HinhAnh 
FROM SANPHAM, LOAISANPHAM 
WHERE SANPHAM.MaLoai=LOAISANPHAM.MaLoai and LOAISANPHAM.MaLoai=@MaLoai

--storeproc-layinfo


CREATE PROCEDURE store_laythongtin
	@MaTaiKhoan int
AS
BEGIN
	
	SELECT * FROM TAIKHOAN WHERE MaTaiKhoan=@MaTaiKhoan
END
GO

--storeproc-doimk

CREATE PROCEDURE store_doimk
	@MaTaiKhoan int,
	@MatKhau nvarchar(20),
	@MatKhauNew nvarchar(20)
AS
BEGIN
	Declare @pass nvarchar(20)
	set @pass=(SELECT MatKhau FROM TAIKHOAN WHERE MaTaiKhoan=@MaTaiKhoan )
	if(@pass=@MatKhau)
	begin
		update TAIKHOAN set MatKhau=@MatKhauNew WHERE MaTaiKhoan=@MaTaiKhoan;
		RETURN @@Rowcount
	end
	else
	Return -1;
END
GO


