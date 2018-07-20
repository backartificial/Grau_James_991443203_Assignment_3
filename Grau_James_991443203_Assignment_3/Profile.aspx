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
                <div class="col-lg-3 bg-light ml-2">
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

                <div class="col-lg-5 bg-light mr-2 ml-2">
                    <!--<form id="profile" runat="server" class="col-lg-4 bg-light pt-2 pb-2 rounded">
                    <div class="modal-header">
                        <h5 class="modal-title">Sheridan Car Sales</h5>
                    </div>
                
                    <%= Session["id"] %>
                    <%= Session["username"] %>
                
                    <div class="form-group">
                        <label for="brand">Brand</label>
                        <input type="text" class="form-control" id="brand" placeholder="Brand" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="model">Model</label>
                        <input type="text" class="form-control" id="model" placeholder="Model" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="year">Year</label>
                        <input type="number" class="form-control" id="year" min="1886" step="1" placeholder="Year" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="color">Color</label>
                        <input type="text" class="form-control" id="color" placeholder="Color" runat="server" />
                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">$</span>
                            </div>

                            <input type="number" class="form-control" id="price" min="0" step="0.01" placeholder="Price" runat="server" />
                        </div>
                    </div>
            
                    <button type="submit" class="btn btn-success float-right">Register</button>
                    <br />
                    <br />
                </form>-->
                </div>

                <div class="col-lg-4 bg-light mr-2">
                    <ul class="list-group" id="previousOrders"></ul>
                </div>
            </div>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>