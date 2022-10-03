namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QUYEN")]
    public partial class QUYEN
    {
        [Key]
        [Column(Order = 0)]
        public int ID_QUYEN { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string TENQUYEN { get; set; }

        public virtual PHANQUYEN PHANQUYEN { get; set; }
    }
}
