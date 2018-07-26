<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Registration" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Register | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body class="bg-dark">
        <form id="loginForm" runat="server" class="col-lg-4 bg-light pt-2 pb-2 rounded" style="margin: 0 auto;">
            <h2>Customer Registration</h2>

            <div runat="server" id="registrationSuccess" class="mt-2 mb-2 alert alert-success d-none">Success! You have been successfully registered! You can now <a href="Default.aspx">login!</a></div>

            <div class="modal-header mb-2">
                <h5 class="modal-title">Personal Information</h5>
            </div>
                
            <asp:ValidationSummary runat="server" ID="ValidationSummaryRegisterationPersonal" Display="Dynamic" DisplayMode="BulletList" ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" ValidationGroup="Personal" />

            <div class="form-group">
                <label>Name</label>
                
                <asp:TextBox runat="server" CssClass="form-control" ID="FullName" placeholder="Full Name" ValidationGroup="Personal" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFullName" runat="server" ErrorMessage="Please enter your Full Name." ControlToValidate="FullName" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ValidationGroup="Personal" />
            </div>

            <div class="row">
                <div class="form-group col-lg-6">
                    <label>Address</label>
                
                <asp:TextBox runat="server" CssClass="form-control" ID="Address" placeholder="Address" ValidationGroup="Personal" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="Please enter your Address." ControlToValidate="Address" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ValidationGroup="Personal" />
                </div>

                <div class="form-group col-lg-6">
                    <label>Postal Code</label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="PostalCode" placeholder="Postal Code" ValidationGroup="Personal" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostalCode" runat="server" ControlToValidate="PostalCode" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter your Postal Code." ValidationGroup="Personal" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPostalCode" runat="server" ControlToValidate="PostalCode" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter a Correct Postal Code" ValidationExpression="^[A-Za-z][0-9][A-Za-z].?[0-9][A-Za-z][0-9]$" ValidationGroup="Personal" />
                </div>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                
                <asp:TextBox runat="server" CssClass="form-control" ID="PhoneNumber" placeholder="Phone Number" ValidationGroup="Personal" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhoneNumber" runat="server" ControlToValidate="PhoneNumber" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter your Phone Number." ValidationGroup="Personal" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhoneNumber" runat="server" ControlToValidate="PhoneNumber" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter a Correct Phone Number" ValidationExpression="^(\(|)\d{3}(\)|)([\-]| )\d{3}([\-]| )\d{4}$" ValidationGroup="Personal" />
            </div>

            <div class="modal-header mb-2">
                <h5 class="modal-title">Account Information</h5>
            </div>

            <div runat="server" id="registrationAccountErrors" class="mt-2 mb-2 alert alert-danger d-none"></div>
            <asp:ValidationSummary runat="server" ID="ValidationSummaryRegistrationAccount" Display="Dynamic" DisplayMode="BulletList" ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" ValidationGroup="Account" />

            <div class="form-group">
                <label>Username</label>
                
                <asp:TextBox runat="server" CssClass="form-control" ID="UserName" placeholder="Username" ValidationGroup="Account" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ErrorMessage="Please enter your Username." ControlToValidate="USerName" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ValidationGroup="Account" />
            </div>

            <div class="row">
                <div class="form-group col-lg-6">
                    <label>Email</label>
                
                    <asp:TextBox runat="server" CssClass="form-control" ID="Email" placeholder="Email" ValidationGroup="Account" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="Email" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter your Email Address." ValidationGroup="Account" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="Email" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter a Correct Email Address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Account" />
                </div>
                
                <div class="form-group col-lg-6">
                    <label>Confirm Email</label>
                
                    <asp:TextBox runat="server" CssClass="form-control" ID="EmailConfirm" placeholder="Confirm Email" ValidationGroup="Account" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmailConfirm" runat="server" ControlToValidate="EmailConfirm" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter your confirmation Email Address." ValidationGroup="Account"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmailConfirm" runat="server" ControlToValidate="EmailConfirm" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ErrorMessage="Please enter a Correct confirmation Email Address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Account" />
                    <asp:CompareValidator ID="EmailMatch" runat="server" ControlToValidate="Email" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ControlToCompare="EmailConfirm" ErrorMessage="Email Address don't match." ValidationGroup="Account" />
                </div>
            </div>

            <div class="row">   
                <div class="form-group col-lg-6">
                    <label>Password</label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="Password" TextMode="Password" placeholder="Password" ValidationGroup="Account" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Please enter your Password." ControlToValidate="Password" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ValidationGroup="Account" />
                </div>
                
                <div class="form-group col-lg-6">
                    <label for="passwordConfirm">Confirm Password</label>

                    <asp:TextBox runat="server" CssClass="form-control" ID="PasswordConfirm" TextMode="Password" placeholder="Confirm Password" ValidationGroup="Account" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPasswordConfirm" runat="server" ErrorMessage="Please enter your confirmation Password." ControlToValidate="PasswordConfirm" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ValidationGroup="Account" />
                    <asp:CompareValidator ID="PasswordMatch" runat="server" ControlToValidate="Password" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" ControlToCompare="PasswordConfirm" ErrorMessage="Passwords don't match." ValidationGroup="Account" />
                </div>
            </div>
            
            <div class="row justify-content-between pr-3 pl-3">
                <a href="Default.aspx" class="btn btn-info float-left">Login</a>
                <asp:Button runat="server" ID="submit" CommandName="Register" CssClass="btn btn-default btn-primary float-right" Text="Register" OnClientClick="return validation()" />
            </div>
        </form>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <script type="text/javascript">
            function validation() {
                var isValid = false;
                isValid = Page_ClientValidate('Personal');

                if(isValid) {
                    isValid = Page_ClientValidate('Account');
                }

                return isValid;
            }
        </script>
    </body>
</html>
