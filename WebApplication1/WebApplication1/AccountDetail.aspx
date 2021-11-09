<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="AccountDetail.aspx.cs" Inherits="WebApplication1.AccountDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            width: 498px;
            text-align: right;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style7 {
            font-size: xx-large;
            color: #3366FF;
        }
        td
        {
            padding: 20px 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="auto-style1">
            <strong><span class="auto-style7">THÔNG TIN TÀI KHOẢN</span></strong><br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style5">Họ Tên: </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Tên đăng nhập:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="300px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Mật khẩu:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Width="300px" ReadOnly="True"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Email: </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Số điện thoại:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Ngày sinh:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Địa chỉ:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update" Width="115px" OnClick="Button1_Click" />
                    </td>
                    <td class="text-left">
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <p>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Ho ten invalid" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="SDT invalid" ValidationExpression="\d{9,12}"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Email invalid" ValidationExpression="[\w]*@gmail\.com"></asp:RegularExpressionValidator>
                    </p>
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
</asp:Content>
