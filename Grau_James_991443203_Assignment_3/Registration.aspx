<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Registration" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Register | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body class="bg-dark">
        <div class="d-flex justify-content-center row">
            <form id="loginForm" runat="server" class="col-lg-4 bg-light">
                <h1>Customer Registration</h1>

                <div class="modal-header">
                    <h5 class="modal-title">Personal Information</h5>
                </div>

                <br />

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Full Name" runat="server" />
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Address" runat="server" />
                </div>

                <div class="form-group">
                    <label for="postalCode">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" max="7" maxlength="7" placeholder="Postal Code" runat="server" />
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" placeholder="Phone Number" runat="server" />
                </div>

                <div class="modal-header">
                    <h5 class="modal-title">Account Information</h5>
                </div>

                <br />

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email Address" runat="server" />
                </div>
                
                <div class="form-group">
                    <label for="emailConfirm">Confirm Email</label>
                    <input type="email" class="form-control" id="emailConfirm" placeholder="Confirm Email Address" runat="server" />
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" runat="server" />
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" runat="server" />
                </div>
                
                <div class="form-group">
                    <label for="passwordConfirm">Confirm Password</label>
                    <input type="password" class="form-control" id="passwordConfirm" placeholder="Confirm Password" runat="server" />
                </div>
            
                <button type="submit" class="btn btn-success float-right">Register</button>
                <br />
                <br />
            </form>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
