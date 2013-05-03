<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <form id="Form1" runat="server">
    <div class="page"> 
     <img src="images/logo.jpg" width="800" height="160" />
     &nbsp;<div class="header">
            <div class="title">
                <h1>
                    COMPANY INTRANET (Ireland)
                </h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Authenticate.aspx" Text="Home">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/About.aspx" Text="About"/>
                         <asp:MenuItem Text="Sales Staff">
                             <asp:MenuItem NavigateUrl="~/Search.aspx" Text="Search National Customers" 
                                 Value="Search National Customers"></asp:MenuItem>
                             <asp:MenuItem NavigateUrl="~/customers.aspx" Text="Search International Customers" 
                                 Value="Search Intational Customers"></asp:MenuItem>
                             <asp:MenuItem NavigateUrl="~/AddCustomer.aspx" Text="Add New Customer" 
                                 Value="Add New Customer"></asp:MenuItem>
                             <asp:MenuItem NavigateUrl="~/ExportDataToXML9.aspx" 
                                 Text="Current Stock (XML &amp; Table format)" 
                                 Value="Current Stock (XML &amp; Table format)"></asp:MenuItem>
                             <asp:MenuItem NavigateUrl="~/OrderDetails10.aspx" 
                                 Text="Customer Orders (Master Details)" 
                                 Value="Customer Orders (Master Details)"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="Stock Control Staff" Value="New Item">
                            <asp:MenuItem NavigateUrl="~/NewStockItem5.aspx" Text="Add a New Stock Item" 
                                Value="Add a New Stock Item"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/ExportDataToXML9.aspx" 
                                Text="Current Stock (XML &amp; Table format)" 
                                Value="Current Stock (XML &amp; Table format)"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/DataEntry11.aspx" 
                                Text="Modify Stock (via Data Access layer)" 
                                Value="Modify Stock (via Data Access layer)"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/EditXML14.aspx" Text="Modify Stock  XML File" 
                                Value="Modify Stock (Method 2)"></asp:MenuItem>
                 <asp:MenuItem Text="Supplier Details (ADO.net)" 
                                Value="Supplier Details (ADO.net)" NavigateUrl="~/Accessconnection.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </div>    <div style="padding: 40px 0 0 40px;">
    
        <br />
        <br />
        <h2>SEARCH FOR LOCAL CUSTOMERS</h2>
        <br />
        Please enter name of town/city to display customer details. 
        <br />
        <br />
        <br />
    
        <asp:TextBox ID="TextSearch" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/ProjectDatabaseNew1.mdb" 
            DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT * FROM [Customers] WHERE ([City] = ?)" 
            UpdateCommand="UPDATE [Customers] SET [Firstname] = ?, [Surname] = ?, [City] = ?, [Email] = ?, [Telephone] = ? WHERE [CustomerID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextSearch" Name="City" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Surname" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CustomerID" DataSourceID="AccessDataSource1">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" 
                    SortExpression="Surname" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                    SortExpression="Telephone" />
            </Columns>
        </asp:GridView>
        <br />
    
    </div>
    </form>
    </div>
</body>
</html>
