<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Profile" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Profile | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body class="bg-dark">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-2">
            <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarSupportedContent">
                <span class="navbar-text">
                    Welcome to Sheridan Cars, <%= Session["name"] %>!
                </span>

                <a href="Logout.aspx" class="btn btn-outline-primary">Logout</a>
            </div>
        </nav>

        <div class="container-flex">
            <div class="row">
                <div class="col-lg-4">
                    <div class="bg-light pt-1 pr-2 pl-2">
                        <div class="modal-header pb-1 mb-2">
                            <h5 class="modal-title">Account Information</h5>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <tbody>
                                    <tr><td><b>Name</b></td><td><%= Session["name"] %></td></tr>
                                    <tr><td><b>Username</b></td><td><%= Session["username"] %></td></tr>
                                    <tr><td><b>Email Address</b></td><td><%= Session["email"] %></td></tr>
                                    <tr><td><b>Phone Number</b></td><td><%= Session["phoneNumber"] %></td></tr>
                                    <tr><td><b>Address</b></td><td><%= Session["address"] %></td></tr>
                                    <tr><td><b>Postal Code</b></td><td><%= Session["postalCode"] %></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="bg-light pt-1 pr-2 pb-2 pl-2">
                        <form id="placeOrder" runat="server" class="bg-light">
                            <div class="modal-header pb-1 mb-2">
                                <h5 class="modal-title">Place an Order</h5>
                            </div>

                            <div runat="server" id="placeOrderErrors" class="mb-2 alert alert-danger d-none"></div>
                            <asp:ValidationSummary runat="server" ID="ValidationSummaryPurchase" Display="Dynamic" DisplayMode="BulletList" ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" />
                
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label>Brand</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="Brand" placeholder="Brand" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" runat="server" ErrorMessage="Please enter the Brand." ControlToValidate="Brand" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
                                </div>

                                <div class="form-group col-lg-6">
                                    <label>Model</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="Model" placeholder="Model" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorModel" runat="server" ErrorMessage="Please enter the Model." ControlToValidate="Model" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Year</label>

                                <asp:TextBox runat="server" CssClass="form-control" ID="Year" placeholder="Year" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorYear" runat="server" ErrorMessage="Please enter the Year." ControlToValidate="Year" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
                                <asp:RangeValidator id="YearRange" ControlToValidate="Year" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" MinimumValue="1886" MaximumValue="2018" Type="Double" ErrorMessage="Year must be between 1886 and 2018." runat="server"/>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label>Color</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="Color" placeholder="Color" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorColor" runat="server" ErrorMessage="Please enter the Color." ControlToValidate="Color" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
                                </div>

                                <div class="form-group col-lg-6">
                                    <label>Price</label>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>

                                        <asp:TextBox runat="server" CssClass="form-control" ID="Price" placeholder="Price" />
                                    </div>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Please enter the Price." ControlToValidate="Price" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" />
                                    <asp:RangeValidator id="RangeValidatorPrice" ControlToValidate="Price" Display="Dynamic" SetFocusOnError="True" CssClass="text-danger" MinimumValue="0" MaximumValue="999999999.99" Type="Currency" ErrorMessage="Must be free (0) or more." runat="server"/>
                                </div>
                            </div>
            
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Button runat="server" ID="PlaceOrderBtn" CommandName="PlaceOrder" CssClass="btn btn-info float-right mb-2" Text="Place Order" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-lg-4 pr-2 pl-2">
                    <div class="bg-light pt-1 pr-2 pb-1 pl-2 h-100">
                        <div class="modal-header pb-1 mb-2">
                            <h5 class="modal-title">Previous Orders</h5>
                        </div>

                        <div class="list-group list-group-flush" id="previousOrders" runat="server"></div>
                    </div>
                </div>
            </div>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
        <script src="Scripts/timeago.js"></script>

        <script>
            $(document).ready(function() {
                $("time.timeago").timeago();
            });
        </script>
    </body>
</html>