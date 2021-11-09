using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using System.Data.SqlClient;
namespace WebApplication1
{
    public partial class Primary : System.Web.UI.MasterPage
    {
        TAIKHOANDTO sp = new TAIKHOANDTO();
        List<LOAISPDTO> LayDanhSachLoaiSanPham()
        {
            List<LOAISPDTO> result = new List<LOAISPDTO>();

            //chuỗi kết nối lấy từ cửa sổ Server Explorer
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=QLDA;Integrated Security=True";
            //tạo kết nối tới csdl
            SqlConnection connection = new SqlConnection(connectionString);

            //tạo câu truy vấn csdl
            string sql = "SELECT * FROM [QLDA].[dbo].[LOAISANPHAM]";
            SqlCommand command = new SqlCommand(sql, connection);

            //mở kết nối
            connection.Open();
            //chạy câu truy vấn
            //câu SELECT thì chạy lệnh ExecuteReader
            SqlDataReader reader = command.ExecuteReader();
            //đọc từ data reader
            while (reader.Read())
            {
                //tạo đối tượng SanPhamDTO để chứa dữ liệu 
                LOAISPDTO sp = new LOAISPDTO();
                //đọc các cột trong kết quả vào biến sp
                sp.MaLoai = reader.GetInt32(0);
                sp.TenLoai = reader.GetString(1);

                //thêm biến sp vào danh sách kết quả
                result.Add(sp);
            }
            //đóng kết nối
            connection.Close();
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = LayDanhSachLoaiSanPham();
            Repeater1.DataBind();

            if (Session["username"] != null)
            {
                TAIKHOANDTO tk = (TAIKHOANDTO)Session["username"];
                tk.AnhDaiDien = Image1.ImageUrl;
                tk.TenDangNhap = TextBox1.Text;
                pnlsignup.Visible = false;
                pnllogin.Visible = false;
                pnlavatar.Visible = true;
                pnlusername.Visible = true;
            }
            else
            {
                pnlsignup.Visible = true;
                pnllogin.Visible = true;
                pnlavatar.Visible = false;
                pnlusername.Visible = false;
            }
            hienthisoluong();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void xeminfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountDetail.aspx");
        }
        public void hienthisoluong()
        {
            /*int tongsoluong = 0;
            Dictionary<int, giohangDTO> giohang = (Dictionary<int, giohangDTO>)Session["giohang"];
            foreach (giohangDTO dto in giohang.Values)
            {
                tongsoluong += dto.SoLuong;
            }
            Label1.Text = tongsoluong.ToString();*/
        }
    }
}