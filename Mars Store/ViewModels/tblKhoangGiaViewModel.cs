using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Mars_Store.ViewModels
{
    public class tblKhoangGiaViewModel
    {
        [Key]
        public int IDKG { get; set; }

        public int cantren { get; set; }

        public int canduoi { get; set; }

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
    }
}