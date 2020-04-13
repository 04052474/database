using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class postback01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Response.Write("第一次載入<br>");
        }
        else
        {
            int x = 1;
            int y = 1;
            Response.Write("網頁重新PostBack <br>");
            Response.Write("九九乘法表");
            Response.Write("<table border=4>");
            for (x = 1; x <= 9; x++)
            {
                Response.Write("<tr>");
                for (y = 1; y <= 9; y++)
                {
                Response.Write("<th > "+x+"*"+y+"="+x*y+" </th >");
                }
                Response.Write("</ tr>");

            }
            Response.Write("</table>");
        }
    }
}