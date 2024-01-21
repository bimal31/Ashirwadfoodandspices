using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string s = this.Page.Request.FilePath;
            if (s.Contains("home.aspx"))
            {
                lihome.Attributes.Add("class", "active");
                liAbout.Attributes.Add("class", "");
                liProduct.Attributes.Add("class", "has-children");
                licontact.Attributes.Add("class", "");
            }
            if (s.Contains("about.aspx"))
            {
                lihome.Attributes.Add("class", "");
                liAbout.Attributes.Add("class", "active");
                liProduct.Attributes.Add("class", "has-children");
                licontact.Attributes.Add("class", "");
            }
            if (s.Contains("product.aspx") || s.Contains("product.aspx") || s.Contains("dehydratedproduct.aspx") || s.Contains("spraydriedproducts.aspx"))
            {
                lihome.Attributes.Add("class", "");
                liAbout.Attributes.Add("class", "");
                liProduct.Attributes.Add("class", "has-children");
                licontact.Attributes.Add("class", "");
            }
            if (s.Contains("contact.aspx"))
            {
                lihome.Attributes.Add("class", "");
                liAbout.Attributes.Add("class", "");
                liProduct.Attributes.Add("class", "has-children");
                licontact.Attributes.Add("class", "active");
            }

        }
    }
}
