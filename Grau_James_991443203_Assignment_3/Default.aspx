<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Default" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Login | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body>
        <div class="d-flex justify-content-center row">
            <form id="loginForm" runat="server" class="col-lg-4">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" runat="server" />
                </div>
            
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" runat="server" />
                </div>
            
                <button type="submit" class="btn btn-primary float-right">Submit</button>
            </form>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
