<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Grau_James_991443203_Assignment_3.Profile" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>Profile | Sheridan Cars</title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
        <link href="Content/custom.css" rel="stylesheet" />
    </head>

    <body class="bg-dark">
        <div class="d-flex justify-content-center row">
            <form id="profile" runat="server" class="col-lg-4 bg-light pt-2 pb-2 rounded">
                <div class="modal-header">
                    <h5 class="modal-title">Sheridan Car Sales</h5>
                </div>
                
                <%= Session["id"] %>
                <%= Session["name"] %>
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
            </form>
        </div>

        <script src="Scripts/jquery-3.0.0.js"></script>
        <script src="Scripts/popper.js"></script>
        <script src="Scripts/bootstrap.js"></script>
    </body>
</html>
