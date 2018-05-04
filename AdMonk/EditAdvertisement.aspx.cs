using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditAdvertisement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewAdvertisement.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Advertisement_Id"].ToString())
                    {
                        Category.SelectedValue = dv.Table.Rows[i]["Category_Id"].ToString();
                        redirect_link.Text = dv.Table.Rows[i]["Redirect_Link"].ToString();
                       
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
        Response.Redirect("ViewAdvertisement.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Delete();
        Response.Redirect("ViewAdvertisement.aspx");
    }

    protected void HiddenField1_ValueChanged(object sender, EventArgs e)
    {

    }
}