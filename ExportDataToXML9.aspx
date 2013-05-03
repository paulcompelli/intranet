<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<head>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    Dim strConnection As String
    Dim strSQL        As String
    Dim objDataSet    As New DataSet()
    Dim objConnection As OleDbConnection
    Dim objAdapter    As OleDbDataAdapter

    ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
                        "Data Source=|DataDirectory|ProjectDatabaseNew1.mdb;"
        strSQL = "SELECT StockID, Description, Stock_level FROM Stock;"

    ' open the connection and set the command
    objConnection = New OledbConnection(strConnection)
    objAdapter = New OledbDataAdapter(strSQL, objConnection)

    ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Stock")
        ' create an XML file called STOCK and fill this with our data
        objDataSet.WriteXml(Server.MapPath("Stock.xml"))
    ' add a link to our web page to the XML file created
    Response.Write("<a href='Stock.xml'>View XML file</a>")
        ' Response.Write will inject the output at the top of the apsx when it is rendered, before the opening <html> tag. 
  End Sub

</script>


<!-- TOOLS > OPTIONS > ENVIRONMENT > DOCUMENTS > UNCHECK DETECT WHEN FILE IS CHANGES OUTSIDE ENVIRONMENT -->
<p><a href="stock.htm">View Styled XML file</a></p>



