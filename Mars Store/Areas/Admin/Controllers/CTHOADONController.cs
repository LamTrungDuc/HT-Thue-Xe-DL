using Mars_Store.fonts.Models.Function;
using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Areas.Admin.Controllers
{
    public class CTHOADONController : Controller
    {
        //
        // GET: /Admin/CTHOADON/
        public ActionResult Index()
        {
            var dm = new CTDONHANGFunction.CTDonHangFunction().CTDONHANGs
               .Where(p => p.ID_CTDH != null);
            return PartialView(dm);
        }

        public ActionResult Edit(int id)
        {
            var model = new CTDONHANGFunction.CTDonHangFunction().FindEntity(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, CTDONHANG model)
        {
            try
            {
                model.ID_CTDH = id;
                var result = new CTDONHANGFunction.CTDonHangFunction().Update(model);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
	}
}