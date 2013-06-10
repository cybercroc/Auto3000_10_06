using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Auto3000.Controllers.FE
{
    public class FEHomeController : Controller
    {
        //
        // GET: /FEHome/

        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                Session["UserId"] = Guid.NewGuid().ToString();
            }
            return View();
        }


    }
}
