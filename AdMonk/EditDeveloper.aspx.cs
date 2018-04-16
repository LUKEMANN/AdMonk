using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditDeveloper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewDeveloper.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Id"].ToString())
                    {
                        username.Text = dv.Table.Rows[i]["Name"].ToString();
                        mobile.Text = dv.Table.Rows[i]["Phone"].ToString();
                        RadioButtonList1.SelectedValue = dv.Table.Rows[i]["Gender"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourceDeveloper.Update();
        Response.Redirect("ViewDeveloper.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    SqlDataSourceDeveloper.Delete();
                    msg.Text = "done";
                    Response.Redirect("ViewDeveloper.aspx");
                }
                else
                {

                    msg.Text = "failure";
                    msg.CssClass = "text-danger";
                }

        }
    }
}
