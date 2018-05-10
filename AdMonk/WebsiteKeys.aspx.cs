using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebsiteKeys : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["did"] == null)
        {
            Response.Redirect("LoginDeveloper.aspx");
        }
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceWebsiteKeys.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (url.Text == dv.Table.Rows[i]["Website_Url"].ToString()
                    || WebsiteName.Text == dv.Table.Rows[i]["Website"].ToString())
                {
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Account already exists with this E-mail ID";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                HiddenFieldKey.Value = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Session["did"].ToString() + DateTime.Now.ToFileTime().ToString(), "MD5");
                SqlDataSourceWebsiteKeys.Insert();
                GridView1.DataBind();
                msg.Text = "done";
                msg.CssClass = "text-success";
            }
        }

    }

    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        HiddenFieldKeyId.Value = e.CommandArgument.ToString();
        SqlDataSourceWebsiteKeys.Delete();
        GridView1.DataBind();
    }

}