using System;
using System.Data.SqlClient;

namespace Grau_James_991443203_Assignment_3 {
    public partial class Profile : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            // Check if there is no active session
            if (Session["signedIn"] == null || !Session["signedIn"].Equals("True")) {
                // Redirect the user to the login page as they're not logged in
                Response.Redirect("Default.aspx");
            }

            // Set the database connection instance
            SqlConnection connection = new SqlConnection(Properties.Settings.Default.DBConnectionString);

            // Check if the page is being posted to
            if(IsPostBack) {
                // Store the form data into a collection
                System.Collections.Specialized.NameValueCollection frmData = Request.Form;

                // Check if year is not empty
                if(frmData["year"] == null || frmData["year"].Trim().Equals("")) {
                    // Display error message
                    placeOrderErrors.InnerText = "Oops...  You forgot the fill in the year.  Please try again.";
                    placeOrderErrors.Attributes.Add("class", placeOrderErrors.Attributes["class"].Replace("d-none", ""));
                }else{
                    // Try and connection to the DB
                    try {
                        // Open the connection to the DB
                        connection.Open();

                        // Create and set the needed variables
                        SqlCommand command = new SqlCommand("INSERT INTO dbo.Orders (customer, brand, model, year, color, price) VALUES (@customer, @brand, @model, @year, @color, @price)", connection);
                        command.Parameters.AddWithValue("@customer", Session["id"]);
                        command.Parameters.AddWithValue("@brand", frmData["Brand"]);
                        command.Parameters.AddWithValue("@model", frmData["Model"]);
                        command.Parameters.AddWithValue("@year", frmData["Year"]);
                        command.Parameters.AddWithValue("@color", frmData["Color"]);
                        command.Parameters.AddWithValue("@price", frmData["Price"]);

                        // Execute the query and insert into the database
                        command.ExecuteNonQuery();

                        // Display the success Message and hide any error messages
                        placeOrderErrors.InnerText = "Success! Your order has been placed!";
                        placeOrderErrors.Attributes.Add("class", "alert alert-success");
                        placeOrderErrors.Attributes.Add("class", placeOrderErrors.Attributes["class"].Replace("d-none", ""));
                    }catch (Exception ex) {
                        // Print Connection Error to DB
                        // Display error message
                        placeOrderErrors.InnerText = "Oops...  Looks like something went wrong.  Please try again. (" + ex.Message + ")";
                        placeOrderErrors.Attributes.Add("class", "alert alert-danger");
                        placeOrderErrors.Attributes.Add("class", placeOrderErrors.Attributes["class"].Replace("d-none", ""));
                        placeOrderErrors.Attributes.Add("class", placeOrderErrors.Attributes["class"].Replace("success", "danger"));
                    } finally{ 
                        // Close the connection to the database
                        connection.Close();
                    }
                }
            }

            // Try and connect and get all customer orders
            try {
                // Open the connection to the DB
                connection.Open();

                // Create and set the needed variables
                SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM dbo.ORDERS WHERE customer = @id", connection);
                command.Parameters.AddWithValue("@id", Session["id"]);

                // Store the count of returned items
                Int32 count = (Int32)command.ExecuteScalar();

                // Check to make sure that there is more than 0 returned orders stored in the data table
                if (count > 0) {
                    // Set the command to a new SQL Query and bind the customers id
                    command = new SqlCommand("SELECT * FROM dbo.ORDERS WHERE customer = @id", connection);
                    command.Parameters.AddWithValue("@id", Session["id"]);

                    // Using the reader, perform the writing of data
                    using (SqlDataReader reader = command.ExecuteReader()) {
                        // Clear the list of Previous Orders
                        previousOrders.InnerHtml = "";

                        // Loop through each returned item and add it to the list
                        while (reader.Read()) {
                            // Append the list item to the list
                            previousOrders.InnerHtml = previousOrders.InnerHtml + "<div class='list-group-item flex-column align-items-start'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>" + reader["year"] + " " + reader["brand"] + " " + reader["model"] + " ($" + Math.Round(double.Parse(reader["price"].ToString()), 2) + ") - " + reader["color"] + "</h5><time class='timeago' datetime='" + DateTime.Parse(reader["orderdate"].ToString()) + "'>" + DateTime.Parse(reader["orderdate"].ToString()) + "</time><small></small></div></div>";
                        }
                    }
                }else{
                    // Add the message to display customer has no previous orders
                    previousOrders.InnerHtml = "<div class='list-group-item flex-column align-items-start'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>Oops... You don't have any Previous Orders.</h5></div></div>";
                }
            } catch (Exception ex) {
                // Display error message
                previousOrders.InnerHtml = "<div class='list-group-item flex-column align-items-start'><div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>Oops... Something happened. Please try again later (" + ex.Message + ").</h5></div></div>";
            } finally {
                // Close the connection to the database
                connection.Close();
            }
        }
    }
}