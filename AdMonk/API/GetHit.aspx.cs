using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class API_GetHit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        if (Request.QueryString["apiKey"] == null || Request.QueryString["id"] == null)
        {
            //Do nothing.
        }
        else
        {
            // Check if apiKey is valid
            // Check if apiKey is valid
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            SqlCommand apiKeyCmd = new SqlCommand("SELECT * FROM [Website_Keys] WHERE [Key] = @Key", conn);
            apiKeyCmd.Parameters.AddWithValue("@Key", Request.QueryString["apiKey"]);

            string Key_Id = "";

            DataTable dt = new DataTable();

            SqlDataAdapter adp = new SqlDataAdapter(apiKeyCmd);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Key_Id = dt.Rows[0]["Key_Id"].ToString();
                SqlCommand InsertCmd = new SqlCommand("INSERT INTO Advertisement_Hits ([Key_Id], [Date_Of_Hit], [Time_Of_Hit], [Advertisement_Id]) VALUES (@Key_Id, @Date_Of_Hit, @Time_Of_Hit, @Advertisement_Id)", conn);
                InsertCmd.Parameters.AddWithValue("@Key_Id", Key_Id);
                InsertCmd.Parameters.AddWithValue("@Date_Of_Hit", DateTime.Now);
                InsertCmd.Parameters.AddWithValue("@Time_Of_Hit", DateTime.Now);
                InsertCmd.Parameters.AddWithValue("@Advertisement_Id", Request.QueryString["id"]);

                dt = new DataTable();

                try
                {
                    adp = new SqlDataAdapter(InsertCmd);
                    adp.Fill(dt);

                    Response.Write("success");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else
            {
                Response.Write("invalid key");
            }
        }
    }
}