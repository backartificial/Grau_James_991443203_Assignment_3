<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Default" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Login | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body class="bg-dark d-flex align-items-center justify-content-center">
        <form id="loginForm" runat="server" class="col-lg-4 bg-light pt-2 pb-2 rounded">
            <div class="modal-header mb-2">
                <h5 class="modal-title">Login | Sheridan Cars</h5>
            </div>

            <div runat="server" id="loginErrors" class="mb-2 alert alert-danger d-none"></div>
                
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" placeholder="Username" runat="server" required autofocus />
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" placeholder="Password" runat="server" required />
            </div>
                
            <div class="btn-group float-right" role="group">
                <a href="Registration.aspx" class="btn btn-info">Register</a>
                <button type="submit" class="btn btn-primary" id="btnLogin">Submit</button>
            </div>
        </form>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
