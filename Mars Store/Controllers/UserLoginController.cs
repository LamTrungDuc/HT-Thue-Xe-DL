using Mars_Store.fonts.Models.Function;
using Mars_Store.Models.Entities;
using Mars_Store.Models.Function;
using Mars_Store.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mars_Store.Controllers
{
    public class UserLoginController : Controller
    {
        //
        // GET: /UserLogin/
        //public ActionResult Index(Account model, string returnUrl)
        //{
        //    AccountModel am = new AccountModel();
        //    if (string.IsNullOrEmpty(model.UserName) || string.IsNullOrEmpty(model.Password)
        //        || am.Login(model.UserName, model.Password) == null)
        //    {
        //        return View("Index");
        //    }
        //    SessionPersister.UserName = model;
        //    return Redirect(returnUrl);
        //}
        public ActionResult Index()
        {            
            return View();
        }

        public ActionResult Sele()
        {
            return View();
        }
        
        public ActionResult Login(Account model, string returnUrl)
        {
            AccountModel am = new AccountModel();
            Account acc = am.Login(model.UserName, model.Password);
            if (string.IsNullOrEmpty(model.UserName) || string.IsNullOrEmpty(model.Password)
                || acc  == null)
            {
                return View("Index");
            }
            else
            {
                SessionPersister.UserName = acc;
            }

            if (!string.IsNullOrEmpty(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("ConfirmInfo", "Cart");
            }
        }

        public ActionResult LogOut()
        {
            SessionPersister.UserName = null;
            return RedirectToAction("AllProducer", "SANPHAM");
        }

        [HttpPost]
        public ActionResult Create(TAIKHOAN model)
        {
            try
            {
                // TODO: Add insert logic here
                var result = new TAIKHOANFunction.TaiKhoanFunction().Insert(model);
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
	}
}