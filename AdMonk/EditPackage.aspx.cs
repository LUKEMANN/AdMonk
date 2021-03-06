﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditPackage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewPackage.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourcePackage.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["Package_Id"].ToString())
                    {
                        pkgname.Text = dv.Table.Rows[i]["Package_Name"].ToString();
                        nohits.Text = dv.Table.Rows[i]["Number_of_Hits"].ToString();
                        price.Text= dv.Table.Rows[i]["Price"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourcePackage.Update();
        Response.Redirect("ViewPackage.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //DataView dv = SqlDataSourcePackage.Select(DataSourceSelectArguments.Empty) as DataView;

        //if (dv != null)
        //{
        //    for (int i = 0; i < dv.Table.Rows.Count; i++)
        //        if (pkgname.Text == dv.Table.Rows[i]["Package_Name"].ToString())
        //        {
                    SqlDataSourcePackage.Delete();
                    //msg.Text = "done";
                    Response.Redirect("ViewPackage.aspx");
                //}
                //else
                //{

                //    msg.Text = "enter a valid package name";
                //    msg.CssClass = "text-danger";
                //}
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "$('#myModal').modal('hide');$('body').removeClass('modal-open');$('.modal-backdrop').remove();$('#myModal').modal('show');", true);

        }
    }
