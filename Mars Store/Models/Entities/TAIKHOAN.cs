namespace Mars_Store.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TAIKHOAN")]
    public partial class TAIKHOAN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TAIKHOAN()
        {
            BINHLUANs = new HashSet<BINHLUAN>();
            DONHANGs = new HashSet<DONHANG>();
            PHANQUYENs = new HashSet<PHANQUYEN>();
        }

        [Key]
        public int ID_TK { get; set; }
        [RegularExpression(@"^[A-Za-z][A-Za-z0-9]*$", ErrorMessage = "Tên tài khoản không chứa kí tự đặc biệt")]
        [Required(ErrorMessage = "Vui lòng nhập vào tên tài khoản muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string username { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập vào mật khẩu muốn đăng ký")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string password { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập vào tên người dùng muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào ít nhất 5 kí tự")]
        public string tentk { get; set; }
        [RegularExpression(@"^[0-9]*$", ErrorMessage = "Số điện thoại chỉ chứa số")]
        [Required(ErrorMessage = "Vui lòng nhập vào số điện thoại muốn đăng kí")]
        [StringLength(16, MinimumLength = 8, ErrorMessage = "Vui lòng nhập vào đúng số điện thoại")]
        public string phone { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập vào tên Mail muốn đăng kí")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "Vui lòng nhập vào đúng mail xxx@xmail.com ...")]
        public string mail { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập vào tên địa chỉ muốn đăng kí")]
        [StringLength(200, MinimumLength = 15, ErrorMessage = "Vui lòng nhập vào địa chỉ cụ thể")]
        public string diachi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BINHLUAN> BINHLUANs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DONHANG> DONHANGs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PHANQUYEN> PHANQUYENs { get; set; }
    }
}
