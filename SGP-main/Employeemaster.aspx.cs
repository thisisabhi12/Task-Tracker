using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Employeemaster : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    static int editid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getdepartment();
            getdesignation();
            data();
        }
    }
    protected void empsubmit_Click(object sender, EventArgs e)
    {
        if (ddldepartment.SelectedIndex != 0 && ddldesignation.SelectedIndex != 0 )
        {
            if (editid == 0)
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("insert into employee values('" + empname.Text + "','" + empmobno.Text + "','" + empmail.Text + "','" + ddldepartment.SelectedValue + "','" + ddldesignation.SelectedValue + "','" + empaddress.Text + "','" + emppassword.Text + "','')", cn);
                cmd.ExecuteNonQuery();
                Response.Write("<script Language='Javascript'>alert('Insert Successfully')</script>");
                cn.Close();
                clear();
                data();
            }
            else
            {

                cn.Open();
                SqlCommand cmd = new SqlCommand("update employee set employeename='" + empname.Text + "',  mobileno='" + empmobno.Text + "', email='" + empmail.Text + "',department='"+ ddldepartment.SelectedValue +"',designation='"+ ddldesignation.SelectedValue +"',address='" + empaddress.Text + "', report='' where Id = " + editid + "", cn);
                cmd.ExecuteNonQuery();
                Response.Write("<script Language='Javascript'>alert('Update Successfully')</script>");
                cn.Close();
                clear();
                editid = 0;
                data();
            }
        }
        else
        {
            Response.Write("<script Language='Javascript'>alert('Please Select Drop Down')</script>");
        }
    }
    public void data()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from employee", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cn.Close();
    }
    public void clear()
    {
        empname.Text = "";
        empmobno.Text = "";
        empmail.Text = "";
        ddldepartment.SelectedIndex = 0;
        ddldesignation.SelectedIndex = 0;
        empaddress.Text = "";
        emppassword.Text = "";
    }
    public void getdepartment()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from department", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddldepartment.DataSource = ds;
        ddldepartment.DataTextField = ds.Tables[0].Columns["departmentname"].ToString();
        ddldepartment.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        ddldepartment.DataBind();

        ddldepartment.Items.Insert(0, "Select");
        cn.Close();
    }
    public void getdesignation()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from designation", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddldesignation.DataSource = ds;
        ddldesignation.DataTextField = ds.Tables[0].Columns["designationname"].ToString();
        ddldesignation.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        ddldesignation.DataBind();
        ddldesignation.Items.Insert(0, "Select");
        cn.Close();
    }
    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton del = sender as LinkButton;
        GridViewRow delrow = del.NamingContainer as GridViewRow;
        string a = GridView1.DataKeys[delrow.RowIndex].Value.ToString();
        SqlCommand cmd = new SqlCommand("delete from employee where Id='" + a + "'", cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        data();
    }
    protected void lnkedit_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton ed = sender as LinkButton;
        GridViewRow edrow = ed.NamingContainer as GridViewRow;
        string b = GridView1.DataKeys[edrow.RowIndex].Value.ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from employee where Id='" + b + "'", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        editid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
        empname.Text = ds.Tables[0].Rows[0]["employeename"].ToString();
        empmobno.Text = ds.Tables[0].Rows[0]["mobileno"].ToString();
        empmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
        empaddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
        emppassword.Text = ds.Tables[0].Rows[0]["password"].ToString();
        ddldepartment.SelectedValue = ds.Tables[0].Rows[0]["department"].ToString();
        ddldesignation.SelectedValue = ds.Tables[0].Rows[0]["designation"].ToString();
       
        cn.Close();
    }
  
}