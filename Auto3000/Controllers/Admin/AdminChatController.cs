using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace Auto3000.Controllers.Admin
{
    public class AdminChatController : BaseController
    {
        //
        // GET: /AdminChat/

        public ActionResult Index(string UserId, string ClientId)
        {
            CheckLogin();
            if (Request.IsAjaxRequest())
            {
                var result = dbcontext.usp_ChatHistory_sel(UserId, ClientId).ToList();
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            return View();
        }

        #region [To Send Mail]

        public ActionResult SendMail(string UserId, string ClientId)
        {
            var result = dbcontext.usp_ChatHistory_sel(UserId, ClientId).ToList();
            String retVal = "0";
        if(result.Count > 0)
        {
            String Htmltext = "<table><tr><td><h1><b>Chat conversation</b></h1></td></tr>";
            MailMessage MyMailMessage = new MailMessage();
            MyMailMessage.From = new MailAddress(ConfigurationManager.AppSettings["mail"].ToString());
            MyMailMessage.To.Add(ConfigurationManager.AppSettings["tomail"].ToString());
            MyMailMessage.Subject = "Chat conversation between client and auto3000.nl";
            MyMailMessage.IsBodyHtml = true;
            foreach (var userlst in result)
            {
                Htmltext += "<tr><td><b>" + userlst.UserName.ToString() + " : </b>&nbsp;" + userlst.Message.ToString() + "</td></tr>";
            }
                Htmltext += "</table>";
                SmtpClient SMTPServer = new SmtpClient(ConfigurationManager.AppSettings["HostName"].ToString());
                SMTPServer.Port = 25;
                SMTPServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["mail"].ToString(), ConfigurationManager.AppSettings["pwd"].ToString());
                //SMTPServer.EnableSsl = true;
                MyMailMessage.Body = Htmltext;
            
            try
            {
                SMTPServer.Send(MyMailMessage);
              //  Response.Redirect("Thankyou.aspx");
                retVal = "1";
            }
            catch (Exception ex)
            {
                retVal = "0";

            }
        }
        return Json(retVal, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}
