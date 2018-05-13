using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthlyHitsGraph : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FromDate_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date > DateTime.Now)
        {
            e.Cell.Visible = false;
        }
    }

    protected void ToDate_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date > DateTime.Now)
        {
            e.Cell.Visible = false;
        }
    }
}