
// Include the needed packages
using System;
using System.Data.SqlClient;

// This is the name space at which this file resides
namespace Grau_James_991443203_Assignment_3 {
    // This the the Default pages class
    public partial class Default : System.Web.UI.Page {
        // This method is performed when the page is loaded
        protected void Page_Load(object sender, EventArgs e) {
            // Check if there is a set session
            if(Session["signedIn"] != null && Session["signedIn"].Equals("True")) {
                // Redirect the user to the profile page
                Response.Redirect("Profile.aspx");
            }

            // Check if the page is being posted to
            if(IsPostBack) {
                // Store the form data into a collection
                System.Collections.Specialized.NameValueCollection frmData = Request.Form;

                // Set the database connection instance
                SqlConnection connection = new SqlConnection(Properties.Settings.Default.DBConnectionString);

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
                    if (reader.HasRows) {
                        // Check to make sure that the returned row has data
                        if (reader.Read()) {
                            // Take the entered password and hash it using SHA-512
                            string passwordHash = (BitConverter.ToString(new System.Security.Cryptography.SHA512Managed().ComputeHash(System.Text.Encoding.UTF8.GetBytes(frmData["password"]))).Replace("-", "").ToLower()).ToString();

                            // Check to make sure that the entered password matches the DB password
                            if (passwordHash.Equals(reader["password"])) {
                                // Convert Error Message to success message
                                loginErrors.InnerText = "Success! You are now being logged in!";
                                loginErrors.Attributes.Add("class", loginErrors.Attributes["class"].Replace("alert-danger", "alert-success"));
                                loginErrors.Attributes.Add("class", loginErrors.Attributes["class"].Replace("d-none", ""));

                                // Create the session variables
                                Session.Add("signedIn", "True");
                                Session.Add("id", reader["id"].ToString());
                                Session.Add("name", reader["name"].ToString());
                                Session.Add("username", reader["username"].ToString());
                                Session.Add("email", reader["email"].ToString());
                                Session.Add("phoneNumber", reader["phoneNumber"].ToString());
                                Session.Add("address", reader["address"].ToString());
                                Session.Add("postalCode", reader["postalCode"].ToString());

                                // Move to the profile page
                                Response.Redirect("Profile.aspx");
                            } else {
                                // Display error message
                                loginErrors.InnerText = "Oops... Your username/password cannot be validated.  Please try again.";
                                loginErrors.Attributes.Add("class", loginErrors.Attributes["class"].Replace("d-none", ""));
                            }
                        }
                    } else {
                        // Display error message
                        loginErrors.InnerText = "Oops...  Looks like that account is not registered.  You can go ahead and register that account!";
                        loginErrors.Attributes.Add("class", "alert alert-danger");
                        loginErrors.Attributes.Add("class", loginErrors.Attributes["class"].Replace("d-none", ""));
                    }
                } catch (Exception ex) {
                    // Print Connection Error to DB
                    // Display error message
                    loginErrors.InnerText = "Oops...  Looks like something went wrong.  Please try again. (" + ex.Message + ")";
                    loginErrors.Attributes.Add("class", "alert alert-danger");
                    loginErrors.Attributes.Add("class", loginErrors.Attributes["class"].Replace("d-none", ""));
                } finally {
                    // Close the DB Connection
                    connection.Close();
                }
            }
        }
    }
}