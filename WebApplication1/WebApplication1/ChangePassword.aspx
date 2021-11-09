<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplication1.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 469px;
            text-align: left;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style5 {
            width: 203px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
<div class="auto-style1">
            <div class="auto-style3">
                <strong>Change Your Password</strong></div>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style5">Password:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">New Password:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Comfirm New Password:</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Change Password" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w{6,50}"></asp:RegularExpressionValidator>
</asp:Content>
