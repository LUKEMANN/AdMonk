using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["type"] != null)
        {
            if (Session["type"].ToString() != "Admin")
            {
                Response.Redirect("unauth.aspx");
            }
        }

        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewAdmin.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceAdmin.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Username"].ToString())
                    {
                        username.Text = dv.Table.Rows[i]["Username"].ToString();
                        fullname.Text = dv.Table.Rows[i]["Fullname"].ToString();
                        mobile.Text = dv.Table.Rows[i]["Contactno"].ToString();
                        emailid.Text = dv.Table.Rows[i]["Emailid"].ToString();
                        RadioButtonList1.SelectedValue = dv.Table.Rows[i]["Gender"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceAdmin.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    SqlDataSourceAdmin.Update();
                    msg.Text = "done";
                    Response.Redirect("ViewAdmin.aspx");
                }
                else
                {

                    msg.Text = "incorrect password";
                    msg.CssClass = "text-danger";
                }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
        //SqlDataSourceAdmin.Update();
        //Response.Redirect("ViewAdmin.aspx");
    }

        protected void Button2_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceAdmin.Select(DataSourceSelectArguments.Empty) as DataView;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
                if (password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    SqlDataSourceAdmin.Delete();
                    msg.Text = "done";
                    Response.Redirect("ViewAdmin.aspx");
                }
                else
                {

                    msg.Text = "incorret password";
                    msg.CssClass = "text-danger";
                }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);


        }
    }
    }
