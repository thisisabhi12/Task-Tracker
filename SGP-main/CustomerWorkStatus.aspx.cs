using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class CustomerWorkStatus : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
   
    String custid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            data();
        }
    }
    public void data()
    {
        cn.Open();
        custid = Session["CustomerId"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("select customerandwork.Id,customerandwork.date,customerandwork.target,customerandwork.description,customerandwork.work,customerandwork.status,typeofwork.typeofwork from customerandwork inner join typeofwork on customerandwork.work=typeofwork.Id where customerandwork.customerid='" + custid + "'", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cn.Close();
    }
    
}