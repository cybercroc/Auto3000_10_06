using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using Microsoft.Ajax.Utilities;
using Auto3000.Models;



namespace Auto3000
{
    [HubName("chatHubs")]
    public class ChatHub : Hub
    {
        #region [Data Memeber]

        static List<UserDetail> ConnectedUsers = new List<UserDetail>();
        static List<MessageDetail> CurrentMessage = new List<MessageDetail>();
        static List<AdminUserCount> AdminUserConnect = new List<AdminUserCount>();

        // String constring = ConfigurationManager.ConnectionStrings["Con"].ConnectionString.ToString();

        #endregion



        public void Connect(string userName)
        {
            
            String UserID = Context.QueryString["uid"].ToString();
            String ClientIDs = Context.QueryString["clientId"].ToString();
            var id = Context.ConnectionId;
            String UserType = "C";
            String ClientId = "0";
            if (UserID != "0" && UserID != "" && UserID != "undefined")
            {
                if (HttpContext.Current.Request.Cookies["Admin"] != null)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies["Admin"].Value)))
                    {
                        String username = HttpContext.Current.Request.Cookies["Admin"].Value;

                        if (ConnectedUsers.Count(x => x.ConnectionId == Context.ConnectionId) == 0)
                        {
                            String UserId = UserID; //HttpContext.Current.Session["UserId"].ToString();

                            ConnectedUsers.Add(new UserDetail { ConnectionId = id, UserName = username, UserType = "A", ClientId = UserId });


                            // send to caller
                            Clients.Caller.onConnected(id, userName, ConnectedUsers, CurrentMessage, UserId);

                            // send to all except caller client
                            //  Clients.AllExcept(id).onNewUserConnected(id, userName);
                        }
                    }
                }
                else
                {

                    if (ConnectedUsers.Count(x => x.ConnectionId == Context.ConnectionId) == 0)
                    {

                        ConnectedUsers.Add(new UserDetail { ConnectionId = id, UserName = userName, UserType = UserType, ClientId = UserID });


                        // send to caller
                        Clients.Caller.onConnected(id, userName, ConnectedUsers, CurrentMessage, ClientId);

                        // send to all except caller client
                        //  Clients.AllExcept(id).onNewUserConnected(id, userName);
                    }
                }
            }

        }

        #region [Pick rendomly admin user]

        public void AssignUser()
        {
            List<AdminUserCount> Adminuser = new List<AdminUserCount>();
            //String UserID = Context.QueryString["uid"].ToString();
            Adminuser.AddRange(AdminUserConnect.Where(x => x.ToUserId.Count() >= 10).ToList());

            var item = ConnectedUsers.Where(x => !Adminuser.Any(y => y.FromUserid == x.ClientId) && x.UserType == "A").ToList();
            var rand = new Random();
            if (item.Count() > 0)
            {
                var user = item.ElementAt(rand.Next(item.Count()));
                Clients.Caller.OnUserConnected(user.ClientId, user.UserName);
            }
            else
                Clients.Caller.OnUserConnected(0, "Sorry not user unavailable!");
        }
        #endregion

        #region  [To Private chat]

        public void SendPrivateMessage(string toUserId, string message, string sndrstatus)
        {
            String fromUserId = Context.QueryString["uid"].ToString();

            if (fromUserId != "0" && fromUserId != "" && fromUserId != "undefined")
            {

                var toUser = ConnectedUsers.FirstOrDefault(x => x.ClientId == toUserId);
                var fromUser = ConnectedUsers.FirstOrDefault(x => x.ClientId == fromUserId);

                if (toUser != null && fromUser != null)
                {
                    // send to 
                    //string username = toUser.FirstOrDefault().UserName;
                    //foreach(var user in toUser)
                    Clients.Client(toUser.ConnectionId).sendPrivateMessage(fromUserId, fromUser.UserName, message,0);
                    // send to caller user
                    Clients.Caller.sendPrivateMessage(toUserId, fromUser.UserName, message,1);
                    Entities dbcontext = new Entities();
                    String senderstatus = sndrstatus == "C" ? fromUserId : toUserId;
                    dbcontext.usp_ChatHistory_ins(toUserId, fromUserId, message, fromUser.UserName, toUser.UserName, senderstatus);
                    //cAuto3000.Controllers.BaseController.d
                    ///Add admin user for count chating
                    ///
                    if (!AdminUserConnect.Exists(usr => usr.ToUserId == toUserId || usr.FromUserid == fromUserId))
                    {
                        AdminUserConnect.Add(new AdminUserCount { ToUserId = toUserId, FromUserid = fromUserId });
                    }
                }
            }
        }

        #endregion

        #region [Disconnect On Logout]

        public void disconectonlogout()
        {

            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            var adminusercount = AdminUserConnect.FirstOrDefault(usr => usr.ToUserId !=  Context.ConnectionId | usr.FromUserid != Context.ConnectionId);
            if (item != null)
            {
                ConnectedUsers.Remove(item);

                var id = Context.ConnectionId;
                Clients.All.onUserDisconnected(id, item.UserName);
                AdminUserConnect.Remove(adminusercount);
            }

        }
        #endregion

        #region [To Disconnect Chat]

        //public override Task OnConnected()
        //{
        //    //Connect.C
        //}

        public override Task OnDisconnected()
        {
                string uid = "";
            if (Context.QueryString["uid"] != null)
            {
                uid = Context.QueryString["uid"].ToString();
            }
            if (uid == "0" || uid == "" || uid == "undefined")
            {
            }
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            var adminusercount = AdminUserConnect.FirstOrDefault(usr => usr.ToUserId != Context.ConnectionId || usr.FromUserid != Context.ConnectionId);
            if (item != null)
            {
                ConnectedUsers.Remove(item);

                var id = Context.ConnectionId;
                //Clients.All.onUserDisconnected(item.ClientId, item.UserName);
                AdminUserConnect.Remove(adminusercount);
            }
            // }
            return base.OnDisconnected();

        }

        #endregion


        #region private Messages

        private void AddMessageinCache(string userName, string message)
        {
            CurrentMessage.Add(new MessageDetail { UserName = userName, Message = message });

            if (CurrentMessage.Count > 100)
                CurrentMessage.RemoveAt(0);
        }

        #endregion

        #region [To Show typing]

        public void Keypressed(string touserid, string UserName)
        {
            String UserID = Context.QueryString["uid"].ToString();

            var user = ConnectedUsers.FirstOrDefault(u => u.ClientId == UserID);
            var toUser = ConnectedUsers.Where(x => x.ClientId == touserid);

            if (toUser.Count() == 0)
            {
                Clients.Caller.onUserDisconnected(touserid, UserName);
            }
            else
            {
                foreach(var i in toUser)
                Clients.Client(i.ConnectionId).userTyping(user.UserName, user.ClientId);
            }
        }

        #endregion
    }

    public class MessageDetail
    {

        public string UserName { get; set; }

        public string Message { get; set; }

    }

    public class UserDetail
    {
        public string ConnectionId { get; set; }
        public string UserName { get; set; }
        public string UserType { get; set; }
        public string ClientId { get; set; }
    }
    public class AdminOnlineUser
    {
        public string UserId { get; set; }
        public String Name { get; set; }
    }

    public class AdminUserCount
    {
        public string ToUserId { get; set; }
        public string FromUserid { get; set; }
    }


}


