namespace Mars_Store.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyDB : DbContext
    {
        public MyDB()
            : base("name=MyDB")
        {
        }

        public virtual DbSet<BINHLUAN> BINHLUANs { get; set; }
        public virtual DbSet<CTDONHANG> CTDONHANGs { get; set; }
        public virtual DbSet<DANHMUC> DANHMUCs { get; set; }
        public virtual DbSet<DONHANG> DONHANGs { get; set; }
        public virtual DbSet<KHOANGGIA> KHOANGGIAs { get; set; }
        public virtual DbSet<NHOMTIN> NHOMTINs { get; set; }
        public virtual DbSet<PHANQUYEN> PHANQUYENs { get; set; }
        public virtual DbSet<QUYEN> QUYENs { get; set; }
        public virtual DbSet<SANPHAM> SANPHAMs { get; set; }
        public virtual DbSet<SPGIAMGIA> SPGIAMGIAs { get; set; }
        public virtual DbSet<TAIKHOAN> TAIKHOANs { get; set; }
        public virtual DbSet<TINTUC> TINTUCs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DANHMUC>()
                .HasMany(e => e.SANPHAMs)
                .WithRequired(e => e.DANHMUC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DONHANG>()
                .Property(e => e.phone)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PHANQUYEN>()
                .Property(e => e.TENQUYEN)
                .IsUnicode(false);

            modelBuilder.Entity<PHANQUYEN>()
                .HasMany(e => e.QUYENs)
                .WithRequired(e => e.PHANQUYEN)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QUYEN>()
                .Property(e => e.TENQUYEN)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.trongluong)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.memory)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.hedieuhanh)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.cpuz)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .Property(e => e.battery)
                .IsUnicode(false);

            modelBuilder.Entity<SANPHAM>()
                .HasMany(e => e.BINHLUANs)
                .WithRequired(e => e.SANPHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SANPHAM>()
                .HasMany(e => e.CTDONHANGs)
                .WithRequired(e => e.SANPHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SANPHAM>()
                .HasMany(e => e.SPGIAMGIAs)
                .WithRequired(e => e.SANPHAM)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.phone)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.mail)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .HasMany(e => e.BINHLUANs)
                .WithRequired(e => e.TAIKHOAN)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TAIKHOAN>()
                .HasMany(e => e.PHANQUYENs)
                .WithRequired(e => e.TAIKHOAN)
                .WillCascadeOnDelete(false);
        }
    }
}
