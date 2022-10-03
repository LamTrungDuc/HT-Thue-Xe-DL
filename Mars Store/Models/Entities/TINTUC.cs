namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TINTUC")]
    public partial class TINTUC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TINTUC()
        {
            DONHANGs = new HashSet<DONHANG>();
        }

        [Key]
        public int ID_TIN { get; set; }

        public int? ID_NHOM { get; set; }

        [Required]
        [StringLength(250)]
        public string tentin { get; set; }

        [Required]
        [StringLength(250)]
        public string ImgTin { get; set; }

        [Required]
        public string mota { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DONHANG> DONHANGs { get; set; }

        public virtual NHOMTIN NHOMTIN { get; set; }
    }
}
