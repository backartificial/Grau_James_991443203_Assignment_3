<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Profile" %>

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
                    <div class="bg-light pt-1 pr-2 pb-1 pl-2 h-100">
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
                    <div class="bg-light pt-1 pr-2 pb-1 pl-2 h-100">
                        <form id="placeOrder" runat="server" class="bg-light">
                            <div class="modal-header pb-1 mb-2">
                                <h5 class="modal-title">Place an Order</h5>
                            </div>

                            <div runat="server" id="placeOrderErrors" class="mb-2 alert alert-danger d-none"></div>
                
                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="brand">Brand</label>
                                    <input type="text" class="form-control" id="brand" placeholder="Brand" runat="server" required autofocus />
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="model">Model</label>
                                    <input type="text" class="form-control" id="model" placeholder="Model" runat="server" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="year">Year</label>
                                <select name="year" class="custom-select" id="year" required>
                                    <option selected disabled>Select Year</option>

                                    <% for(int i = (DateTime.Now.Year + 1); i >= 1886 ; i--) %>
                                            <% { Response.Write("<option value=\"" + i.ToString() + "\">" + i.ToString() + "</option>"); } %>
                                </select>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-6">
                                    <label for="color">Color</label>
                                    <input type="text" class="form-control" id="color" placeholder="Color" runat="server" required />
                                </div>

                                <div class="form-group col-lg-6">
                                    <label for="price">Price</label>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">$</span>
                                        </div>

                                        <input type="number" class="form-control" id="price" min="0" step="0.01" placeholder="Price" runat="server" required />
                                    </div>
                                </div>
                            </div>
            
                            <div class="row">
                                <div class="col-lg-12">
                                    <button type="submit" class="btn btn-info float-right mb-2" id="placeOrderSubmit">Place Order</button>
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

                        <ul class="list-group" id="previousOrders" runat="server"></ul>
                    </div>
                </div>
            </div>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>