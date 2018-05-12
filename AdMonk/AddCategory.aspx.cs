using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CategorySelect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceCategory.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (category.Text.ToLower() == dv.Table.Rows[i]["Category_Name"].ToString().ToLower() )
                {
                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Category already exits";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                SqlDataSourceCategory.Insert();
                msg.Text = "Category added successfully!";
                msg.CssClass = "text-success";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
        //SqlDataSourceCategory.Insert();
        //msg.Text = "Done";
        //msg.CssClass = "text-success";

        //category.Text = "";
    }
}