using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddDeveloper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            
            bool exists = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (emailid.Text.ToLower() == dv.Table.Rows[i]["Email"].ToString().ToLower()
                    || username.Text.ToLower() == dv.Table.Rows[i]["Name"].ToString().ToLower())
                {

                    exists = true;
                    break;
                }
            }
            if (exists)
            {
                msg.Text = "Account already exists with Username or E-mail ID";
                msg.CssClass = "text-danger";
            }
            else
            {
                msg.Text = "";
                if (Photo.HasFile)
                {
                    string FileName = Photo.FileName.ToLower();

                    string Extension = FileName.Substring(FileName.LastIndexOf('.'));

                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png")
                    {
                        HiddenFieldPhoto.Value = "/user_images/" + FileName;                 //photos
                        Photo.SaveAs(Server.MapPath(HiddenFieldPhoto.Value));
                        SqlDataSourceDeveloper.Insert();
                        msg.Text = "Account created successfully!";
                        msg.CssClass = "text-success";

                    }
                    else
                    {
                        msg.Text = "Please select an image file";
                        msg.CssClass = "text-danger";
                    }
                }
                
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }


    }
}