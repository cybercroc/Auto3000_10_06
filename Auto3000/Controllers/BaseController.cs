using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Auto3000.Models;

namespace Auto3000.Controllers
{
    /*Base Controller for all Default Functions*/
    public class BaseController : Controller
    {
        public Entities dbcontext = new Entities();

        public void CheckLogin()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"].ToString() + "admin/login");
                //Response.RedirectToRoute("AdminLogin", "admin/login");
            }
        }
    }
}
