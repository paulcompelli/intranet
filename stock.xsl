<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>My CD Collection</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Stock ID</th>
        <th>Description</th>
		<th>Stock Level</th>
        
      </tr>
      <xsl:for-each select="NewDataSet/Stock">
        <tr>
          <td><xsl:value-of select="StockID"/></td>
          <td><xsl:value-of select="Description"/></td>
		  <td><xsl:value-of select="Stock_level"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>


