using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using students.ApplicationLogics;

namespace students.Pages
{
    public partial class Results : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                dt = new DataTable();
                MakeDataTable();
                AddToDataTable();
                BindGrid();
            }
            else
            {
                dt = (DataTable)ViewState["DataTable"];
            }
            ViewState["DataTable"] = dt;
        }

        private void MakeDataTable()
        {
            dt.Columns.Add("Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("Present_Days");
            dt.Columns.Add("Absent_Days");
           
        }

      
        private void AddToDataTable()
        {
            get_students_attendance();
        }

        private void BindGrid()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        

        public void get_students_attendance()
        {
            string connectionString,sql;
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["StudentsConnectionString"].ConnectionString;
            using (SqlConnection sqlConnection=new SqlConnection(connectionString))
            {
                sqlConnection.Open();
                sql = @"Select *from Students;";
                using (SqlCommand sqlCommand=new SqlCommand(sql,sqlConnection))
                {
                    using (SqlDataAdapter sqlDataAdapter=new SqlDataAdapter(sqlCommand))
                    {
                            using(DataTable dataTabale=new DataTable())
                           {

                               sqlDataAdapter.Fill(dataTabale);
                               int count = dataTabale.Rows.Count;
                                for (int i=0 ;i<count; i++)
                                {
                                    string name,address,absent,present,studentid;
                                    studentid=Convert.ToString(dataTabale.Rows[i]["StudentId"]);
                                    name = Convert.ToString(dataTabale.Rows[i]["Name"]);
                                    address = Convert.ToString(dataTabale.Rows[i]["Address"]);
                                    present = DataExtraction.count_attendence(studentid, "1");
                                    absent = DataExtraction.count_attendence(studentid, "0");
                                    DataRow dr = dt.NewRow();
                                    dr["Name"] = name;
                                    dr["Address"] = address;
                                    dr["Present_Days"] = present;
                                    dr["Absent_Days"] = absent;

                                    dt.Rows.Add(dr);
                                }
                           }
                    }
                }

            }
        }
    }
}