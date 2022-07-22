using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelBookingProject
{
    public partial class BusBookingMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["FName"] !=null)
            {
                string cookie = Request.Cookies["log_status"].Value;
                lblName.Text = Convert.ToString(Session["FName"]+cookie);
            }
            Session.Timeout = 1;
          
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}