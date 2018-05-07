using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class Company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (emailid.Text == dv.Table.Rows[i]["Email"].ToString())
                {

                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Account already exists with this E-mail ID";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                SqlDataSourceCompany.Insert();
                msg.Text = "done";
                msg.CssClass = "text-success";
            }
        }

    



}

    
}