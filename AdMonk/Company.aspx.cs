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
            bool existsc = false;      //for contact
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (emailid.Text.ToLower() == dv.Table.Rows[i]["Email"].ToString().ToLower()||company_name.Text.ToLower()== dv.Table.Rows[i]["Name"].ToString().ToLower())
                {

                    exists = true;
                    break;
                }
            }
            //-- contact validation--

            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (mobile.Text == dv.Table.Rows[i]["Contact"].ToString())
                {

                    existsc = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Account already exists with Company Name or E-mail ID";
                msg.CssClass = "text-danger";
            }
            else if(existsc)         //for contact
            {
                msg.Text = "Account already exists with contact";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                SqlDataSourceCompany.Insert();
                msg.Text = "Account created successfully!";
                msg.CssClass = "text-success";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }





    }

    
}