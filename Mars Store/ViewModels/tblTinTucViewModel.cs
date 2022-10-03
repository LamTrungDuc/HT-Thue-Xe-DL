using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Mars_Store.ViewModels
{
    public class tblTinTucViewModel
    {
        [Key]
        public int ID_TIN { get; set; }

        [Required]
        [StringLength(250)]
        public string tentin { get; set; }

        [Required]
        [StringLength(250)]
        public string ImgTin { get; set; }

        [Required]
        public string mota { get; set; }

        [Key]
        public int ID_NHOM { get; set; }

        [StringLength(250)]
        public string tennhomtin { get; set; }
    }
}