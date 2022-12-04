using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class MyCompleteTask : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            data();
        }
    }
    public void data()
    {
        cn.Open();
        string eid = Session["EmpId"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("select allocatedtask.ID,allocatedtask.employeeid,allocatedtask.typeofwork,allocatedtask.customerid,allocatedtask.targetdate,allocatedtask.targettime,allocatedtask.description,employee.employeename, typeofwork.typeofwork  as tow,customer.customername from allocatedtask inner join employee on allocatedtask.employeeid = employee.Id inner join typeofwork on allocatedtask.typeofwork=typeofwork.Id inner join customer on allocatedtask.customerid=customer.Id where allocatedtask.employeeid='" + eid + "' and allocatedtask.Id in (select Taskid from completetask where Taskid=allocatedtask.Id)", cn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cn.Close();
    }
}