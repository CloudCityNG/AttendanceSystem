using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace students.Pages
{
    public partial class StudentsAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
               
                BindGrid();
            }
        }
       

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Students"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Attendance.DataSource = dt;
                            Attendance.DataBind();
                        }
                    }
                }
            }
        }

        protected string Save()
        {
            string constr = ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = @"INSERT INTO Attendence(StudentId,StatusId) SELECT @StudentId,@StatusId;";
                    cmd.Connection = con;
                    con.Open();
                    foreach (GridViewRow row in Attendance.Rows)
                    {
                        //Get the HobbyId from the DataKey property.
                        int StudentId = Convert.ToInt32(Attendance.DataKeys[row.RowIndex].Values[0]);

                        //Get the checked value of the CheckBox.
                        bool isSelected = (row.FindControl("chkSelect") as CheckBox).Checked;
                        string chkbox = null;
                        if(isSelected==true)
                        {
                            chkbox = "1";
                        }
                        else
                        {
                            chkbox = "0";
                        }
                        //Save to database
                        try
                        {
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@StudentId", StudentId);
                            cmd.Parameters.AddWithValue("@StatusId", chkbox);
                            cmd.ExecuteNonQuery();
                        }
                        catch (SqlException ex)
                        {

                            return "Database Couldnt be inserted" + ex.Message;
                        }
                    }
                    con.Close();
                    return "Attendance successfully !";
                    
                }
            }
        }

        protected void SaveData_Click(object sender, EventArgs e)
        {
            string message;
            message=Save();
            Message.Text = message;
        }

        protected void RefereshButton_Click(object sender, EventArgs e)
        {

        }

        protected void RefereshButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/StudentsAttendance.aspx");
        }
 
       

       
    }
}