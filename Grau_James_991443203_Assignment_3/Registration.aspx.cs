﻿using System;
using System.Data.SqlClient;

namespace Grau_James_991443203_Assignment_3 {
    public partial class Registration : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            // Check if the page is being posted to
            if(IsPostBack) {
                // Store the form data into an array
                System.Collections.Specialized.NameValueCollection frmData = Request.Form;

                // Perform needed checks
                // Check if the entered email addresses match
                if(frmData["email"].ToLower().Equals(frmData["emailConfirm"].ToLower())) {
                    // Check if the entered passwords match
                    if (frmData["password"].Equals(frmData["passwordConfirm"])) {
                        // Take the entered password and hash it using SHA-512
                        string passwordHash = (BitConverter.ToString(new System.Security.Cryptography.SHA512Managed().ComputeHash(System.Text.Encoding.UTF8.GetBytes(frmData["password"]))).Replace("-", "").ToLower()).ToString();

                        // Set the database connection instance
                        SqlConnection connection = new SqlConnection(Properties.Settings.Default.DBConnectionString);

                        // Try and check to make sure that, that user name is not taken
                        try {
                            // Open the connection to the DB
                            connection.Open();

                            // Create and set the needed variables
                            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM dbo.Customers WHERE username = @username", connection);
                            command.Parameters.AddWithValue("@username", frmData["username"]);

                            Int32 count = (Int32)command.ExecuteScalar();

                            // Check to make sure that there is more than 0 returned users stored in the data table
                            if (count > 0) {
                                // Display email not matching error
                                registrationAccountErrors.InnerText = "Oops... That username is already taken.  Please try again.";                                
                                registrationAccountErrors.Attributes.Add("class", registrationAccountErrors.Attributes["class"].Replace("d-none", ""));

                                // Return out of validation
                                return;
                            }
                        } catch(Exception ex) {
                            // Print Connection Error to DB
                            // Display error message
                            registrationSuccess.InnerText = "Oops...  Looks like something went wrong.  Please try again. (" + ex.Message + ")";
                            registrationSuccess.Attributes.Add("class", "alert alert-danger");
                            registrationSuccess.Attributes.Add("class", registrationSuccess.Attributes["class"].Replace("d-none", ""));
                            registrationSuccess.Attributes.Add("class", registrationSuccess.Attributes["class"].Replace("success", "danger"));
                        } finally {
                            // Close the connection to the database
                            connection.Close();
                        }

                        // Try and connection to the DB
                        try {
                            // Open the connection to the DB
                            connection.Open();

                            // Create and set the needed variables
                            SqlCommand command = new SqlCommand("INSERT INTO dbo.Customers (username, email, password, name, address, postalCode, phoneNumber) VALUES (@username, @email, @password, @name, @address, @postalcode, @phoneNumber)", connection);
                            command.Parameters.AddWithValue("@username", frmData["username"]);
                            command.Parameters.AddWithValue("@email", frmData["email"]);
                            command.Parameters.AddWithValue("@password", passwordHash);
                            command.Parameters.AddWithValue("@name", frmData["name"]);
                            command.Parameters.AddWithValue("@address", frmData["address"]);
                            command.Parameters.AddWithValue("@postalCode", frmData["postalCode"]);
                            command.Parameters.AddWithValue("@phoneNumber", frmData["phoneNumber"]);

                            // Execute the query and insert into the database
                            command.ExecuteNonQuery();

                            // Display the success Message and hide any error messages
                            registrationSuccess.Attributes.Add("class", registrationSuccess.Attributes["class"].Replace("d-none", ""));
                            registrationPersonalErrors.Attributes.Add("class", "d-none");
                            registrationAccountErrors.Attributes.Add("class", "d-none");
                        }catch(Exception ex) {
                            // Print Connection Error to DB
                            // Display error message
                            registrationSuccess.InnerText = "Oops...  Looks like something went wrong.  Please try again. (" + ex.Message + ")";
                            registrationSuccess.Attributes.Add("class", "alert alert-danger");
                            registrationSuccess.Attributes.Add("class", registrationSuccess.Attributes["class"].Replace("d-none", ""));
                            registrationSuccess.Attributes.Add("class", registrationSuccess.Attributes["class"].Replace("success", "danger"));
                        } finally{
                            // Close the connection to the database
                            connection.Close();
                        }

                        // Close the connection to the DB
                        connection.Close();
                    } else{
                        // Display password not matching error
                        registrationAccountErrors.InnerText = "Oops... The passwords you've entered do not match.  Please try again.";
                        registrationAccountErrors.Attributes.Add("class", registrationAccountErrors.Attributes["class"].Replace("d-none", ""));
                    }
                }else{
                    // Display email not matching error
                    registrationAccountErrors.InnerText = "Oops... The email address you've entered do not match.  Please try again.";
                    registrationAccountErrors.Attributes.Add("class", registrationAccountErrors.Attributes["class"].Replace("d-none", ""));
                }
            }
        }
    }
}