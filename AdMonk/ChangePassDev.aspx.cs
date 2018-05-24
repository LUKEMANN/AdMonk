using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassDev : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void changepass_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;
        bool exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (email.Text == dv.Table.Rows[i]["Email"].ToString() &&
                    oldpass.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Session["did"] = dv.Table.Rows[i]["Developer_Id"].ToString();
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                SqlDataSourceDeveloper.Update();
                Response.Redirect("LoginDeveloper.aspx");
            }
            else
            {
                msg.Text = "Invalid e-mail or password";
                msg.CssClass = "text-danger";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
    }

    
}