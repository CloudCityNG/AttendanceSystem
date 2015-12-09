using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace students.DatabaseLayer
{
    public class students
    {
        public static string Insert( string name,string address, byte[] photo)
        {
            string connectionString;
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;
            using(SqlConnection sqlConnection=new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                string sql;
                sql=@"INSERT INTO Students(Name, Address,Photo) 
                                SELECT @Name, @Address, @Photo;";
                using(SqlCommand sqlCommand=new SqlCommand(sql,sqlConnection))
                {
                    SqlParameter Photo = new SqlParameter("@Photo", SqlDbType.Image, photo.Length);
                    Photo.Value = photo;
                    sqlCommand.Parameters.Add(Photo);
                    sqlCommand.Parameters.AddWithValue("@Name", name);
                    sqlCommand.Parameters.AddWithValue("@Address", address);
                    try
                    {
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {

                        return "Data could not be inserted" + ex.Message;
                    }
                    return "Data Insert Successfully";
                }
            }
        }
    }
}