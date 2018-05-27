using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] != null)
        {
            if (Session["type"].ToString() != "Admin")
            {
                Response.Redirect("unauth.aspx");
            }
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceAdmin.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (username.Text.ToLower() == dv.Table.Rows[i]["Username"].ToString().ToLower() || emailid.Text==dv.Table.Rows[i]["Emailid"].ToString())
                {
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Account already exists with Username or Email-id";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                SqlDataSourceAdmin.Insert();
                msg.Text = "Account created successfully!";
                msg.CssClass = "text-success";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
    }





    protected void confirmpass_TextChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSourceAdmin_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}