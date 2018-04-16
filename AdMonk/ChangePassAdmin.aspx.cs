using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("ViewAdmin.aspx");
        }
      



    }

    protected void changepass_Click(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceAdmin.Select(DataSourceSelectArguments.Empty) as DataView;
            bool Exist = false;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (username.Text == dv.Table.Rows[i]["Username"].ToString() && oldpass.Text == dv.Table.Rows[i]["Password"].ToString())
                    {
                        
                        Exist = true;
                        break;
                    }

                }

            }

            if (Exist)
            {
                SqlDataSourceAdmin.Update();
                msg.Text = "password changed successfully";
                msg.CssClass = "text success";
            }
            else
            {
                msg.Text = "enter valid Username or Password";
                msg.CssClass = "text-danger";
            }
        }
    }
}