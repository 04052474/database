using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DAL;

public partial class CourseSystem2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            ShowStudents();    //呼叫顯示科系代碼選項
        }
        else
        {
            Display_Student();
        }

    }
    void ShowStudents()  //學生管理[顯示學生管理表]
    {
        string SelectCmd;
        SelectCmd = "select 學號, 姓名, 系名 from 學生系名查詢";
        DataSet ds = SQLDataAccess.SQLGetDataSet(SelectCmd);
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();
    }
    void Display_Student()
    {
        string SelectCmd;
        SelectCmd = "select * from 學生資料表";
        DataTable dt = SQLDataAccess.SQLGetDataSet(SelectCmd).Tables[0];
        int i;
        //顯示資料表欄位的所有資料
        if (dt.Rows.Count > 0)
        {
            for (i = 0; i < dt.Rows.Count; i++)
            {
                DataRow drOperate = dt.Rows[i];
                DropDownList3.Items.Add(drOperate["學號"] + "/" + drOperate["姓名"]);
            }
        }
    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        MultiView1.ActiveViewIndex = Convert.ToInt32(Menu1.SelectedValue);
    }

    void ShowDepartments()  //設定系碼[顯示科系代碼表]
    {
        //string SelectCmd;
        //SelectCmd = "select * from 科系代碼資料表 order by 系碼 ASC";
        //DataSet ds = SQLDataAccess.SQLGetDataSet(SelectCmd);
        GridView1.DataBind();
    }

    void ShowCourses()  //課程管理[顯示課程管理表]
    {
        //string SelectCmd;
        //SelectCmd = "select * from 課程資料表 order by 課號 ASC";
        //SelectCmd = "select * from 科系代碼資料表 order by 系碼 ASC";
        //DataSet ds = SQLDataAccess.SQLGetDataSet(SelectCmd);
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string InsertCmd;
        InsertCmd = "Insert Into 科系代碼資料表(系碼,系名,系主任) Values('" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "')";
        SQLDataAccess.SQLUpdateInsertDelete(InsertCmd);

        Response.Write("新增成功！");
        ShowDepartments();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sp;
        if (RadioButton1.Checked == true)
            sp = "必";
        else
            sp = "選";
        string InsertCmd;
        InsertCmd = "Insert Into 課程資料表(課號,課名,學分數,必選修) Values('" + TextBox4.Text.Trim() + "','" + TextBox5.Text.Trim() + "','" + DropDownList1.Text.Trim() + "','" + sp + "')";
        SQLDataAccess.SQLUpdateInsertDelete(InsertCmd);

        Response.Write("新增成功！");
        ShowCourses();
    }
    //三、學生管理[新增功能]
    protected void Button3_Click(object sender, EventArgs e)
    {
        string Str = DropDownList2.Text.Trim();
        string SelectCmd = "select 系碼 from 科系代碼資料表 where 系名=" + "'" + Str + "'";
        string departmentID = (string)SQLDataAccess.SQLGetScalar(SelectCmd);
        string InsertCmd = "Insert Into 學生資料表(學號,姓名,系碼) Values('" + TextBox6.Text.Trim() + "','" + TextBox7.Text.Trim() + "','" + departmentID + "')";

        SQLDataAccess.SQLUpdateInsertDelete(InsertCmd);
        Response.Write("新增成功！");
        ShowStudents();
    }
    //三、學生管理[修改功能]
    protected void Button4_Click(object sender, EventArgs e)
    {
        string Str = DropDownList2.Text.Trim();
        string SelectCmd;
        SelectCmd = "select 系碼 from 科系代碼資料表 where 系名=" + "'" + Str + "'";
        string departmentID = (string)SQLDataAccess.SQLGetScalar(SelectCmd);
        string UpdateCmd;
        UpdateCmd = "UPDATE 學生資料表 SET 學號='" + TextBox6.Text.Trim() + "',姓名='" + TextBox7.Text.Trim() + "' ,系碼='" + departmentID + "' WHERE 學號='" + TextBox6.Text.Trim() + "'";
        SQLDataAccess.SQLUpdateInsertDelete(UpdateCmd);

        Response.Write("修改成功！");
        ShowStudents();
    }
    //三、學生管理[刪除功能]
    protected void Button5_Click(object sender, EventArgs e)
    {
        ID = TextBox6.Text;
        string DeleteCmd;
        DeleteCmd = "Delete From 學生資料表 WHERE 學號='" + ID + "'";
        SQLDataAccess.SQLUpdateInsertDelete(DeleteCmd);

        Response.Write("刪除成功！");
        //註解：第四、關閉資源
        ShowStudents();
    }
    //四、查詢選課[查詢功能]
    protected void Button6_Click(object sender, EventArgs e)
    {
        string SelectCmd;
        string Str = DropDownList3.Text.Trim();
        SelectCmd = "select 學生資料表.學號,姓名,課名,學分數 from 科系代碼資料表,學生資料表,選課資料表,課程資料表 where 學生資料表.系碼=科系代碼資料表.系碼 And 學生資料表.學號=選課資料表.學號 And 選課資料表.課號=課程資料表.課號 And 選課資料表.學號='" + Str.Substring(0, 5) + "'";
        DataSet ds = SQLDataAccess.SQLGetDataSet(SelectCmd);
        GridView4.DataSource = ds.Tables[0];
        GridView4.DataBind();
    }




}