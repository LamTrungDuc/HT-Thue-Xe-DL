using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Controllers
{
    public class AttackController : Controller
    {
        //
        // GET: /Attack/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Attack()
        {
            return View();
        }
        //
        // GET: /Attack/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Attack/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Attack/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Attack/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Attack/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Attack/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Attack/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
