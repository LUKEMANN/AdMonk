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
        if (Session["did"] == null)
        {
            Response.Redirect("LoginDeveloper.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Session["did"].ToString() == dv.Table.Rows[i]["Developer_Id"].ToString())
                    {
                        username.Text = dv.Table.Rows[i]["Name"].ToString();
                        fullname.Text = dv.Table.Rows[i]["Fullname"].ToString();
                        mobile.Text = dv.Table.Rows[i]["Phone"].ToString();
                        RadioButtonList1.SelectedValue = dv.Table.Rows[i]["Gender"].ToString();
                        email.Text = dv.Table.Rows[i]["Email"].ToString();
                        Image1.ImageUrl = dv.Table.Rows[i]["Photo"].ToString();
                        HiddenFieldPhoto.Value = dv.Table.Rows[i]["Photo"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                    if (Photo.HasFile)
                    {
                        string FileName = Photo.FileName.ToLower();

                        string Extension = FileName.Substring(FileName.LastIndexOf('.'));

                        if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png")
                        {
                            HiddenFieldPhoto.Value = "/user_images/" + FileName;     //photos
                            Photo.SaveAs(Server.MapPath(HiddenFieldPhoto.Value));
                            SqlDataSourceDeveloper.Update();
                            msg.Text = "Profile Updated";
                            msg.CssClass = "text-success";
                        }
                        else
                        {
                            msg.Text = "Select an image file.";
                            msg.CssClass = "text-danger";
                        }
                    }
                    else
                    {
                        SqlDataSourceDeveloper.Update();
                        msg.Text = "Profile Updated";
                        msg.CssClass = "text-success";
                    }
                    //Response.Redirect("ViewDeveloper.aspx");
                }
                else
                {

                    msg.Text = "incorrect password";
                    msg.CssClass = "text-danger";
                }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
        //SqlDataSourceDeveloper.Update();
        //Response.Redirect("ViewDeveloper.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDeveloper.Select(DataSourceSelectArguments.Empty) as DataView;
        bool Exists = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                    break;
                }
               
            if (Exists)
            {
                SqlDataSourceDeveloper.Delete();
                Response.Redirect("AddDeveloper.aspx");
            }
            else
            {

                msg.Text = "incorrect password";
                msg.CssClass = "text-danger";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
    }


}
