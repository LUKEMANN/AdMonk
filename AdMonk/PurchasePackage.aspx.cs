using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PurchasePackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SqlDataSourcePurchasedPackage_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@Date_Of_Purchase"].Value = DateTime.Now;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourcePurchasedPackage.Insert();
        msg.Text = "Package Purchased successfully.";
        msg.CssClass = "text-success";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

    }
}