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
    public partial class timkiem1 : System.Web.UI.Page
    {
        List<SPDTO> TimKiemKeyWord(string KeyWord)
        {
            List<SPDTO> result = new List<SPDTO>();

            //chuỗi kết nối lấy từ cửa sổ Server Explorer
            string connectionS = @"Data Source=.\SQLEXPRESS;Initial Catalog=QLDA;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionS);
            string sql = "SELECT * FROM SANPHAM WHERE KeyWord like '%" + KeyWord + "%'";
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                SPDTO sp = new SPDTO();
                sp.MaSanPham = reader.GetInt32(0);
                sp.MaLoai = reader.GetInt32(1);
                sp.TenSanPham = reader.GetString(2);
                //Đối với các cột có thể null thì phải kiểm tra trước khi đọc
                if (!reader.IsDBNull(3))
                {
                    sp.MoTa = reader.GetString(3);
                }
                sp.Gia = reader.GetDouble(4);
                sp.HinhAnh = reader.GetString(5);
                sp.HinhCT1 = reader.GetString(6);
                sp.HinhCT2 = reader.GetString(7);
                //thêm biến sp vào danh sách kết quả
                result.Add(sp);
            }
            connection.Close();
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string KeyWord = TextBox1.Text;
            List<SPDTO> listseach = TimKiemKeyWord(KeyWord);
            if (listseach.Count > 0)
            {
                Repeater1.DataSource = TimKiemKeyWord(KeyWord);
                Repeater1.DataBind();
                pnlThongTin.Visible = true;
                pnlLoi.Visible = false;
            }
            else
            {
                lblloi.Text = "Không tìm thấy kết quả với " + TextBox1.Text;
                pnlLoi.Visible = true;
                pnlThongTin.Visible = false;
            }
        }

    }
}