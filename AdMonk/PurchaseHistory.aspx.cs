using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PurchaseHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceRemaining.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv.Table.Rows.Count > 0)
        {
            Chart1.Visible = true;
            DataTable dt = new DataTable();
            dt.Columns.Add("Type");
            dt.Columns.Add("Value");

            var row = dt.NewRow();
            row["Type"] = "Remaining";
            row["Value"] = dv.Table.Rows[0][0];
            dt.Rows.Add(row);

            row = dt.NewRow();
            row["Type"] = "Used";
            row["Value"] = dv.Table.Rows[0][1];
            dt.Rows.Add(row);

            Chart1.DataSource = dt;
            Chart1.DataBind();
           
        }
        else
        {
            Chart1.Visible = false;
            msg.Text = "Package not purchased for selected advertisement";
            msg.CssClass = "text-danger";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }

    }

    protected void Chart1_Load(object sender, EventArgs e)
    {

    }
}