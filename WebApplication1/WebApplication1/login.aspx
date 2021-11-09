<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<div class="divgiohang">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox><br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click"/>    
    </div>
</asp:Content>
