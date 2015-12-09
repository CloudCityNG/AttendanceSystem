using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace students.ApplicationLogics
{
    public class DataExtraction
    {
        public static string count_attendence(string studentid,string statusId)
        {
            string count="0";
            string result;
            string connectionString;
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;
            using(SqlConnection sqlConnection=new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                string sql = @"SELECT COUNT(*) FROM Attendence where StudentId=@StudentId and StatusId=@StatusId;";
                using(SqlCommand sqlCommand=new SqlCommand(sql,sqlConnection))
                {
                    sqlCommand.Parameters.AddWithValue("@StudentId", studentid);
                    sqlCommand.Parameters.AddWithValue("@StatusId", statusId);
                    try
                    {
                        result = Convert.ToString(sqlCommand.ExecuteScalar());
                         if(result=="" || result==null)
                         {
                             return count;
                         }
                        else
                         {
                            return result;
                         }
                    }
                    catch (SqlException ex)
                    {
                        return "";
                        
                    }
                }
            }
           
        }
    }
}