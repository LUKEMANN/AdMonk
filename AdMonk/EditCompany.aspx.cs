using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewCompany.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Company_Id"].ToString())
                    {
                        username.Text = dv.Table.Rows[i]["Name"].ToString();
                        mobile.Text = dv.Table.Rows[i]["Contact"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourceCompany.Update();
        Response.Redirect("ViewCompany.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        SqlDataSourceCompany.Delete();
        Response.Redirect("ViewCompany.aspx");
    }
}