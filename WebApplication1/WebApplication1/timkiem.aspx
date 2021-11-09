<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="WebApplication1.timkiem1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <br/><br/><br/><br/>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
    <asp:Panel ID="pnlThongTin" runat="server">
        <div class="container dienthoai" style="margin-bottom:300px">  
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
    </asp:Panel>
    <asp:Panel ID="pnlLoi" runat="server">
        <asp:Label ID="lblloi" runat="server" Text=""></asp:Label>
    </asp:Panel>
</asp:Content>
