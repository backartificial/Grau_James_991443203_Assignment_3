using System;
using System.Data.SqlClient;

namespace Grau_James_991443203_Assignment_3 {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            // Check if the page is being posted to
            if(IsPostBack) {
                // Set the needed variables
                System.Collections.Specialized.NameValueCollection frmData = Request.Form;
                string connectionString = "Data Source=JAMES-SHERIDAN-\\JAMESGRAUSQLSERV;Initial Catalog=CarSalesDB;Integrated Security=SSPI;Persist Security Info=False";
                SqlConnection connection = new SqlConnection(connectionString);

                // Try and connection to the DB
                try {
                    // Open the connection to the DB
                    connection.Open();

                    // Create and set the needed variables
                    SqlCommand command = new SqlCommand("SELECT * FROM dbo.Customers WHERE username = @username", connection);
                    command.Parameters.AddWithValue("@username", frmData["username"]);

                    // Execute the query and get the result(s)
                    SqlDataReader reader = command.ExecuteReader();

                    // Check to make sure that there is more than 0 returned users stored in the data table
                    if(reader.HasRows) {
                        // Check to make sure that the returned row has data
                        if(reader.Read()) {
                            // Check to make sure that the entered password matches the DB password
                            if(frmData["password"].Equals(reader["password"])) {
                                // Create the session

                                // Move to the profile page
                                Response.Write("PASSWORD MATCH");
                            }
                        }
                    }

                    // Close the DB Connection
                    connection.Close();
                } catch (Exception ex) {
                    // Print Connection Error to DB
                    Response.Write("Error in connection ! ---- " + ex.Message);
                }
            }
        }
    }
}