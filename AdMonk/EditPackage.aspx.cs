using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourcePackage.Update();
        Response.Redirect("ViewPackage.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourcePackage.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (pkgname.Text == dv.Table.Rows[i]["Package_Name"].ToString())
                {
                    SqlDataSourcePackage.Delete();
                    msg.Text = "done";
                    Response.Redirect("ViewPackage.aspx");
                }
                else
                {

                    msg.Text = "enter a valid package name";
                    msg.CssClass = "text-danger";
                }

        }
    }
}
