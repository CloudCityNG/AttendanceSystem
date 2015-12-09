using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace students.ApplicationLogics.Utilities
{
    public partial class ImageLoad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = string.Empty;

            try
            {
                string StudentId = Context.Request.QueryString["PhotoId"];
                sql = "SELECT Photo FROM Students WHERE StudentId=@StudentId;";
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    using (SqlCommand command = new SqlCommand(sql, con))
                    {
                        command.Parameters.AddWithValue("@StudentId", StudentId);

                        byte[] imageContent = (byte[])command.ExecuteScalar();
                        if (imageContent != null)
                        {
                            Response.ContentType = "image/jpeg";
                            Response.Expires = 0;
                            Response.Buffer = true;
                            Response.Clear();
                            Response.BinaryWrite(imageContent);
                            Response.End();
                        }
                    }
                    con.Close();
                }
            }
            catch (SqlException ex)
            {

            }

        }
    }
}