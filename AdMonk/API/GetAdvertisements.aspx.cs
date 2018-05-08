using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class API_GetAdvertisements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["apiKey"] == null)
        {
            //Do nothing.
        }
        else
        {
            // Check if apiKey is valid
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            SqlCommand apiKeyCmd = new SqlCommand("SELECT * FROM [Website_Keys] WHERE [Key] = @Key", conn);
            apiKeyCmd.Parameters.AddWithValue("@Key", Request.QueryString["apiKey"]);

            DataTable dt = new DataTable();

            SqlDataAdapter adp = new SqlDataAdapter(apiKeyCmd);
            adp.Fill(dt);

            if(dt.Rows.Count > 0)
            {
                //if valid, get category of the website associated with apiKey

                string Category_Id = dt.Rows[0]["Category_Id"].ToString();

                //Get 5 random advertisements of the above category

                SqlCommand adCmd = new SqlCommand("SELECT * FROM [Advertisement] WHERE Category_Id = @Category_Id", conn);
                adCmd.Parameters.AddWithValue("@Category_Id", Category_Id);

                DataTable dtAds = new DataTable();

                adp = new SqlDataAdapter(adCmd);
                adp.Fill(dtAds);

                //Send the advertisements as JSON object array

                if(dtAds.Rows.Count > 0)
                {
                    List<Advertisement> ads = new List<Advertisement>();

                    for (int i = 0; i < dtAds.Rows.Count; i++)
                    {
                        Advertisement obj = new Advertisement()
                        {
                            AdvertisementId = dtAds.Rows[i]["Advertisement_Id"].ToString(),
                            RedirectLink = dtAds.Rows[i]["Redirect_Link"].ToString(),
                            Photo = "http://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + dtAds.Rows[i]["Photo"].ToString()
                        };
                        ads.Add(obj);
                    }

                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    Response.Write(serializer.Serialize(ads));
                }
            }
        }
    }
}