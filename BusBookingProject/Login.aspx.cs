using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelBookingProject
{
    public partial class Login : System.Web.UI.Page
    {
         #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
                {
                    txtUserId.Text = Request.Cookies["UserName"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                }
            }

        }

        private DataSet getUserData()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if(connString.State==ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@MobileNo", Convert.ToString(txtUserId.Text));
            sqlCmd.Parameters.AddWithValue("@Password",Convert.ToString(txtPassword.Text));
            sqlCmd.CommandText = "ispUserLogin";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            return dsGetData;

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataSet dsLogin = getUserData();
            if(dsLogin.Tables[0].Rows.Count>0)
            {   //set session data
                Session["UserID"] = Convert.ToInt32(dsLogin.Tables[0].Rows[0]["regId"]);
                Session["FName"] = Convert.ToString(dsLogin.Tables[0].Rows[0]["Fname"]);
                Session["MobileNo"] = Convert.ToString(dsLogin.Tables[0].Rows[0]["Contact"]);
                //set cookies
               Response.Cookies["log_status"].Value = " logged-in";
                if (RememberMe.Checked)
                {
                    Response.Cookies["UserName"].Value = txtUserId.Text;
                    Response.Cookies["Password"].Value = txtPassword.Text;
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddMinutes(1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(1);
                }
                else
                {
                    Response.Cookies["UserName"].Expires = DateTime.Now.AddMinutes(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddMinutes(-1);
                }


                Response.Redirect("UserBooking.aspx");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Credentials Passed,Please check your username and Password')", true); 
            }
        }
    }
}