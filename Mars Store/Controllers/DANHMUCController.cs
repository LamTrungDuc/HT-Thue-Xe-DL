using Mars_Store.fonts.Models.Function;
using Mars_Store.Models.Function;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Controllers
{
    public class DANHMUCController : Controller
    {
        //
        // GET: /DANHMUC/
        public ActionResult HSX()
        {
            var dm = new DANHMUCFunction.DanhMucFunction().DANHMUCs
              .Where(p => p.tendanhmuc != null);
            return PartialView(dm);
        }
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult DMSP()
        {
            var dm = new DANHMUCFunction.DanhMucFunction().DANHMUCs
              .Where(p => p.tendanhmuc != null);
            return PartialView(dm);
        }
        public ActionResult DMTinTuc()
        {
            var model = new DANHMUCFunction.DanhMucFunction().DMTinTuc();
            var query = model.OrderByDescending(p => p.ID_NHOM);
            return PartialView(query.ToList());
        }
	}
}