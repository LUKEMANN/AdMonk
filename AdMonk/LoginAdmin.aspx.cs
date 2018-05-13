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
        DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
        bool exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (username.Text == dv.Table.Rows[i]["Username"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Session["username"] = dv.Table.Rows[i]["Username"].ToString();
                    Session["type"] = dv.Table.Rows[i]["Type"].ToString();
                    exists = true;
                    break;
                }
            }
            if (exists)
            {

                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                msg.Text = "Invalid username or password";
                msg.CssClass = "text-danger";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }

    }

}