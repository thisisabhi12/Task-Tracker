using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;

public partial class AllocatedTask : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    static int editid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            date.Text = Convert.ToString(System.DateTime.Now.ToShortDateString());
           
           
            getemployee();
            gettypeofwork();
            getcustomer();
        }
        data();
    }
    protected void AllocatedTaskSubmit_Click(object sender, EventArgs e)
    {
        if (ddlemployeeid.SelectedIndex != 0 && ddltypeofwork.SelectedIndex != 0 && ddlcustomerid.SelectedIndex != 0)
        {
            if (editid == 0)
            {
                string Filename;
                if (photoupload.FileName.Substring(photoupload.FileName.Length - 3, 3) != "jpg" && photoupload.FileName.Substring(photoupload.FileName.Length - 4, 4) != "jpeg" && photoupload.FileName.Substring(photoupload.FileName.Length - 3, 3) != "gif" && photoupload.FileName.Substring(photoupload.FileName.Length - 3, 3) != "png" && photoupload.FileName.Substring(photoupload.FileName.Length - 3, 3) != "bmp" && photoupload.FileName.Substring(photoupload.FileName.Length - 3, 3) != "pdf")
                {
                    Response.Write("<script LANGUAGE='JavaScript'>alert('Select valid file')</script>");
                }
                else
                {

                    Filename = Path.GetFileName(photoupload.PostedFile.FileName);
                    photoupload.SaveAs(Server.MapPath("image/" + Filename));
                    string img = "image/" + Filename;

                    cn.Open();
                    SqlCommand cmd = new SqlCommand("insert into allocatedtask values('" + ddlemployeeid.SelectedValue + "','" + ddltypeofwork.SelectedValue + "','" + ddlcustomerid.SelectedValue + "','" + targetdate.SelectedDate.ToShortDateString() + "','" + targettime.Text + "','" + description.Text + "','" + img + "','" + date.Text + "')", cn);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Write("<script Language='Javascript'>alert('Insert Successfully')</script>");
                        cn.Close();
                        SendMail();
                        clear();
                        data();
                    }
                }
            }
            else
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("update allocatedtask set employeeid='" + ddlemployeeid.SelectedValue + "', typeofwork='" + ddltypeofwork.SelectedValue + "', customerid='" + ddlcustomerid.SelectedValue + "', targetdate='" + targetdate.SelectedDate.ToShortDateString() + "', targettime='" + targettime.Text + "', description='" + description.Text + "', photo='" + photoupload.FileName + "', date='" + date.Text + "' where Id = " + editid + "", cn);
                cmd.ExecuteNonQuery();
                Response.Write("<script Language='Javascript'>alert('Update Successfully')</script>");
                cn.Close();
                clear();
                editid = 0;
                data();
            }
        }
    }

    public void data()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select allocatedtask.ID,allocatedtask.employeeid,allocatedtask.typeofwork,allocatedtask.customerid,allocatedtask.targetdate,allocatedtask.targettime,allocatedtask.description,employee.employeename, typeofwork.typeofwork  as tow,customer.customername from allocatedtask inner join employee on allocatedtask.employeeid = employee.Id inner join typeofwork on allocatedtask.typeofwork=typeofwork.Id inner join customer on allocatedtask.customerid=customer.Id", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cn.Close();
    }
    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton del = sender as LinkButton;
        GridViewRow delrow = del.NamingContainer as GridViewRow;
        string a = GridView1.DataKeys[delrow.RowIndex].Value.ToString();
        SqlCommand cmd = new SqlCommand("delete from allocatedtask where Id='" + a + "'", cn);
        cmd.ExecuteNonQuery();
        cn.Close();
    }
    protected void lnkedit_Click(object sender, EventArgs e)
    {
        cn.Open();
        LinkButton ed = sender as LinkButton;
        GridViewRow edrow = ed.NamingContainer as GridViewRow;
        string b = GridView1.DataKeys[edrow.RowIndex].Value.ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from allocatedtask where Id='" + b + "'", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        editid = Convert.ToInt32(ds.Tables[0].Rows[0]["Id"].ToString());
        targetdate.SelectedDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["targetdate"].ToString());
        targettime.Text = ds.Tables[0].Rows[0]["targettime"].ToString();
        description.Text = ds.Tables[0].Rows[0]["description"].ToString();
        ddlemployeeid.SelectedValue = ds.Tables[0].Rows[0]["employeeid"].ToString();
        ddltypeofwork.SelectedValue = ds.Tables[0].Rows[0]["typeofwork"].ToString();
        ddlcustomerid.SelectedValue = ds.Tables[0].Rows[0]["customerid"].ToString();
        date.Text = ds.Tables[0].Rows[0]["date"].ToString();
        cn.Close();
    }
    public void getemployee()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from employee", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlemployeeid.DataSource = ds;
        ddlemployeeid.DataTextField = ds.Tables[0].Columns["employeename"].ToString();
        ddlemployeeid.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        ddlemployeeid.DataBind();
        ddlemployeeid.Items.Insert(0, "Select");
        cn.Close();

    }
    public void gettypeofwork()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from typeofwork", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddltypeofwork.DataSource = ds;
        ddltypeofwork.DataTextField = ds.Tables[0].Columns["typeofwork"].ToString();
        ddltypeofwork.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        ddltypeofwork.DataBind();
        ddltypeofwork.Items.Insert(0, "Select");
        cn.Close();
    }
    public void getcustomer()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from customer", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlcustomerid.DataSource = ds;
        ddlcustomerid.DataTextField = ds.Tables[0].Columns["customername"].ToString();
        ddlcustomerid.DataValueField = ds.Tables[0].Columns["Id"].ToString();
        ddlcustomerid.DataBind();
        ddlcustomerid.Items.Insert(0, "Select");
        cn.Close();
    }
    public void clear()
    {
        ddlemployeeid.SelectedIndex = 0;
        ddltypeofwork.SelectedIndex = 0;
        ddlcustomerid.SelectedIndex = 0;
        targettime.Text = "";
        description.Text = "";
        date.Text = "";

    }
    public void SendMail()
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from employee where id = '" + ddlemployeeid.SelectedValue + "' ", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string password = ds.Tables[0].Rows[0]["password"].ToString();
            string email = ds.Tables[0].Rows[0]["email"].ToString();
            SmtpClient mClient = new System.Net.Mail.SmtpClient();
            mClient.Port = 587;

            mClient.Host = "smtp.gmail.com";
            mClient.EnableSsl = true;
            mClient.UseDefaultCredentials = false;
            mClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

            mClient.Credentials = new System.Net.NetworkCredential("tasktracker21.21@gmail.com", "Jagrut!@Vadodara");


            System.Net.Mail.MailAddress toAddress1 = new System.Net.Mail.MailAddress(email);
            System.Net.Mail.MailAddress fromAddress1 = new System.Net.Mail.MailAddress("tasktracker21.21@gmail.com");
            System.Net.Mail.MailMessage MyMail1 = new System.Net.Mail.MailMessage(fromAddress1, toAddress1);
            MyMail1.Subject = "Task Allocated";


            MyMail1.Body = "You have been allocated a task.";
            MyMail1.IsBodyHtml = true;

            mClient.Send(MyMail1);
            clear();
        }
        
        cn.Close();
    }
   
}