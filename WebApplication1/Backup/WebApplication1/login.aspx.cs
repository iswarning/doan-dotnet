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
    public partial class login : System.Web.UI.Page
    {
        TAIKHOANDTO sp = new TAIKHOANDTO();
        TAIKHOANDTO KiemTraDangNhap(string tenDangNhap, string matKhau)
        {
            TAIKHOANDTO result = null;

            //chuỗi kết nối lấy từ cửa sổ Server Explorer
            string connectionS = @"Data Source=.\SQLEXPRESS;Initial Catalog=QLDA;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionS);
            string sql = "SELECT * FROM TAIKHOAN WHERE TenDangNhap='" + tenDangNhap + "' AND MatKhau='" + matKhau + "'";
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                sp.MaTaiKhoan = reader.GetInt32(0);
                sp.TenDangNhap = reader.GetString(1);
                sp.MatKhau = reader.GetString(2);
                sp.Email = reader.GetString(3);
                sp.HoTen = reader.GetString(4);
                sp.NgaySinh = reader.GetDateTime(5);
                if (!reader.IsDBNull(6))
                {
                    sp.SDT = reader.GetInt32(6);
                }

                sp.DiaChi = reader.GetString(7);
                sp.AnhDaiDien = reader.GetString(8);
                result=sp;
            }
            connection.Close();
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string tenDangNhap = TextBox1.Text;
            string matKhau = TextBox2.Text;
            TAIKHOANDTO lstTaiKhoan = KiemTraDangNhap(tenDangNhap, matKhau);
            if (lstTaiKhoan.Count > 0)
            {
                //dang nhap thanh cong                
                Session["username"] = true;
                Response.Redirect("Default.aspx");
            }
            else
            {
                //Dang nhap that bai
                Session["username"] = false;
                Response.Write("<script>alert('Dang nhap that bai')</script>");
            }
        }
    }
}