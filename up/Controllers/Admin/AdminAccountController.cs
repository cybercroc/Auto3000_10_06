using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using System.Data.EntityModel;
using Auto3000.Models;
using System.Configuration;

namespace Auto3000.Controllers
{
    // [Authorize]
    //  [InitializeSimpleMembership]
    public class AdminAccountController : BaseController
    {
        //
        // GET: /Account/Login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }


        [AllowAnonymous]
        public ActionResult ChangePassword()
        {
            return View();
        }

        //
        // POST: /Account/Login


        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var result = dbcontext.usp_AdminUser_sel(model.UserName, model.Password).SingleOrDefault().ToString();
                Session["UserId"] = result.Split('|')[0];
                if (result != "0")
                {
                    HttpCookie myCookie = new HttpCookie("Admin");
                    DateTime now = DateTime.Now;

                    // Set the cookie value.
                    myCookie.Value = result.Split('|')[1] + " " + result.Split('|')[2];
                    // Set the cookie expiration date.
                    myCookie.Expires = now.AddHours(1);
                    // Add the cookie.
                    Response.Cookies.Add(myCookie);


                    Response.RedirectToRoute("AdminDashboard", "admin/dashboard");
                    // Server.Transfer("admin/dashboard");
                }
            }
            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            return View(model);
        }

        //
        // POST: /Account/LogOff

        public ActionResult LogOff()
        {
            Session.Abandon();
            Response.Cookies["srconnectionid"].Value = null;
            return RedirectToAction("Login", "AdminAccount");
        }



        [HttpGet]
        public ActionResult Dashboard()
        {
            CheckLogin();
            return View();
        }


        [HttpPost]
        #region Helpers
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }


        [HttpGet]
        public ActionResult AdminUser()
        {

            return View();
        }


        #endregion
    }
}
