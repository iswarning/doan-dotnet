<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="giohang.aspx.cs" Inherits="WebApplication1.giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="divgiohang">
       <asp:Label ID="lblgiohang" runat="server" Text=""></asp:Label>
        <asp:DataList ID="DataList1" runat="server" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" Width="700px">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <ItemTemplate>
                <img src="<%#Eval("HinhAnh") %>" height="100px" width="50px"/>
                <label><%#Eval("TenSanPham") %></label>
                <label><%#Eval("Gia") %></label>
                <label><%#Eval("SoLuong") %></label>
                <label><%#(int)Eval("SoLuong") * (double)Eval("Gia") %></label>
                <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" />
                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("MaSanPham") %>' />                
            </ItemTemplate> 
            <EditItemTemplate>
                <img src="<%#Eval("HinhAnh") %>" height="100px" width="50px"/>
                <label><%#Eval("TenSanPham") %></label>
                <label><%#Eval("Gia") %></label>
                <asp:TextBox ID="txtsoluong" runat="server" Text='<%#Eval("SoLuong") %>' Width="100px"></asp:TextBox>
                <label><%#(int)Eval("SoLuong") * (double)Eval("Gia") %></label>
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("MaSanPham") %>' />
            </EditItemTemplate>
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        </asp:DataList>       
    </div>
</asp:Content>
