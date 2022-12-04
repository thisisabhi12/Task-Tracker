using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginsubmit_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from adminlogin where username ='" + username.Text + "' and password='" + password.Text + "'", cn);
        DataTable ds = new DataTable();
        da.Fill(ds);
        if (ds.Rows.Count > 0)
        {
            Session["Admin"] = username.Text;
            Response.Redirect("Demo.aspx");
        }
        else
        {

            SqlDataAdapter ac = new SqlDataAdapter("select * from employee where mobileno = '" + username.Text + "'and password='" + password.Text + "' ", cn);
            DataTable dd = new DataTable();
            ac.Fill(dd);
            if (dd.Rows.Count > 0)
            {
                Session["EmpId"] = dd.Rows[0]["Id"].ToString();
                Session["Empname"] = dd.Rows[0]["employeename"].ToString();
                cn.Close();
                //clear();
                Session["Emp"] = username.Text;
                Response.Redirect("Demo.aspx");
            }
            else
            {
                SqlDataAdapter ac1 = new SqlDataAdapter("select * from customer where customeremail = '" + username.Text + "'and customerpassword='" + password.Text + "' ", cn);
                DataTable dd1 = new DataTable();
                ac1.Fill(dd1);
                if (dd1.Rows.Count > 0)
                {
                    Session["CustomerId"] = dd1.Rows[0]["Id"].ToString();
                    Session["CustomerName"] = dd1.Rows[0]["customername"].ToString();
                    cn.Close();
                    //clear();
                    Session["CustomerEmail"] = username.Text;
                    Response.Redirect("Demo.aspx");
                }
                else
                {
                    //clear();
                    Response.Write("<script Language='Javascript'>alert('Wrong Username/Password')</script>");
                }
            }
        }
        cn.Close();
    }

    //public void clear()
    //{
    //    username.Text = "";
    //    password.Text = "";
    //}
}
