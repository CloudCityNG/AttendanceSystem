<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsAttendance.aspx.cs" Inherits="students.Pages.StudentsAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students Attendance System</title>
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
                        <ul class="nav-pills nav-stacked" style="list-style-type: none;">
                            <li><a href="#">link1</a></li>
                            <li><a href="#">link2</a></li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="Results.aspx"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cloud-download fa-stack-1x "></i></span>Attendance Records</a>
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
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:Button ID="RefereshButton" Text="Referesh" runat="server" CssClass="btn btn-link pull-right" OnClick="RefereshButton_Click1" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <asp:Label ID="Message" runat="server" CssClass="text-success"></asp:Label>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    Attendance Form
                                </div>
                                <div class="panel-body">
                                    <asp:GridView ID="Attendance" runat="server" AutoGenerateColumns="false" DataKeyNames="StudentId" CssClass="table table-striped table-bordered table-hover">
                                        <Columns>
                                            <asp:BoundField DataField="StudentId" HeaderText="Student Id" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="150px" />

                                            <asp:TemplateField HeaderText="Present/Absent">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelect" runat="server" Checked="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:Button ID="SaveData" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="SaveData_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
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
