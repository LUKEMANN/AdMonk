﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCompany : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cid"] == null)
        {
            Response.Redirect("LoginCompany.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Session["cid"].ToString() == dv.Table.Rows[i]["Company_Id"].ToString())
                    {
                        username.Text = dv.Table.Rows[i]["Name"].ToString();
                        mobile.Text = dv.Table.Rows[i]["Contact"].ToString();
                        emailid.Text = dv.Table.Rows[i]["Email"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;
        bool existsc = false;
        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (Session["cid"].ToString() == dv.Table.Rows[i]["Company_Id"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                }
            }

            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (mobile.Text == dv.Table.Rows[i]["Contact"].ToString())
                {

                    existsc = true;
                    break;
                }
            }
            if (existsc)
            {
                msg.Text = "Account already exists with contact";
                msg.CssClass = "text-danger";
            }
            else if (Exists)
            {
                SqlDataSourceCompany.Update();
                msg.Text = "Profile Updated";
                msg.CssClass = "text-success";
                // Response.Redirect("ViewCompany.aspx");
            }
            else
            {

                msg.Text = "incorrect password";
                msg.CssClass = "text-danger";
            }
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
        //SqlDataSourceCompany.Update();
        //Response.Redirect("ViewCompany.aspx");
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceCompany.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;
        

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (Session["cid"].ToString() == dv.Table.Rows[i]["Company_Id"].ToString() &&
                    password.Text == dv.Table.Rows[i]["Password"].ToString())
                {
                    Exists = true;
                    break;
                }
            }
            if (Exists)
            {
                SqlDataSourceCompany.Delete();
                Response.Redirect("Company.aspx");
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
