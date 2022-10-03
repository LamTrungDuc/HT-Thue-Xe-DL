using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mars_Store.ViewModels
{
    public class tblSanPhamViewModel
    {
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
        [Required]
        [StringLength(50)]
        public string username { get; set; }
        [Required]
        [StringLength(50)]
        public string password { get; set; }
        [Required]
        [StringLength(50)]
        public string tentk { get; set; }
        [Required]
        [StringLength(16)]
        public string phone { get; set; }
        [Required]
        [StringLength(50)]
        public string mail { get; set; }
        [Required]
        [StringLength(200)]
        public string diachi { get; set; }
        [Key]
        public int ID_BL { get; set; }
        public int ID_TK { get; set; }
        public IEnumerable<tblBinhLuanViewModel> BinhLuan { get; set; }
        [Key]
        public int ID_KM { get; set; }
        public int soluong { get; set; }
        public int giaht { get; set; }
        [Column(TypeName = "date")]
        public DateTime ngayban { get; set; }
    }
}