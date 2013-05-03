Imports System.Data.OleDb

Partial Class customers
    Inherits System.Web.UI.Page

    Protected Sub btnCustomerSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCustomerSubmit.Click
        If (tbSearchCustomerRecords.Text.Length = 0) Then
            CustomersGridView.DataSourceID = "CustomerDataSourceRepeater"
            lblStatusText.Text = "Displaying All Results"
        Else
            CustomersGridView.DataSourceID = "searchCustomerDataSource"
            lblStatusText.Text = "Displaying Search Results"
        End If
    End Sub

    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function SearchCustomers(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As OleDbConnection = New OleDbConnection
        conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=|DataDirectory|Northwind.mdb;"
        Dim cmd As OleDbCommand = New OleDbCommand
        cmd.CommandText = "select ContactName from Customers where" & _
        " ContactName like @SearchText + '%'"
        cmd.Parameters.AddWithValue("@SearchText", prefixText)
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As OleDbDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("ContactName").ToString)
        End While
        conn.Close()
        Return customers
    End Function




End Class
