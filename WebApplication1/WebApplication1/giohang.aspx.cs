using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
namespace WebApplication1
{
    public partial class giohang : System.Web.UI.Page
    {
        public void hienthigiohang()
        {

            if (Session["giohang"] != null)
            {
                Dictionary<int, giohangDTO> giohang = (Dictionary<int, giohangDTO>)Session["giohang"];
                DataList1.DataSource = giohang.Values;
                DataList1.DataBind();
            }
            else
            {
                lblgiohang.Text = "There are nothing here";
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthigiohang();
            }
            ((Primary)Master).hienthisoluong();
        }
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            hienthigiohang();
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int MaSanPham = int.Parse(e.CommandArgument.ToString());
            Dictionary<int, giohangDTO> giohang = (Dictionary<int, giohangDTO>)Session["giohang"];
            giohang.Remove(MaSanPham);
            hienthigiohang();
            ((Primary)Master).hienthisoluong();
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            hienthigiohang();
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            int MaSanPham = int.Parse(e.CommandArgument.ToString());
            Dictionary<int, giohangDTO> giohang = (Dictionary<int, giohangDTO>)Session["giohang"];
            TextBox txtsoluong = (TextBox)e.Item.FindControl("txtsoluong");
            int SoLuongMoi = int.Parse(txtsoluong.Text);
            giohang[MaSanPham].SoLuong = SoLuongMoi;
            DataList1.EditItemIndex = -1;
            hienthigiohang();
            ((Primary)Master).hienthisoluong();
        }
    }
}