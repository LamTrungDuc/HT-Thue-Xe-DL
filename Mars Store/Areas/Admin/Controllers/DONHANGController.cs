using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mars_Store.Models.Entities;
using Mars_Store.Models.Function;
using Mars_Store.fonts.Models.Function;
using Mars_Store.ModBM;
namespace Mars_Store.Areas.Admin.Controllers
{
    [CustomAuthorize(Roles = "Admin")]
    public class DONHANGController : Controller
    {
        //
        // GET: /Admin/DONHANG/
        public ActionResult Index()
        {
            var dh = new DONHANGFunction.DonHangFunction().DONHANGs
             .Where(p => p.ID_DH != null).OrderBy(x => x.trangthai);
            return PartialView(dh);
        }

        [ChildActionOnly]
        public ActionResult SoDonHang()
        {
            var dh = new DONHANGFunction.DonHangFunction().DONHANGs
             .Where(p => p.trangthai == null).OrderBy(x => x.trangthai).ToList();
            ViewBag.SoDH = dh.Count();
            return PartialView(dh);
        }
        public ActionResult Details(int id)
        {
            var model = new DONHANGFunction.DonHangFunction().FindEntity(id);
            ViewBag.CTHD = new CTDONHANGFunction.CTDonHangFunction().CTDONHANGs.Where(x => x.ID_DH == id);
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            var model = new DONHANGFunction.DonHangFunction().FindEntity(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, DONHANG model)
        {
            try
            {
                model.ID_DH = id;
                var result = new DONHANGFunction.DonHangFunction().Update(model);
                //if (result == null)
                //{
                //    return View();
                //}
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(int id)
        {
            return View();
        }
        public ActionResult InHoaDon(int id)
        {
            var dathang = new DONHANGFunction.DonHangFunction().tblCTDonHang(id);
            return View(dathang);
        }
        [HttpPost]
        public ActionResult Delete(int id, DONHANG model)
        {
            try
            {
                model.ID_DH = id;
                var result = new DONHANGFunction.DonHangFunction().Delete(model);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
	}
}