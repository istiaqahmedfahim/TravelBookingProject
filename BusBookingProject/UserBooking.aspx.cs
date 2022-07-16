using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject
{    
    public partial class UserBooking : System.Web.UI.Page
    {    
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            cmd.CommandText = "Insert into userBooking (name,address,phone,email,arrival_date,leaving_date,destination)values('"+txtName.+"')";
        }
    }
}