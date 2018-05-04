using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewCategory.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Category_Id"].ToString())
                    {
                        category_name.Text = dv.Table.Rows[i]["Category_Name"].ToString();
                        description.Text = dv.Table.Rows[i]["Description"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
        Response.Redirect("ViewCategory.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
        Response.Redirect("ViewCategory.aspx");
    }
}