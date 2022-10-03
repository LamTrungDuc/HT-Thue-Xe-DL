using Mars_Store.Models.Entities;
using Mars_Store.Models.Function;
using Mars_Store.ModBM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Areas.Admin.Controllers
{
    [CustomAuthorize(Roles = "Admin")]
    public class DANHMUCADMINController : Controller
    {
        //
        // GET: /Admin/DANHMUCADMIN/
        public ActionResult Index()
        {
            var dm = new DANHMUCFunction.DanhMucFunction().DANHMUCs
                 .Where(p => p.tendanhmuc != null);
            return View(dm);
        }

        //
        // GET: /Admin/DANHMUCADMIN/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/DANHMUCADMIN/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/DANHMUCADMIN/Create
        [HttpPost]
        public ActionResult Create(DANHMUC model)
        {
            try
            {
                // TODO: Add insert logic here
                var result = new DANHMUCFunction.DanhMucFunction().Insert(model);
                if (result == 0)
                {
                    return View();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/DANHMUCADMIN/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/DANHMUCADMIN/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, DANHMUC model)
        {
            try
            {
                model.ID_DM = id;
                var result = new DANHMUCFunction.DanhMucFunction().Update(model);
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

        //
        // GET: /Admin/DANHMUCADMIN/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/DANHMUCADMIN/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, DANHMUC model)
        {
            try
            {
                model.ID_DM = id;
                var result = new DANHMUCFunction.DanhMucFunction().Delete(model);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
