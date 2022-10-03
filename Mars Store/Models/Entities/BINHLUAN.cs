namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BINHLUAN")]
    public partial class BINHLUAN
    {
        [Key]
        public int ID_BL { get; set; }

        public int ID_SP { get; set; }

        public int ID_TK { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngaybinhluan { get; set; }

        [Required]
        public string noidung { get; set; }

        public virtual SANPHAM SANPHAM { get; set; }

        public virtual TAIKHOAN TAIKHOAN { get; set; }
    }
}
