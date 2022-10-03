using Mars_Store.Models.Entities;
using Mars_Store.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.Models.Function
{
    public class SANPHAMFunction
    {
        private MyDB context;
        public SANPHAMFunction()
        {
            context = new MyDB();
        }

        public IQueryable<SANPHAM> SANPHAMs
        {
            get { return context.SANPHAMs; }
        }

        public IQueryable<SANPHAM> SPOfNew()
        {
            var spnew = context.SANPHAMs.OrderByDescending(p => p.ID_SP).Take(12);
            return spnew;
        }

        public SANPHAM FindEntity(int ID_SP)
        {
            SANPHAM dbEntry = context.SANPHAMs.Find(ID_SP);
            return dbEntry;
        }

        public List<tblSanPhamViewModel> SPKhuyenMai()
         {
             var model = (from a in context.SPGIAMGIAs
                          join b in context.SANPHAMs on a.ID_SP equals b.ID_SP
                          where (a.ID_SP != null)
                          select new tblSanPhamViewModel
                          {
                              ID_SP = a.ID_SP,
                              ID_DM = b.ID_DM,
                              tensanpham = b.tensanpham,
                              giabd = b.giabd,
                              trongluong = b.trongluong,
                              mausac = b.mausac,
                              ImgLink = b.ImgLink,
                              memory = b.memory,
                              hedieuhanh = b.hedieuhanh,
                              vga = b.vga,
                              cpuz = b.cpuz,
                              battery = b.battery,
                              phukiendikem = b.phukiendikem,
                              chedobaohanh = b.chedobaohanh,
                              ID_KM = a.ID_KM,
                              soluong = a.soluong,
                              giaht = a.giaht,
                              ngayban = a.ngayban
                          });
             return model.ToList<tblSanPhamViewModel>();
         }

        public List<tblSanPhamViewModel> ViewBL()
        {
             var model = (from a in context.TAIKHOANs
                         join c in context.BINHLUANs on a.ID_TK equals c.ID_TK
                         join b in context.SANPHAMs on c.ID_SP equals b.ID_SP
                         where (a.ID_TK != null)
                         select new tblSanPhamViewModel
                         {
                             ID_SP = b.ID_SP,
                             ID_DM = b.ID_DM,
                             tensanpham = b.tensanpham,
                             giabd = b.giabd,
                             trongluong = b.trongluong,
                             mausac = b.mausac,
                             ImgLink = b.ImgLink,
                             memory = b.memory,
                             hedieuhanh = b.hedieuhanh,
                             vga = b.vga,
                             cpuz = b.cpuz,
                             battery = b.battery,
                             phukiendikem = b.phukiendikem,
                             chedobaohanh = b.chedobaohanh,
                             //ngaybinhluan = c.ngaybinhluan,
                             username = a.username,
                             //noidung = c.noidung
                         });
            return model.ToList<tblSanPhamViewModel>();
        }

        public List<tblCTDonHangViewModel> ChiTietDonHangDangNhap()
        {
            var model = (from a in context.TAIKHOANs
                         join b in context.DONHANGs on a.ID_TK equals b.ID_TK
                         join c in context.CTDONHANGs on b.ID_DH equals c.ID_DH
                         join d in context.SANPHAMs on c.ID_SP equals d.ID_SP
                         where (a.ID_TK != null)
                         select new tblCTDonHangViewModel
                         {
                             username = a.username,
                             password = a.password,
                             tentk = a.tentk,
                             phone = a.phone,
                             mail = a.mail,
                             diachi = a.diachi,
                             ID_DH = b.ID_DH,
                             ID_TIN = b.ID_TIN,
                             ngaylap = b.ngaylap,
                             ngaynhanhang = b.ngaynhanhang,
                             diachigiaohang = b.diachigiaohang,
                             trangthai = b.trangthai,
                             hotenkh = b.hotenkh,
                             ID_CTDH = c.ID_CTDH,
                             ID_SP = c.ID_SP,
                             soluong = c.soluong,
                             dongia = c.dongia,
                             ID_DM = d.ID_DM,
                             tensanpham = d.tensanpham,
                             giabd = d.giabd,
                             trongluong = d.trongluong,
                             mausac = d.mausac,
                             ImgLink = d.ImgLink,
                             memory = d.memory,
                             hedieuhanh = d.hedieuhanh,
                             vga = d.vga,
                             cpuz = d.cpuz,
                             battery = d.cpuz,
                             phukiendikem = d.phukiendikem,
                             chedobaohanh = d.chedobaohanh
                         });
            return model.ToList<tblCTDonHangViewModel>();
        }

        public tblSanPhamViewModel FindSPById(int id)
        {
            var resultBN = (from a in context.SANPHAMs
                          join b in context.BINHLUANs on a.ID_SP equals b.ID_SP
                          join c in context.TAIKHOANs on b.ID_TK equals c.ID_TK
                          where a.ID_SP == id
                          select new tblBinhLuanViewModel {Username = c.username, Ngaybinhluan = b.ngaybinhluan, NoiDung = b.noidung }
                          );
            var resultSP = (from a in context .SANPHAMs
                                where a.ID_SP == id
                                select new tblSanPhamViewModel {  ID_SP = a.ID_SP,
                                                            tensanpham = a.tensanpham,
                                                            hedieuhanh = a.hedieuhanh,
                                                            battery=a.battery,
                                                            chedobaohanh = a.chedobaohanh,
                                                            cpuz = a.cpuz,
                                                            giabd = a.giabd,
                                                            mausac = a.mausac,
                                                            ImgLink = a.ImgLink,
                                                            memory = a.memory,
                                                            phukiendikem = a.phukiendikem,
                                                            trongluong = a.trongluong,
                                                            vga = a.vga}).FirstOrDefault();
            resultSP.BinhLuan = resultBN;
            return resultSP;
        }

        public int Insert(SANPHAM model)
        {
            SANPHAM dbEntry = context.SANPHAMs.Find(model.ID_SP);
            if (dbEntry != null)
            {
                return -1;

            }
            context.SANPHAMs.Add(model);
            context.SaveChanges();
            return model.ID_SP;
        }
        public int Update(SANPHAM model)
        {
            SANPHAM dbEntry = context.SANPHAMs.Find(model.ID_SP);
            if (dbEntry == null)
            {
                return -1;
            }
            dbEntry.ID_SP = model.ID_SP;
            dbEntry.ID_DM = model.ID_DM;
            dbEntry.tensanpham = model.tensanpham;
            dbEntry.giabd = model.giabd;
            dbEntry.trongluong = model.trongluong;
            dbEntry.mausac = model.mausac;
            dbEntry.ImgLink = model.ImgLink;
            dbEntry.memory = model.memory;
            dbEntry.hedieuhanh = model.hedieuhanh;
            dbEntry.vga = model.vga;
            dbEntry.cpuz = model.cpuz;
            dbEntry.battery = model.battery;
            dbEntry.phukiendikem = model.phukiendikem;
            dbEntry.chedobaohanh = model.chedobaohanh;

            context.SaveChanges();
            return model.ID_SP;
        }
        public int Delete(SANPHAM model)
        {
            SANPHAM dbEntry = context.SANPHAMs.Find(model.ID_SP);
            if (dbEntry != null)
            {
                context.SANPHAMs.Remove(dbEntry);
                context.SaveChanges();
            }
            return model.ID_SP;
        }
    }
}