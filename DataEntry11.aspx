<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DataEntry11.aspx.vb" Inherits="DataEntry11" %>

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
                             <asp:MenuItem NavigateUrl="~/Accessconnection.aspx" Text="Supplier Details (ADO.net)" 
                                Value="Supplier Details (ADO.net)" ></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
        </div>
    <div style="padding: 80px 0 0 80px;">
    <h2>MODIFYING STOCK </h2>
        <h2>(VIA DATA ACCESS LAYER)</h2>
        <p>&nbsp;</p>
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server">
        </asp:AccessDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataKeyNames="StockID" DataSourceID="ObjectDataSource1" 
            style="text-align: right; margin-right: 101px; margin-bottom: 43px" 
            CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                StockID:
                <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                Stock_level:
                <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                SupplierID:
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                StockID:
                <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
                <br />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                <br />
                Price:
                <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                <br />
                Stock_level:
                <asp:TextBox ID="Stock_levelTextBox" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                <br />
                SupplierID:
                <asp:TextBox ID="SupplierIDTextBox" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                StockID:
                <asp:Label ID="StockIDLabel" runat="server" Text='<%# Eval("StockID") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                <br />
                Stock_level:
                <asp:Label ID="Stock_levelLabel" runat="server" 
                    Text='<%# Bind("Stock_level") %>' />
                <br />
                SupplierID:
                <asp:Label ID="SupplierIDLabel" runat="server" 
                    Text='<%# Bind("SupplierID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetStock" 
            TypeName="DataSet1TableAdapters.StockTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_StockID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StockID" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Price" Type="String" />
                <asp:Parameter Name="Stock_level" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="String" />
                <asp:Parameter Name="Original_StockID" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
