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
    public partial class Default : System.Web.UI.Page
    {
        List<SPDTO> LayDanhSachSanPham()
        {
            List<SPDTO> result = new List<SPDTO>();

            //chuỗi kết nối lấy từ cửa sổ Server Explorer
            string connectionString = @"Data Source=DESKTOP-N2BFS69\SQLEXPRESS;Initial Catalog=qlda;Integrated Security=True";
            //tạo kết nối tới csdl
            SqlConnection connection = new SqlConnection(connectionString);

            //tạo câu truy vấn csdl
            string sql = "SELECT * FROM [QLDA].[dbo].[SANPHAM]";
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
                SPDTO sp = new SPDTO();
                //đọc các cột trong kết quả vào biến sp
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
                //thêm biến sp vào danh sách kết quả
                result.Add(sp);
            }
            //đóng kết nối
            connection.Close();
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = LayDanhSachSanPham();
            Repeater1.DataBind();
            if (Session["username"] != null)
            {
                Label1.Text=Session["username"].ToString();
            }
        }
    }

}