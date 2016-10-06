<%
'Declare variables
Dim rs
Dim conn
'handle errors
On Error Resume next
'Set Object reference
Set rs = CreateObject("ADODB.Recordset")

'Open the database and query records
conn = "DSN=LOCAL_PUBS_TEST"
rs.Open "SELECT au_id,au_lname,au_fname FROM authors", conn
           
Select CASE Err.Number
       CASE 0
           Response.Write "ODBC Connection succeded."
       CASE Else
           Response.Write "ODBC Connection failed : " & _
           Err.Number & " - " & Err.Description
End Select

'clean up
rs.Close
Set rs = Nothing
%>
