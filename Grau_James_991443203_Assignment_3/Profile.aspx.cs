using System;

namespace Grau_James_991443203_Assignment_3 {
    public partial class Profile : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            // Check if there is no active session
            if (Session["signedIn"] != null &&  !Session["signedIn"].Equals("True")) {
                // Redirect the user to the login page as they're not logged in
                Response.Redirect("Default.aspx");
            }
        }
    }
}