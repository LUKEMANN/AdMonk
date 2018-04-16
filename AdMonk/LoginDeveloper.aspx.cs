using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    { 
         DataView dv=SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
        bool exists = false;
        if (dv != null)
        {
            for(int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if(username.Text == dv.Table.Rows[i]["Name"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
               // Session("emailid") = username.Text;
                Response.Redirect("");
            }
            else
            {
                msg.Text = "Invalid username or password";
                msg.CssClass = "text-danger";
            }
        }
       
    }
}