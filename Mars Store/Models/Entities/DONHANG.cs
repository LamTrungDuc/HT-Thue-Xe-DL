namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DONHANG")]
    public partial class DONHANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DONHANG()
        {
            CTDONHANGs = new HashSet<CTDONHANG>();
        }

        [Key]
        public int ID_DH { get; set; }

        public int? ID_TK { get; set; }

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
        public string phone { get; set; }

        public bool? trangthai { get; set; }

        [StringLength(250)]
        public string hotenkh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDONHANG> CTDONHANGs { get; set; }

        public virtual TAIKHOAN TAIKHOAN { get; set; }

        public virtual TINTUC TINTUC { get; set; }
    }
}
