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
    public partial class UserBooking : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Timeout = 1;
  }

        private int Booking()
        {
            try
            {
                int ResultCout = 0;
                SqlCommand sqlCmd = new SqlCommand();
                if (connString.State == ConnectionState.Closed)
                {
                    connString.Open();
                }
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@name", Convert.ToString(txtName.Text));
                sqlCmd.Parameters.AddWithValue("@address", Convert.ToString(txtAddress.Text));
                sqlCmd.Parameters.AddWithValue("@phone", Convert.ToString(txtPhone.Text));
                sqlCmd.Parameters.AddWithValue("@email", Convert.ToString(txtEmail.Text));
                sqlCmd.Parameters.AddWithValue("@arrival_date", Convert.ToString(txtArrivaldate.Text));
                sqlCmd.Parameters.AddWithValue("@leaving_date", Convert.ToString(txtLeavingdate.Text));
                sqlCmd.Parameters.AddWithValue("@destination", Convert.ToString(txtDestination.Text));
                sqlCmd.Parameters.AddWithValue("@Ret_Val", SqlDbType.BigInt);
                sqlCmd.Parameters["@Ret_Val"].Direction = ParameterDirection.Output;
                sqlCmd.CommandText = "ispUserBooking";
                sqlCmd.Connection = connString;
                sqlCmd.ExecuteNonQuery();
                //ResultCout = Convert.ToInt32(sqlCmd.Parameters["@Ret_Val"].Value);
                return ResultCout;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Booking();
            
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Congratulations!Booking has been done successfully')", true);
            txtName.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtArrivaldate.Text = "";
            txtLeavingdate.Text = "";
            txtDestination.Text = "";

        }
    }
}