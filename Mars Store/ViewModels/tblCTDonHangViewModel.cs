using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mars_Store.ViewModels
{
    public class tblCTDonHangViewModel
    {
        [Key]
        public int ID_TK { get; set; }
        [RegularExpression(@"^[A-Za-z][A-Za-z0-9]*$", ErrorMessage = "Tên tài khoản không chứa kí tự đặc biệt")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên tài khoản muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string username { get; set; }
        
        [Required(ErrorMessage = "Vui lòng nhập vào mật khẩu muốn đăng ký")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string password { get; set; }
        [RegularExpression(@"^[A-Za-z][A-Za-z0-9]*$", ErrorMessage = "Tên người dùng không chứa kí tự đặc biệt")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên người dùng muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string tentk { get; set; }
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "Số điện thoại chỉ chứa số")]
        [Required(ErrorMessage = "Vui lòng nhập vào số điện thoại muốn đăng kí")]
        [StringLength(16, MinimumLength = 8, ErrorMessage = "Vui lòng nhập vào đúng số điện thoại")]
        public string phone { get; set; }
        
        [Required(ErrorMessage = "Vui lòng nhập vào tên Mail muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào đúng mail xxx@xmail.com ...")]
        public string mail { get; set; }
        [RegularExpression(@"^[A-Za-z][A-Za-z0-9]*$", ErrorMessage = "Địa chỉ không chứa kí tự đặc biệt")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên địa chỉ muốn đăng kí")]
        [StringLength(200, MinimumLength = 15, ErrorMessage = "Vui lòng nhập vào địa chỉ cụ thể")]
        public string diachi { get; set; }
        [Key]
        public int ID_DH { get; set; }
        public int? ID_TIN { get; set; }
        [Column(TypeName = "date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime ngaylap { get; set; }
        [Column(TypeName = "date")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime ngaynhanhang { get; set; }
        [StringLength(200)]
        public string diachigiaohang { get; set; }
        [StringLength(16)]
        public bool? trangthai { get; set; }
        [StringLength(250)]
        public string hotenkh { get; set; }
        [Key]
        public int ID_CTDH { get; set; }
        public int soluong { get; set; }
        public int dongia { get; set; }
        [Key]
        public int ID_SP { get; set; }
        public int ID_DM { get; set; }
        [Required]
        public string tensanpham { get; set; }
        public int giabd { get; set; }
        [Required]
        [StringLength(250)]
        public string trongluong { get; set; }
        [Required]
        [StringLength(30)]
        public string mausac { get; set; }
        [Required]
        [StringLength(250)]
        public string ImgLink { get; set; }
        [Required]
        [StringLength(250)]
        public string memory { get; set; }
        [Required]
        [StringLength(250)]
        public string hedieuhanh { get; set; }
        [Required]
        [StringLength(100)]
        public string vga { get; set; }
        [Required]
        [StringLength(250)]
        public string cpuz { get; set; }
        [Required]
        [StringLength(250)]
        public string battery { get; set; }
        [StringLength(100)]
        public string phukiendikem { get; set; }
        [Required]
        [StringLength(250)]
        public string chedobaohanh { get; set; }
        [Key]
        public int ID_BL { get; set; }
        [Column(TypeName = "date")]
        public DateTime ngaybinhluan { get; set; }
        [Required]
        public string noidung { get; set; }

    }
}