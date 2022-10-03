namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KHOANGGIA")]
    public partial class KHOANGGIA
    {
        [Key]
        public int IDKG { get; set; }

        public int cantren { get; set; }

        public int canduoi { get; set; }
    }
}
