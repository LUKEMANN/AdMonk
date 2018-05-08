using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebsiteKeys : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["did"] == null)
        {
            Response.Redirect("LoginDeveloper.aspx");
        }
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        HiddenFieldKey.Value = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(Session["did"].ToString() + DateTime.Now.ToFileTime().ToString(), "MD5");
        SqlDataSourceWebsiteKeys.Insert();
        GridView1.DataBind();
    }

    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        HiddenFieldKeyId.Value = e.CommandArgument.ToString();
        SqlDataSourceWebsiteKeys.Delete();
        GridView1.DataBind();
    }
}