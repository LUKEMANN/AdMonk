using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Photo.HasFile)
        {
            string FileName = Photo.FileName.ToLower();

            string Extension = FileName.Substring(FileName.LastIndexOf('.'));

            if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png")
            {
                HiddenFieldPhoto.Value = "/photos/" + FileName;
                Photo.SaveAs(Server.MapPath(HiddenFieldPhoto.Value));
                SqlDataSource2.Insert();
                msg.Text = "Advertisement added successfully!";
                msg.CssClass = "text-success";

            }
            else
            {
                msg.Text = "Please select an image file";
                msg.CssClass = "text-danger";
            }

            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
    }
}