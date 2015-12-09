<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="students.Pages.Results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Resources/css/simple-sidebar.css" rel="stylesheet" />
    <link href="../Resources/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Resources/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default no-margin">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header fixed-brand">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" id="menu-toggle">
                    <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
                </button>
                <a class="navbar-brand" href="#"><i class="fa fa-rocket fa-4"></i>Student Attendance System</a>
            </div>
            <!-- navbar-header-->

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2"><span class="glyphicon glyphicon-th-large" aria-hidden="true"></span></button>
                    </li>
                </ul>
            </div>
            <!-- bs-example-navbar-collapse-1 -->
        </nav>
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav nav-pills nav-stacked" id="menu">

                    <li class="active">
                        <a href="StudentsAttendance.aspx"><span class="fa-stack fa-lg pull-left"><i class="fa fa-dashboard fa-stack-1x "></i></span>Dashboard</a>

                    </li>
                    <li>
                        <a href="Results.aspx"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cloud-download fa-stack-1x "></i></span>Attendance Records</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cloud-download fa-stack-1x "></i></span>Overview</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cart-plus fa-stack-1x "></i></span>Events</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-youtube-play fa-stack-1x "></i></span>About</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left fa-spin"><i class="fa fa-wrench fa-stack-1x "></i></span>Services</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left fa-spin"><i class="fa fa-server fa-stack-1x "></i></span>Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid xyz">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-striped table-bordered table-hover">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>

                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="Present_Days" HeaderText="Present Days" SortExpression="Present_Days" ItemStyle-CssClass="success"></asp:BoundField>
                            <asp:BoundField DataField="Absent_Days" HeaderText="Absent Days" SortExpression="Absent_Days" ItemStyle-CssClass="danger"></asp:BoundField>
                        </Columns>

                    </asp:GridView>
                    
                </div>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
    </form>
    <script src="../Resources/dist/js/bootstrap.min.js"></script>
    <script src="../Resources/js/jquery-1.10.1.min.js"></script>
    <script src="../Resources/js/sidebar_menu.js"></script>
</body>
</html>
