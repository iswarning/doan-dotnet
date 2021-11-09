<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="WebApplication1.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">  
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" type="text/css" href="css/chitiet.css">
	<!-- jQuery library -->
	<script src="js/jquery-3.3.1.min.js"></script>

	<!-- Popper JS -->
	<script src="js/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="js/chitiet.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlThongTin" runat="server">
    <div class="container">
        <div class="row">
            
                <div class="col-md-5 border-right">
                <article>
                    <div class="img-big-wrap">
                        <div class="img-zoom-container">
                            <asp:Image ID="imgsp" runat="server" />
                        </div>
                    </div>
                    <div class="img-small-wrap">
                        <div class="img-gallery">
                            <asp:Image ID="imgsp1" runat="server" />
                        </div>
                        <div class="img-gallery">
                            <asp:Image ID="imgsp2" runat="server" />
                        </div>
                    </div>
                </article>

            </div>
                <div class="col-md-7" style="padding-left: 50px">
                <h3 class="product-title">
                    <asp:Label ID="tensp" runat="server" Text=""></asp:Label></h3>
                <p class="product-description">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <a href="#">99 đánh giá</a>
                    <br>
                    <asp:Label ID="mota" runat="server" Text=""></asp:Label>
                </p>
                <h4 class="price">Giá hiện tại: <span style="color:red;">
                    <asp:Label ID="gia" runat="server" Text=""></asp:Label></span></h4>
                <p class="vote">
                    2 KHUYẾN MÃI<br>
                    <i class="fa fa-check-circle"></i>Giảm ngay 1 triệu <br>
                    <i class="fa fa-check-circle"></i>Giảm ngay 1.500.000đ khi thanh toán Online bằng thẻ Mastercard (Từ 01/05 - 31/05)<br>
                    * Không áp dụng khi mua trả góp 0%
                </p>
                    <asp:TextBox ID="txtsoluong" runat="server" Width="100px"></asp:TextBox>
                    <asp:Button ID="btnmua" runat="server" Text="BUY NOW" OnClick="btnmua_Click" />                    
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
            </div>
            </div>
            </div>
            <div class="container">
                <hr width="100%" />
                <div class="row">
                    <div class="col-md-7">
                        <div class="col-md-12">
                            <h3>Giới thiệu sản phẩm</h3>
                        </div>
                        <div id="demo" class="carousel slide" data-ride="carousel">
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                                <li data-target="#demo" data-slide-to="3"></li>
                                <li data-target="#demo" data-slide-to="4"></li>
                                <li data-target="#demo" data-slide-to="5"></li>
                                <li data-target="#demo" data-slide-to="6"></li>
                                <li data-target="#demo" data-slide-to="7"></li>
                                <li data-target="#demo" data-slide-to="8"></li>
                            </ul>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="image/x1.png" alt="Los Angeles" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x2.png" alt="Chicago" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x3.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x4.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x5.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x6.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x7.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x8.png" alt="New York" width="100%" height="100%">
                                </div>
                                <div class="carousel-item">
                                    <img src="image/x9.png" alt="New York" width="100%" height="100%">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>

                        <div class="col-md-12">



                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-12">
                                <h3>Thông số kỹ thuật</h3>
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Màn hình:
                            </div>
                            <div class="col-sm-8">
                                OLED, 5.8", Super Retina
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Hệ điều hành:
                            </div>
                            <div class="col-sm-8">
                                iOS 11
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Camera sau:
                            </div>
                            <div class="col-sm-8">
                                2 camera 12 MP
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Camera trước:
                            </div>
                            <div class="col-sm-8">
                                7 MP
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                CPU:
                            </div>
                            <div class="col-sm-8">
                                Apple A11 Bionic 6 nhân
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                RAM:
                            </div>
                            <div class="col-sm-8">
                                3 GB
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Bộ nhớ trong:
                            </div>
                            <div class="col-sm-8">
                                256 GB
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Thẻ SIM:
                            </div>
                            <div class="col-sm-8">
                                1 Nano SIM, Hỗ trợ 4G
                            </div>
                            <hr width="90%" />
                            <div class="col-sm-4">
                                Dung lượng pin:
                            </div>
                            <div class="col-sm-8">
                                2716 mAh, có sạc nhanh
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr width="80%" />
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#menu1">Nhận xét</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#menu2">Danh sách bình luận</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#menu3">Đánh giá</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#menu4">Hỗ trợ khách hàng</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div id="menu1" class="container tab-pane active">
                                <br>
                                <form>
                                    <div class="form-group">
                                        <label for="comment"><h4>Comments:</h4></label>
                                        <textarea id="comment" class="form-control" rows="4" placeholder="Write a comment..."></textarea>
                                    </div>
                                </form>
                            </div>
                            <div id="menu2" class="container tab-pane fade">
                                <br>
                                <div class="media">
                                    <a href="#" class="pull-left">
                                        <img src="image/avt.png" class="media-photo img-circle" width="64px" height="64px">
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                                        <span class="media-meta pull-right">3 giờ trước</span>
                                        <h4 class="title">Tommy </h4>
                                        <p class="summary">
                                            This correct is a good product.</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <a href="#" class="pull-left">
                                        <img src="image/avt.png" class="media-photo img-circle" width="64px" height="64px">
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                                        <span class="media-meta pull-right">3 giờ trước</span>
                                        <h4 class="title">Donald </h4>
                                        <p class="summary">
                                            I really like this product.</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <a href="#" class="pull-left">
                                        <img src="image/avt.png" class="media-photo img-circle" width="64px" height="64px">
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                                        <span class="media-meta pull-right">3 giờ trước</span>
                                        <h4 class="title">Herry </h4>
                                        <p class="summary">
                                            I will buy one more like that.</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <a href="#" class="pull-left">
                                        <img src="image/avt.png" class="media-photo img-circle" width="64px" height="64px">
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="media-body">
                                        <span class="media-meta pull-right">3 giờ trước</span>
                                        <h4 class="title">Davil </h4>
                                        <p class="summary">
                                            I will buy one more like that.</p>
                                    </div>
                                </div>
                            </div>
                            <div id="menu3" class="container tab-pane text-center">
                                5 <i class="fas fa-star" style="color: black;font-size: 13px"></i><a href="#"> 37 đánh giá</a><br>
                                4 <i class="fas fa-star" style="color: black;font-size: 13px"></i><a href="#"> 7 đánh giá</a><br>
                                3 <i class="fas fa-star" style="color: black;font-size: 13px"></i><a href="#"> 4 đánh giá</a><br>
                                2 <i class="fas fa-star" style="color: black;font-size: 13px"></i><a href="#"> 1 đánh giá</a><br>
                                1 <i class="fas fa-star" style="color: black;font-size: 13px"></i><a href="#"> 0 đánh giá</a><br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <span class="rating">
                                                <input class="star star-5" id="star-5" type="radio" name="star" />
                                                <label class="star star-5" for="star-5"></label>
                                                <input class="star star-4" id="star-4" type="radio" name="star" />
                                                <label class="star star-4" for="star-4"></label>
                                                <input class="star star-3" id="star-3" type="radio" name="star" />
                                                <label class="star star-3" for="star-3"></label>
                                                <input class="star star-2" id="star-2" type="radio" name="star" />
                                                <label class="star star-2" for="star-2"></label>
                                                <input class="star star-1" id="star-1" type="radio" name="star" />
                                                <label class="star star-1" for="star-1"></label>
                                  
                                            <input type="button" value="Gửi đánh giá của bạn" class="btn btn-primary">
                                        </span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                </ul>
                            </div>
                            <div id="menu4" class="container tab-pane">
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 text-right">
                                        <label for="cd">Chủ đề:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <select id="cd">
                                            <option>Chọn chủ đề</option>
                                            <option>Tư vấn</option>
                                            <option>Khiếu nại - Phản ánh</option>
                                            <option>Góp ý cải tiến</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div><br>
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 text-right">
                                        <label for="td">Tiêu đề:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <input id="td" type="text" style="width: 100%">
                                    </div>
                                    <div class="col-md-3"></div>
                                </div><br>
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3 text-right">
                                        <label id="nd">Nội dung:</label>
                                    </div>
                                    <div class="col-md-3">
                                        <textarea placeholder=" Xin quý khách vui lòng mô tả chi tiết" style="width: 100%;height: 100px;font-size: 12px"></textarea>
                                    </div>
                                    <div class="col-md-3"></div>
                                </div><br>
                                <div class="row">
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6">
                                        <input type="button" class="btn btn-warning" value="GỬI LIÊN HỆ" style="width: 60%;margin-left: 200px;">
                                    </div>
                                    <div class="col-md-3"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
</asp:Panel>

<asp:Panel ID="pnlLoi" runat="server">
    Lỗi: không tìm thấy sản phẩm
</asp:Panel>
</asp:Content>
