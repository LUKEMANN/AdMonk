using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
        bool exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (email.Text == dv.Table.Rows[i]["Email"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Session["cid"] = dv.Table.Rows[i]["Company_Id"].ToString();
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                 
                Response.Redirect("AddAdvertisement.aspx");
            }
            else
            {
                msg.Text = "Invalid username or password";
                msg.CssClass = "text-danger";
            }
        }

    }
}