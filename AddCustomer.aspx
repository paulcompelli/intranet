<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddCustomer.aspx.vb" Inherits="AddCustomer" %>

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
    <h2> ADDING A NEW CUSTOMER</h2>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/ProjectDatabaseNew1.mdb" 
            DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ?" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT * FROM [Customers]" 
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
        <br />
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataKeyNames="CustomerID" DataSourceID="AccessDataSource1" 
            style="text-align: right" CellPadding="4" ForeColor="#ffffff" 
            Width="257px">
            <EditItemTemplate>
                CustomerID:
                <asp:Label ID="CustomerIDLabel1" runat="server" 
                    Text='<%# Eval("CustomerID") %>' />
                <br />
                Firstname:
                <asp:TextBox ID="FirstnameTextBox" runat="server" 
                    Text='<%# Bind("Firstname") %>' />
                <br />
                Surname:
                <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' />
                <br />
                City:
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                Telephone:
                <asp:TextBox ID="TelephoneTextBox" runat="server" 
                    Text='<%# Bind("Telephone") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#ffca73" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                CustomerID:&nbsp;&nbsp;
                <asp:TextBox ID="CustomerIDTextBox" runat="server" Height="30px" 
                    style="text-align: left" Text='<%# Bind("CustomerID") %>' Width="250px" />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="CustomerIDTextBox" ErrorMessage="Cannot be blank"></asp:RequiredFieldValidator>
                <br />
                Firstname:&nbsp;&nbsp;
                <asp:TextBox ID="FirstnameTextBox" runat="server" Height="30px" 
                    Text='<%# Bind("Firstname") %>' Width="250px" />
                <br />
                <br />
                Surname:&nbsp;&nbsp;<asp:TextBox ID="SurnameTextBox" runat="server" Height="30px" 
                    Text='<%# Bind("Surname") %>' Width="250px" />
                <br />
                <br />
                City:&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="CityTextBox" runat="server" Height="30px" 
                    Text='<%# Bind("City") %>' Width="250px" />
                <br />
                <br />
                Email:&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="EmailTextBox" runat="server" Height="30px" 
                    Text='<%# Bind("Email") %>' Width="250px" />
                <br />
                <br />
                Telephone:&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TelephoneTextBox" runat="server" Height="30px" 
                    Text='<%# Bind("Telephone") %>' Width="250px" />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                   
            </InsertItemTemplate>

            <ItemTemplate>
                CustomerID:
                <asp:Label ID="CustomerIDLabel" runat="server" 
                    Text='<%# Eval("CustomerID") %>' />
                <br />

                Firstname:
                <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' />
                <br />
                Surname:
                <asp:Label ID="SurnameLabel" runat="server" Text='<%# Bind("Surname") %>' />
                <br />
                City:
                <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                Telephone:
                <asp:Label ID="TelephoneLabel" runat="server" Text='<%# Bind("Telephone") %>' />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#a66800" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:FormView>
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
