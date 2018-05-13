using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageCompanies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["type"] != null)
        {
            if(Session["type"].ToString() != "Admin")
            {
                Response.Redirect("unauth.aspx");
            }
        }
    }

    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        HiddenFieldStatus.Value = e.CommandName;
        HiddenFieldId.Value = e.CommandArgument.ToString();

        if (HiddenFieldStatus.Value == "blocked")
        {
            HiddenFieldStatus.Value = "";
        }
        else
        {
            HiddenFieldStatus.Value = "blocked";
        }

        SqlDataSourceCompany.Update();
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button btn = e.Row.FindControl("Button1") as Button;
            if (btn.CommandName == "blocked")
            {
                btn.Text = "Unblock";
            }
            else
            {
                btn.Text = "Block";
            }
        }
    }
}