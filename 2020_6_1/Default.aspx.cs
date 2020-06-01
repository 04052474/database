using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        MultiView1.ActiveViewIndex = Convert.ToInt32(Menu1.SelectedValue);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection("Data Source=AA201-35\\SQLEXPRESS;Initial Catalog=選課系統;User ID=test;Password=test");
        Conn.Open();

        //註解：第二、執行SQL指令，使用ExecuteNonQuery
        string InsertCmd;
        InsertCmd = "Insert Into 科系代碼資料表(系碼,系名,系主任) Values('" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "')";
        SqlCommand cmd = new SqlCommand(InsertCmd, Conn);
        cmd.ExecuteNonQuery();

        Response.Write("新增成功！");
        //註解：第四、關閉資源
        cmd.Dispose();
        Conn.Close();
        Conn.Dispose();
        ShowDepartments();

    }

    void ShowDepartments()  //設定系碼[顯示科系代碼表]
    {
        SqlConnection Conn = new SqlConnection("Data Source=AA201-35\\SQLEXPRESS;Initial Catalog=選課系統;User ID=test;Password=test");
        Conn.Open();

        string SelectCmd;
        SelectCmd = "select * from 科系代碼資料表 order by 系碼 ASC";
        SqlCommand cmd = new SqlCommand(SelectCmd, Conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Departments");//使用DataAdapter的Fill方法(填充)，呼叫SELECT命令  

        //GridView1.DataSource = ds.Tables["Departments"];
        GridView1.DataBind();
        cmd.Dispose();
        Conn.Close();
        Conn.Dispose();
    }

}