using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using System.Data;
using System.Data.SqlClient;
namespace WebApplication1
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        SPDTO sp = new SPDTO();
        SPDTO LaySanPhamTheoMa(int MaSanPham)
        {
            SPDTO result = new SPDTO();

            //chuỗi kết nối lấy từ cửa sổ Server Explorer
            string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=QLDA;Integrated Security=True";
            //tạo kết nối tới csdl
            SqlConnection connection = new SqlConnection(connectionString);

            //tạo câu truy vấn csdl
            string sql = "SELECT * FROM [QLDA].[dbo].[SANPHAM] WHERE MaSanPham = " + MaSanPham.ToString();
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
                sp.HinhCT1 = reader.GetString(6);
                sp.HinhCT2 = reader.GetString(7);
                //thêm biến sp vào danh sách kết quả
                result = sp;
            }
            //đóng kết nối
            connection.Close();
            return result;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["MaSanPham"] == null)
            {
                //ẩn panel thông tin sản phẩm
                pnlThongTin.Visible = false;
                //hiện panel thông báo lỗi
                pnlLoi.Visible = true;
                return;

            }
            //Kiểm tra có lấy được mã sản phẩm có phải là số không
            int MaSanPham;
            if (!int.TryParse(Request.QueryString["MaSanPham"], out MaSanPham))
            {
                //ẩn panel thông tin sản phẩm
                pnlThongTin.Visible = false;
                //hiện panel thông báo lỗi
                pnlLoi.Visible = true;
                return;
            }
            //hiện panel thông tin sản phẩm
            pnlThongTin.Visible = true;
            //ẫn panel thông báo lỗi
            pnlLoi.Visible = false;
            SPDTO sp = LaySanPhamTheoMa(MaSanPham);
            imgsp.ImageUrl = sp.HinhAnh;
            imgsp1.ImageUrl = sp.HinhCT1;
            imgsp2.ImageUrl = sp.HinhCT2;

            tensp.Text = sp.TenSanPham;
            gia.Text = sp.Gia.ToString("0,0 đ");
            mota.Text = sp.MoTa;
        }
        protected void btnmua_Click(object sender, EventArgs e)
        {
            if (Session["giohang"] == null)
            {
                Session["giohang"] = new Dictionary<int, giohangDTO>();
            }
            Dictionary<int, giohangDTO> giohang = (Dictionary<int, giohangDTO>)Session["giohang"];
            if (giohang.ContainsKey(sp.MaSanPham))
            {
                giohang[sp.MaSanPham].SoLuong += int.Parse(txtsoluong.Text);
            }
            else
            {
                giohangDTO dto = new giohangDTO();
                dto.MaSanPham = sp.MaSanPham;
                dto.TenSanPham = sp.TenSanPham;
                dto.Gia = sp.Gia;
                dto.SoLuong = int.Parse(txtsoluong.Text);
                dto.HinhAnh = sp.HinhAnh;
                giohang.Add(sp.MaSanPham, dto);
            }
        }
    }
}