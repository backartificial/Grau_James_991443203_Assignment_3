// Include the needed package
using System;

// This is the name space at which this file resides
namespace Grau_James_991443203_Assignment_3 {
    // This the the Logouts class
    public partial class Logout : System.Web.UI.Page {
        // This method is performed when the user desides to logout
        protected void Page_Load(object sender, EventArgs e) {
            // Clean any Session variables
            Session.Clear();

            // Redirect to the Default/login page
            Response.Redirect("Default.aspx");
        }
    }
}