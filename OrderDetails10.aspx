<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MasterDetails10.aspx.vb" Inherits="MasterDetails10" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

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
        </div>
    <div style="padding: 40px 0 0 40px;">
    

    <h2>CUSTOMER ORDERS MASTER DERTAILS </h2>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/ProjectDatabaseNew1.mdb" 
            SelectCommand="SELECT Orders.OrderID, Customers.CustomerID, Orders.Item FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID">
        </asp:AccessDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" 
            DataSourceID="AccessDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/ProjectDatabaseNew1.mdb" 
            SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="OrderID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="OrderID" DataSourceID="AccessDataSource2">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="StockID" HeaderText="StockID" 
                    SortExpression="StockID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
