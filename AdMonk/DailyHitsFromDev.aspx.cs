using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DailyHitsFromDev : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            HiddenFieldDate.Value = DateTime.Now.ToShortDateString();
            Chart1.DataBind();
        }
    }
}