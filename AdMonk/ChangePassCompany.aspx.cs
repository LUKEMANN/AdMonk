using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void changepass_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;
        bool exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (email.Text == dv.Table.Rows[i]["Email"].ToString() &&
                    oldpass.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Session["cid"] = dv.Table.Rows[i]["Company_Id"].ToString();
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                SqlDataSourceCompany.Update();
                Response.Redirect("LoginCompany.aspx");
            }
            else
            {
                msg.Text = "Invalid email-id or password";
                msg.CssClass = "text-danger";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }

    }
}