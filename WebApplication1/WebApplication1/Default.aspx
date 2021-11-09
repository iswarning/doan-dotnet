<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin:0;padding:0;">
			<div class="row">
				<div class="col-md-8" style="padding-left:0">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<a  href="#"><img class="img-fluid" src="image/slideshow1.png" alt="slideshow1" /></a>
							</div>
							<div class="carousel-item">
								<a  href="#"><img class="img-fluid" src="image/slideshow2.png" alt="slideshow2" /></a>
							</div>
							<div class="carousel-item">
								<a  href="#"><img class="img-fluid" src="image/slideshow3.png" alt="slideshow3" /></a>
							</div>
							<div class="carousel-item">
								<a  href="#"><img class="img-fluid" src="image/slideshow4.png" alt="slideshow4" /></a>
							</div>
							<div class="carousel-item">
								<a  href="#"><img class="img-fluid" src="image/slideshow5.png" alt="slideshow5" /></a>
							</div>
							<div class="carousel-item">
								<a  href="#"><img class="img-fluid" src="image/slideshow6.png" alt="slideshow6" /></a>
							</div>
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a>
							<a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<h4><a href="#"> TIN CÔNG NGHỆ </a> </h4>
					<div class="media">
                        <a href="trangtintuc.html" style="font-size: 14px;">
                            <div class="media-left">
						        <img class="media-object img-responsive" src="image/tt1.png">
                            </div>
							<div class="media-body">
								<p>Smartphone Android One mới của Nokia xuất hiện,thiết kế giống Lumia.</p>
							</div>
						</a>
					</div>
					<a href="trangtintuc.html"><img class="img-fluid" src="image/tt2.png" style="margin-top: 10px"></a>
					
					<a href="trangtintuc.html"><img class="img-fluid" src="image/tt3.png"></a>
				</div>
			</div>
		</div>

		<div class="container dienthoai" style="margin-bottom:300px">
            <div style="margin-top: 10px;">
		        <div class="tab-header row">
                        <div class="tab-title col-md-12">
				            <h2>HÀNG NÓNG</h2>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
			        </div>
                </div>
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-md-3">
				    <a href="ProductDetail.aspx?MaSanPham=<%#Eval("MaSanPham") %>" class="gtco-item">
					<div class="fig">
						<div class="overplay">
						</div>	
						<img src="<%#Eval("HinhAnh") %>" style="width:250px;height:310px" class="img-fluid">
					</div>
					<div class="gtco-text">
						<h5><%#Eval("TenSanPham") %></h5>
						<p><%#Eval("Gia") %></p>
                        <span class="btn btn-warning">Xem chi tiết</span>
                        
				    </div>
				    </a>
			        </div>
                    </ItemTemplate>
                </asp:Repeater>
		    </div>
	    </div>		
</asp:Content>
