using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTO
{
    public class SPDTO
    {
        public int MaSanPham { get; set; }
        public int MaLoai { get; set; }
        public string TenSanPham { get; set; }
        public string MoTa { get; set; }
        public double Gia { get; set; }
        public string HinhAnh { get; set; }
        public string HinhCT1 { get; set; }
        public string HinhCT2 { get; set; }
        public string KeyWord { get; set; }
    }
}