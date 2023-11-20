using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoPRoject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int Count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Count += 1;
            Response.Write("Hit Count:" + Count);
        }

        
    }
}