using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourcePackage.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (pkgname.Text.ToLower() == dv.Table.Rows[i]["Package_Name"].ToString().ToLower())
                {
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "package name already exits";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                SqlDataSourcePackage.Insert();
                msg.Text = "Package created successfullt!";
                msg.CssClass = "text-success";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
        //SqlDataSourcePackage.Insert();
        //msg.Text = "done";
        //msg.CssClass = "text-success";
    }
}