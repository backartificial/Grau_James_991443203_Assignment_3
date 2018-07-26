<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Default" UnobtrusiveValidationMode="None" %>

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
            <asp:ValidationSummary runat="server" ID="ValidationSummaryLogin" DisplayMode="BulletList" ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" />
                
            <div class="form-group">
                <label>Username</label>

                <asp:TextBox runat="server" CssClass="form-control" ID="UserName" placeholder="Username" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ErrorMessage="Please enter your Username." ControlToValidate="UserName" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
            </div>
            
            <div class="form-group">
                <label>Password</label>

                <asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" placeholder="Password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter your Password." ControlToValidate="Password" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
            </div>

            <a href="Registration.aspx" class="btn btn-info float-left">Register</a>
            <asp:Button runat="server" ID="Login" CommandName="Login" CssClass="btn btn-default btn-primary float-right" Text="Login" />
        </form>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
