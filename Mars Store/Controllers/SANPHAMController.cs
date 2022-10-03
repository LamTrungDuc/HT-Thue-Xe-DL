using Mars_Store.Models.Entities;
using Mars_Store.Models.Function;
using System;
using PagedList;
using PagedList.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mars_Store.fonts.Models.Function;
using System.Threading.Tasks;
using Mars_Store.ViewModels;
using Mars_Store.Security;
using System.Diagnostics;
using System.Web.Routing;

namespace Mars_Store.Controllers
{
    public class SANPHAMController : Controller
    {
        private MyDB _database = new MyDB();
        public ActionResult AllProducer(string keyword, int? page)
        {
            int pageNumber = (page ?? 1);
            int itemsPerPage = 16;        

            var db = new SANPHAMFunction();

            var products = db.SANPHAMs.ToList();
            var pageSize = products.Count / itemsPerPage;

            var sp = products
                         .Where(p => p.ID_SP != null)
                         .OrderBy(p => p.tensanpham)
                         .ToList();

            if (!string.IsNullOrEmpty(keyword) && !string.IsNullOrWhiteSpace(keyword))
            {
                sp = sp.Where(p => !string.IsNullOrEmpty(p.tensanpham) && p.tensanpham.ToLower().Contains(keyword.ToLower()))
                    .ToList();
            }
            return View(sp.OrderBy(n => n.ID_SP).ToPagedList(pageNumber, itemsPerPage));
        }

        public ActionResult KhoangGia(string keyword, int? page, int? cantren, int? canduoi)
        {
            int pageNumber = (page ?? 1);
            int itemsPerPage = 12;
            int? ct = cantren;
            int? cd = canduoi;
            var db = new SANPHAMFunction();

            var products = db.SANPHAMs.ToList();
            var pageSize = products.Count / itemsPerPage;

            var sp = products
                         .Where(p => p.giabd > cd & p.giabd <= ct)
                         .OrderBy(p => p.tensanpham)
                         .ToList();

            if (!string.IsNullOrEmpty(keyword) && !string.IsNullOrWhiteSpace(keyword))
            {
                sp = sp.Where(p => !string.IsNullOrEmpty(p.tensanpham) && p.tensanpham.ToLower().Contains(keyword.ToLower()))
                    .ToList();
            }
            return View("AllProducer", sp.OrderBy(n => n.ID_SP).ToPagedList(pageNumber, itemsPerPage));
            
        }

        [HttpPost]
        public ActionResult Comment(FormCollection fr, int id)
        {
            try
            {
                BINHLUAN model = new BINHLUAN();
                model.ID_SP = id;
                model.noidung = fr["textbinhluan"];
                model.ID_TK = SessionPersister.UserName.ID_TK;
                model.ngaybinhluan = DateTime.Now;
                // TODO: Add insert logic here
                var result = new BINHLUANFunction.BinhLuanFunction().Insert(model);
                if (result == 0)
                {
                    return View();
                }
                return RedirectToAction("Details", new RouteValueDictionary( new { Controller = "SANPHAM", Action = "Details", id = id}));
            }
            catch (Exception ex)
            {
                return RedirectToAction("Details", new RouteValueDictionary(new { Controller = "SANPHAM", Action = "Details", id = id }));
            }
        }
        public ActionResult Details(int id)
        {
            var result = new SANPHAMFunction().FindSPById(id);
            return View(result);
        }
        public ActionResult SPKhuyenMai()
        {
            var model = new SANPHAMFunction().SPKhuyenMai();
            var query = model.OrderByDescending(p => p.ID_KM);
            return View(query.ToList());
        }

        public ActionResult ViewKhoangGia()
        {
            var dm = new KHOANGGIAFunction().KHOANGGIAs
              .Where(p => p.IDKG != null);
            return PartialView(dm);
        }
        public ActionResult ViewBL()
        {
            var model = new SANPHAMFunction().ViewBL();
            var query = model.OrderByDescending(p => p.username);
            return PartialView(query.ToList());
        }
        public ActionResult CTDonHangUser(int id)
        {
            var model = new DONHANGFunction.DonHangFunction().FindEntity(id);
            ViewBag.CTHD = new CTDONHANGFunction.CTDonHangFunction().CTDONHANGs.Where(x => x.ID_DH == id);
            return View(model);
            //var model = new SANPHAMFunction().ChiTietDonHangDangNhap();
            //var query = model.OrderByDescending(p => p.ID_DH);
            //return View(query.ToList());
        }

        public ActionResult FilterSPofDM(int? id)
        {
            var db = new SANPHAMFunction();
            MyDB context = new MyDB();
            DANHMUC dm = context.DANHMUCs.Find(id);
            if(dm != null)
            {
                ViewBag.TenDM = dm.tendanhmuc;
            }
            var sp = db.SANPHAMs.Where(p => p.ID_DM == id);
            return View(sp);
        }

        // [HttpPost]
        public ActionResult KQTimKiem(string txttimkiem, int? page)
        {
            var db = new SANPHAMFunction();
            var products = db.SANPHAMs.Where(p => string.IsNullOrEmpty(p.tensanpham) == false &&
                                                    p.tensanpham.ToLower().Contains(txttimkiem))
                                                    .ToList();
            return View();
        }

        public PartialViewResult SPOfDB(int id)
        {
            MyDB context = new MyDB();
            var sp = (from a in context.SANPHAMs
                      where (a.ID_SP == id)
                      select a).FirstOrDefault();
            var query = (from a in context.SANPHAMs
                         where (a.ID_DM == sp.ID_DM && a.ID_SP != sp.ID_SP)
                         select a).OrderByDescending(r => r.ID_SP).Take(4);
            return PartialView("SPOfDB", query);
        }

        public PartialViewResult SPOfNew()
        {
            var sp = new SANPHAMFunction().SPOfNew();
            return PartialView("SPOfNew", sp);
        }

	}
}