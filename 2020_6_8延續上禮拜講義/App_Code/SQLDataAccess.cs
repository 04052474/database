using System;
using System.Data;
using System.Xml;
using System.Data.SqlClient; //引入此命名空間，對SQL Server資料庫進行操作
using System.Collections;
using System.Configuration;


namespace DAL
{
    public sealed class SQLDataAccess
    {
        //讀取存放在web.config檔裡的資料庫連接字串
        static string ConnectionString = ConfigurationManager.ConnectionStrings["選課系統ConnectionString"].ToString();
        //封裝Command物件的ExecuteNonQuery方法，對資料庫進行更新，刪除和插入資料
        public static void SQLUpdateInsertDelete(string sql)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        //返回一個資料集DataSet
        public static DataSet SQLGetDataSet(string sql)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                SqlDataAdapter sda = new SqlDataAdapter(sql, conn);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
        }

        //返回一個資料集DataSet
        public static SqlDataReader SQLGetDataReader(string sql)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                return reader;
            }
        }

        //封裝Command物件的ExecuetScalar方法，返回SQL查詢語句的首行首列
        public static object SQLGetScalar(string sql)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                return cmd.ExecuteScalar();
            }
        }
    }
}
