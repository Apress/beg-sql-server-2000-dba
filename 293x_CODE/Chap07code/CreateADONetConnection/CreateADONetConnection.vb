Imports System.Data.SqlClient

Module Module1

    Sub Main()
        Try
            ' ADO.NET SQL Server-optimized connection object
            Dim conn As New SqlConnection("Initial Catalog=pubs;" _
                     & "Data Source =(local);Integrated Security=SSPI")
            conn.Open()

            ' Command object
            Dim command As New SqlCommand("SELECT au_id,au_lname,au_fname" _
                                        & " FROM authors", conn)
            ' Datareader object
            Dim reader As SqlDataReader = _
                   command.ExecuteReader(CommandBehavior.CloseConnection)

            ' Output datareader values
            While reader.Read()
                Console.WriteLine(reader.GetSqlValue(1))
            End While

            ' Tidy & pause
            conn.Close()
            Console.ReadLine()

            ' Catch any errors
        Catch ex As Exception
            Console.WriteLine("Exception: " & ex.Message)
            Console.WriteLine(ex.ToString)
            Console.ReadLine()
        End Try

    End Sub

End Module
