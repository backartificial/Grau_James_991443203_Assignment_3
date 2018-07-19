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
            <form id="loginForm" runat="server" class="col-lg-4 bg-light pt-2 pb-2 rounded">
                <h1>Customer Registration</h1>

                <div runat="server" id="registrationSuccess" class="mt-2 mb-2 alert alert-success d-none">Success! You have been successfully registered! You can now <a href="Default.aspx">login!</a></div>

                <div class="modal-header">
                    <h5 class="modal-title">Personal Information</h5>
                </div>
                
                <div runat="server" id="registrationPersonalErrors" class="mt-2 mb-2 alert alert-danger d-none"></div>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Full Name" runat="server" required autofocus />
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Address" runat="server" required />
                </div>

                <div class="form-group">
                    <label for="postalCode">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" max="7" maxlength="7" placeholder="Postal Code" runat="server" pattern="^[A-Za-z][0-9][A-Za-z].?[0-9][A-Za-z][0-9]$" title="Format: (A1B2C3) or (A1B 2C3)" required />
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" placeholder="Phone Number" runat="server" pattern="^(\(|)\d{3}(\)|)([\-]| )\d{3}([\-]| )\d{4}$" title="Format: (123-123-1234) or ((123) 123-1234)" required />
                </div>

                <div class="modal-header">
                    <h5 class="modal-title">Account Information</h5>
                </div>

                <div runat="server" id="registrationAccountErrors" class="mt-2 mb-2 alert alert-danger d-none"></div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email Address" runat="server" required />
                </div>
                
                <div class="form-group">
                    <label for="emailConfirm">Confirm Email</label>
                    <input type="email" class="form-control" id="emailConfirm" placeholder="Confirm Email Address" runat="server" required />
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" runat="server" required />
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" runat="server" required />
                </div>
                
                <div class="form-group">
                    <label for="passwordConfirm">Confirm Password</label>
                    <input type="password" class="form-control" id="passwordConfirm" placeholder="Confirm Password" runat="server" required />
                </div>
            
                <div class="btn-group float-right" role="group">
                    <a href="Default.aspx" class="btn btn-info">Login</a>
                    <button type="submit" class="btn btn-primary" id="btnRegister">Submit</button>
                </div>
            </form>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
