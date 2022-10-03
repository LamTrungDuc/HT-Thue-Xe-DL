namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SANPHAM")]
    public partial class SANPHAM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SANPHAM()
        {
            BINHLUANs = new HashSet<BINHLUAN>();
            CTDONHANGs = new HashSet<CTDONHANG>();
            SPGIAMGIAs = new HashSet<SPGIAMGIA>();
        }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BINHLUAN> BINHLUANs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDONHANG> CTDONHANGs { get; set; }

        public virtual DANHMUC DANHMUC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SPGIAMGIA> SPGIAMGIAs { get; set; }
    }
}
