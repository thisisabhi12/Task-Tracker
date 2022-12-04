using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Customer : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    static int editid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        data();

    }
    protected void custsubmit_Click(object sender, EventArgs e)
    {
        
        if (editid == 0)
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("insert into customer values('" + customername.Text + "','" + customermobno.Text + "','" + customeraddress.Text + "','" + customeremail.Text + "','" + companyname.Text + "','" + professionalno.Text + "','" + branchname.Text + "','" + branchaddress.Text + "','" + passtxt.Text + "')", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            clear();
            data();
        }
        else
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("update customer set customername='" + customername.Text + "',  customermobileno='" + customermobno.Text + "', customeraddress='" + customeraddress.Text + "', customeremail='" + customeremail.Text +"',customerpassword='"+passtxt.Text+"',  companyname='" + companyname.Text + "', professionalno='" + professionalno.Text + "', branchname='" + branchname.Text + "', branchaddress='"+branchaddress.Text+"' where Id = " + editid + "", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            clear();
            editid = 0;
            data();
        }
    }
    public void data()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from customer", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        cn.Close();
    }

    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton del = sender as LinkButton;
        GridViewRow delrow = del.NamingContainer as GridViewRow;
        string a = GridView2.DataKeys[delrow.RowIndex].Value.ToString();
        SqlCommand cmd = new SqlCommand("delete from customer where Id='" + a + "'", cn);
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void lnkedit_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton ed = sender as LinkButton;
        GridViewRow edrow = ed.NamingContainer as GridViewRow;
        string b = GridView2.DataKeys[edrow.RowIndex].Value.ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from customer where Id='" + b + "'", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        editid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
        customername.Text = ds.Tables[0].Rows[0]["customername"].ToString();
        customermobno.Text = ds.Tables[0].Rows[0]["customermobileno"].ToString();
        customeraddress.Text = ds.Tables[0].Rows[0]["customeraddress"].ToString();
        customeremail.Text = ds.Tables[0].Rows[0]["customeremail"].ToString();
        passtxt.Text = ds.Tables[0].Rows[0]["customerpassword"].ToString();
        companyname.Text = ds.Tables[0].Rows[0]["companyname"].ToString();
        professionalno.Text = ds.Tables[0].Rows[0]["professionalno"].ToString();
        branchname.Text = ds.Tables[0].Rows[0]["branchname"].ToString();
        branchaddress.Text = ds.Tables[0].Rows[0]["branchaddress"].ToString();
        cn.Close();
    }
    public void clear()
    {
        customername.Text = "";
        customermobno.Text = "";
        customeraddress.Text = "";
        customeremail.Text = "";
        passtxt.Text = "";
        companyname.Text = "";
        professionalno.Text = "";
        branchname.Text = "";
        branchaddress.Text = "";

    }
}