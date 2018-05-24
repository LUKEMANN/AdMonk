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
        bool blocked = false;
        if (dv != null)
        {
            for(int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if(emailid.Text == dv.Table.Rows[i]["Email"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Session["did"] = dv.Table.Rows[i]["Developer_Id"].ToString();
                    exists = true;
                    if(dv.Table.Rows[i]["Status"].ToString() == "blocked")
                    {
                        blocked = true;
                    }
                    break;
                }
            }
            if (exists)
            {
                if (blocked)
                {
                    Session["did"] = null;
                    msg.Text = "Your account has been blocked by Admin. Please contact via email to resolve this issue.";
                    msg.CssClass = "text-danger";
                }
                else
                {
                    Response.Redirect("WebsiteKeys.aspx");
                }
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