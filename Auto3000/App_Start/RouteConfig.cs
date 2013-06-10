using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Auto3000
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //routes.MapRoute(
            //    name: "Default",
            //    url: "{controller}/{action}/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);


            routes.MapRoute("LogOut", "admin/LogOff", new { controller = "AdminAccount", action = "LogOff" });
            routes.MapRoute("AdminLogin", "admin/login", new { controller = "AdminAccount", action = "Login" });
            routes.MapRoute("AdminAnnouncement", "admin/announcements", new { controller = "AdminAnnouncement", action = "Index" });
            routes.MapRoute("AdminAppointmentDelete", "admin/announcementdel", new { controller = "AdminAnnouncement", action = "Delete" });
            routes.MapRoute("AdminDashboard", "admin/dashboards", new { controller = "AdminAccount", action = "Dashboard" });

            #region [Routes For FeedBack Admin]
            routes.MapRoute("AdminFeedback", "admin/feedback", new { controller = "AdminFeedback", action = "Index" });
            routes.MapRoute("AdminFeedbackDelete", "admin/feedbackdel", new { controller = "AdminFeedback", action = "Delete" });
            #endregion

            #region [Routes For Contact Admin]
            routes.MapRoute("AdminContact", "admin/contact", new { controller = "AdminContact", action = "Index" });
            routes.MapRoute("AdminContactDelete", "admin/contactdel", new { controller = "AdminContact", action = "Delete" });
            #endregion

            #region [Routes For Admin User]
            routes.MapRoute("AdminUser", "admin/adminusers", new { controller = "AdminAccount", action = "AdminUser" });
            routes.MapRoute("AdminUserDelete", "admin/adminuserdel", new { controller = "AdminAccount", action = "AdminUserDelete" });
            #endregion

            #region [Routes For Chat]

            routes.MapRoute("AdminChat", "admin/chat", new { controller = "AdminChat", action = "Index" });
            routes.MapRoute("AdminChatSendMail", "admin/chatmail", new { controller = "AdminChat", action = "SendMail" });

            #endregion


            #region[FE ROUTES]

            routes.MapRoute("Home", "", new { controller = "FEHome", action = "Index" });
            routes.MapRoute("Appointment", "appointment", new { controller = "FEAppointment", action = "Index" });
            #endregion


        }
    }
}