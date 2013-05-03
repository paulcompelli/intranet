<%@ Page Language="VB" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<head>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: left;
        }
    </style>
</head>

<script runat=server>
   private i, j as integer
   private strOutput as string = ""
   public xmldoc as new XMLDataDocument()
   
   sub Page_Load(Sender as Object, e as EventArgs)
      if not Page.IsPostBack then
         GetData()
         BindControl()
      end if
   end sub
   
   sub UpdateBtn_Click(Sender as Object, e as EventArgs)
        Dim StockID As TextBox
        Dim Description As TextBox
        Dim Style As TextBox
        Dim Stock_level As TextBox
      
      GetData()
      'update data
      For i = 0 To DataGrid1.Items.Count-1
            StockID = DataGrid1.Items(i).FindControl("StockID")
            Description = DataGrid1.Items(i).FindControl("Description")
            Stock_level = DataGrid1.Items(i).FindControl("Stock_level")
      
            xmldoc.DataSet.Tables(0).Rows(i)("StockID") = StockID.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Description") = Description.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Stock_level") = Stock_level.Text
      Next
      
      try
            xmldoc.Save(Server.MapPath("Stock.xml"))
      catch
         output.Text = "Error updating data"
      end try
      
      BindControl()
   end sub
   
   sub GetData()
      try
            xmldoc.DataSet.ReadXml(Server.MapPath("Stock.xml"))
      catch ex as Exception
         output.Text = "Error accessing XML file"
      end try
   end sub
   
   sub BindControl()
      DataGrid1.DataSource = xmldoc.DataSet
      DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
      DataGrid1.DataBind()
   end sub
</script>

<html>
<body>
   <asp:Label id="output" runat="server" />
   <form id="Form1" runat="server">
       <div class="page"> 
     <img src="images/logo.jpg" width="800" height="160" />
     &nbsp;<div class="header" style="margin-bottom: 50px;">
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
        <h2 class="style1">MODIFY STOCK (XML)</h2>
           
               <p>&nbsp;</p>
   <asp:DataGrid id="DataGrid1" runat="server" 
  
      GridLines="Vertical" 
      HeaderStyle-BackColor="#cccc99"
      ItemStyle-BackColor="#ffffff"
      AlternatingItemStyle-Backcolor="#cccccc" 
      AutogenerateColumns="False" AllowSorting="True" CellPadding="3" 
       ForeColor="Black" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="1px" style="text-align: left" >
<AlternatingItemStyle BackColor="#CCCCCC"></AlternatingItemStyle>
      <Columns>
         <asp:TemplateColumn HeaderText="StockID">
            <ItemTemplate>
               <asp:TextBox id="StockID" runat="server" 
                  Text='<%# Container.DataItem("StockID") %>' />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Description">
            <ItemTemplate>
               <asp:TextBox id="Description" runat="server" 
                  Text='<%# Container.DataItem("Description") %>' 
                  width="175px" />
            </ItemTemplate>
         </asp:TemplateColumn>
         <asp:TemplateColumn HeaderText="Stock_level">
            <ItemTemplate>
               <asp:TextBox id="Stock_level" runat="server" 
                  Text='<%# Container.DataItem("Stock_level") %>'
                  width="50px" />
            </ItemTemplate>
         </asp:TemplateColumn>
      </Columns>     
       <FooterStyle BackColor="#CCCCCC" />

<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

       <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
       <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
       
   </asp:DataGrid>
               <br />
           
   <br />
   <center style="text-align: left">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Button id="update" runat="server"
      OnClick="UpdateBtn_Click"
      text="Update!" />
   </center>
   </div>
   </form>
 
</body>
</html>

