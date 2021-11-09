using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTO
{
    public class TAIKHOANDTO
    {
        public int MaTaiKhoan { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public string HoTen { get; set; }
        public DateTime NgaySinh { get; set; }
        public int SDT { get; set; }
        public string DiaChi { get; set; }
        public string AnhDaiDien { get; set; }
    }
}