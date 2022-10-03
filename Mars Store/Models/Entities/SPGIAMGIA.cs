namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SPGIAMGIA")]
    public partial class SPGIAMGIA
    {
        [Key]
        public int ID_KM { get; set; }

        public int ID_SP { get; set; }

        public int soluong { get; set; }

        public int giaht { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayban { get; set; }

        public virtual SANPHAM SANPHAM { get; set; }
    }
}
