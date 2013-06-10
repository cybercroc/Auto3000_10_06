using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Auto3000.Models;

namespace Auto3000.Controllers.Admin
{
    public class AdminAnnouncementController : BaseController
    {
        //
        // GET: /AdminAppointment/

        public ActionResult Index(Int32? id)
        {
            CheckLogin();
            if (Request.IsAjaxRequest())
            {
                var result = dbcontext.usp_Announcement_sel(id).ToList();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            return View();
        }


        [HttpPost]
        public ActionResult Index(AdminModel.Announcement model)
        {

            var result = dbcontext.usp_Announcement_ins(model.AnnouncementId, model.Title, model.Description,model.Expiry, model.IsActive).SingleOrDefault();

                     
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public ActionResult LogOff() {
            Session.Abandon();
            Response.RedirectToRoute("AdminLogin", "admin/login");
            return Json("1");
        }


        public ActionResult Delete(Int32? id)
        {
            dbcontext.usp_Announcement_del(id);
            return Json("1", JsonRequestBehavior.AllowGet);
        }

    }
}
