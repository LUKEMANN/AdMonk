using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourceAdmin.Insert();
        msg.Text = "done";
        msg.CssClass = "text-success";
    }





    protected void confirmpass_TextChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSourceAdmin_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}